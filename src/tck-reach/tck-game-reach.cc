// src/tck-reach/tck-game-reach.cc
/*
 * This file is a part of the TChecker project.
 *
 * See files AUTHORS and LICENSE for copyright details.
 *
 */

#include <fstream>
#include <getopt.h>
#include <iostream>
#include <map>
#include <memory>
#include <string>
#include <stack>
#include <unordered_set>

#include "tchecker/algorithms/reach/algorithm.hh"
#include "tchecker/parsing/parsing.hh"
#include "tchecker/utils/log.hh"
#include "zg-reach.hh"
#include "tchecker/ta/system.hh"


/*!
 \file tck-game-reach.cc
 \brief Backward reachability analysis for timed games
 */

static struct option long_options[] = {
    {"algorithm", required_argument, 0, 'a'},
    {"certificate", required_argument, 0, 'C'},
    {"output", required_argument, 0, 'o'},
    {"help", no_argument, 0, 'h'},
    {"labels", required_argument, 0, 'l'},
    {"search-order", required_argument, 0, 's'},
    {"block-size", required_argument, 0, 0},
    {"table-size", required_argument, 0, 0},
    {0, 0, 0, 0}
};

static char const * const options = (char *)"a:C:hl:o:s:";

enum algorithm_t {
    ALGO_BW_REACH,
    ALGO_NONE,
};

enum certificate_t {
    CERTIFICATE_NONE,
    CERTIFICATE_GRAPH,
    CERTIFICATE_SYMBOLIC,
};

static enum algorithm_t algorithm = ALGO_NONE;
static bool help = false;
static enum certificate_t certificate = CERTIFICATE_NONE;
static std::string search_order = "bfs";
static std::string labels = "";
static std::string output_file = "";
static std::ostream * os = &std::cout;
static std::size_t block_size = 10000;
static std::size_t table_size = 65536;

void usage(char * progname)
{
    std::cerr << "Usage: " << progname << " [options] [file]" << std::endl;
    std::cerr << "   -a algorithm  reachability algorithm" << std::endl;
    std::cerr << "          bw-reach   backward reachability algorithm for timed games" << std::endl;
    std::cerr << "   -C type       type of certificate" << std::endl;
    std::cerr << "          none       no certificate (default)" << std::endl;
    std::cerr << "          graph      graph of explored state-space" << std::endl;
    std::cerr << "          symbolic   symbolic counter-example" << std::endl;
    std::cerr << "   -h            help" << std::endl;
    std::cerr << "   -l l1,l2,...  comma-separated list of searched labels" << std::endl;
    std::cerr << "   -o out_file   output file for certificate (default is standard output)" << std::endl;
    std::cerr << "   -s bfs|dfs    search order" << std::endl;
    std::cerr << "   --block-size  size of allocation blocks" << std::endl;
    std::cerr << "   --table-size  size of hash tables" << std::endl;
    std::cerr << "reads from standard input if file is not provided" << std::endl;
}

int parse_command_line(int argc, char * argv[])
{
    while (true) {
        int long_option_index = -1;
        int c = getopt_long(argc, argv, options, long_options, &long_option_index);

        if (c == -1)
            break;

        if (c == ':')
            throw std::runtime_error("Missing option parameter");
        else if (c == '?')
            throw std::runtime_error("Unknown command-line option");
        else if (c != 0) {
            switch (c) {
            case 'a':
                if (strcmp(optarg, "bw-reach") == 0)
                    algorithm = ALGO_BW_REACH;
                else
                    throw std::runtime_error("Unknown algorithm: " + std::string(optarg));
                break;
            case 'C':
                if (strcmp(optarg, "none") == 0)
                    certificate = CERTIFICATE_NONE;
                else if (strcmp(optarg, "graph") == 0)
                    certificate = CERTIFICATE_GRAPH;
                else if (strcmp(optarg, "symbolic") == 0)
                    certificate = CERTIFICATE_SYMBOLIC;
                else
                    throw std::runtime_error("Unknown type of certificate: " + std::string(optarg));
                break;
            case 'h':
                help = true;
                break;
            case 'l':
                labels = optarg;
                break;
            case 'o':
                output_file = optarg;
                break;
            case 's':
                search_order = optarg;
                break;
            default:
                throw std::runtime_error("This should never be executed");
            }
        }
        else {
            if (strcmp(long_options[long_option_index].name, "block-size") == 0)
                block_size = std::strtoull(optarg, nullptr, 10);
            else if (strcmp(long_options[long_option_index].name, "table-size") == 0)
                table_size = std::strtoull(optarg, nullptr, 10);
            else
                throw std::runtime_error("This also should never be executed");
        }
    }
    return optind;
}

class state_sptr_hash_t {
public:
    std::size_t operator()(tchecker::zg::state_sptr_t const & s) const {
        return tchecker::zg::hash_value(*s);
    }
};

class state_sptr_equal_t {
public:
    bool operator()(tchecker::zg::state_sptr_t const & s1, tchecker::zg::state_sptr_t const & s2) const {
        return *s1 == *s2;
    }
};

std::shared_ptr<tchecker::parsing::system_declaration_t> load_system_declaration(std::string const & filename)
{
    try {
        return tchecker::parsing::parse_system_declaration(filename);
    }
    catch (std::exception const & e) {
        std::cerr << tchecker::log_error << e.what() << std::endl;
        return nullptr;
    }
}

bool blocks_progress(std::shared_ptr<tchecker::ta::system_t const> const & system,
                    std::shared_ptr<tchecker::zg::zg_t> const & zg,
                    tchecker::zg::state_sptr_t const & state,
                    tchecker::event_id_t event_id,
                    const std::unordered_set<tchecker::zg::state_sptr_t, state_sptr_hash_t, state_sptr_equal_t>& current_attractor,
                    std::unordered_set<tchecker::zg::state_sptr_t, state_sptr_hash_t, state_sptr_equal_t>& loop_detection) {
    // If the event is controllable, never block it
    if (system->is_event_controllable(event_id)) {
        return false;
    }

    // If we've seen this state in the current uncontrollable path, block it
    if (loop_detection.find(state) != loop_detection.end()) {
        std::cout << "Blocking uncontrollable transition: loop detected" << std::endl;
        return true;
    }
    loop_detection.insert(state);

    // Get all possible successors
    std::vector<tchecker::zg::zg_t::sst_t> successors;
    tchecker::zg::const_state_sptr_t const_state{state};
    zg->next(const_state, successors);

    bool has_path_to_attractor = false;
    bool has_controllable_escape = false;

    for (auto && [status, succ_s, t] : successors) {
        const auto & vedge = t->vedge();
        tchecker::event_id_t succ_event_id = system->edge(vedge[0])->event_id();
        
        // Check if successor is in attractor
        bool in_attractor = (current_attractor.find(succ_s) != current_attractor.end());
        if (in_attractor) {
            has_path_to_attractor = true;
            if (system->is_event_controllable(succ_event_id)) {
                has_controllable_escape = true;
                break;  // Found a controllable escape to the attractor
            }
        }
    }

    // Block if either:
    // 1. No path to attractor exists at all, or
    // 2. We're in a loop and there's no controllable escape
    bool should_block = !has_path_to_attractor || 
                       (loop_detection.size() > 1 && !has_controllable_escape);

    if (should_block) {
        std::cout << "Blocking uncontrollable transition: " 
                  << (!has_path_to_attractor ? "no path to attractor" : "trapped in uncontrollable loop") 
                  << std::endl;
    }

    return should_block;
}


bool compute_backward(std::shared_ptr<tchecker::parsing::system_declaration_t> const & sysdecl, tchecker::algorithms::reach::stats_t& stats)
{
    std::shared_ptr<tchecker::ta::system_t const> system = std::make_shared<tchecker::ta::system_t const>(*sysdecl);
    std::shared_ptr<tchecker::zg::zg_t> zg{tchecker::zg::factory(system, tchecker::ts::SHARING, tchecker::zg::ELAPSED_SEMANTICS, tchecker::zg::NO_EXTRAPOLATION, block_size, table_size)};
    boost::dynamic_bitset<> accepting_labels = system->labels(labels);

    // Use two sets to track fixed point computation
    std::unordered_set<tchecker::zg::state_sptr_t, state_sptr_hash_t, state_sptr_equal_t> current_attractor;
    std::unordered_set<tchecker::zg::state_sptr_t, state_sptr_hash_t, state_sptr_equal_t> next_attractor;
    std::vector<tchecker::zg::zg_t::sst_t> v;

    // Initialize with final states
    zg->final(accepting_labels, v);
    for (auto && [status, s, t] : v) {
        current_attractor.insert(s);
    }
    v.clear();

    std::cout << "Starting backward reachability analysis" << std::endl;

    // Fixed-point computation for attractor
    bool fixed_point_reached = false;
    std::size_t iteration = 0;
    
    while (!fixed_point_reached) {
        std::cout << "\nIteration " << iteration++ << ": Current attractor size = " << current_attractor.size() << std::endl;
        
        next_attractor = current_attractor;  // Start with current attractor
        
        // Explore predecessors of all states in current attractor
        for (const auto& s_ptr : current_attractor) {
            tchecker::zg::const_state_sptr_t s{s_ptr};
            
            if (zg->is_initial(s)) {
                std::cout << "Initial state reached in iteration " << iteration << "!" << std::endl;
                stats.reachable() = true;
                return true;
            }

            // Get predecessors
            zg->prev(s, v);
            bool controllable_predecessor_exists = false;

            // First pass: look for controllable predecessors
            for (auto && [status, prev_s, t] : v) {
                const auto & vedge = t->vedge();
                tchecker::edge_id_t edge_id = vedge[0];
                tchecker::event_id_t event_id = system->edge(edge_id)->event_id();

                if (system->is_event_controllable(event_id)) {
                    controllable_predecessor_exists = true;
                    if (next_attractor.insert(prev_s).second) {
                        ++stats.visited_states();
                    }
                    ++stats.visited_transitions();
                }
            }

            // Second pass: handle uncontrollable predecessors
            if (!controllable_predecessor_exists) {
                std::unordered_set<tchecker::zg::state_sptr_t, state_sptr_hash_t, state_sptr_equal_t> loop_detection;
                bool has_winning_path = false;

                for (auto && [status, prev_s, t] : v) {
                    tchecker::edge_id_t edge_id = t->vedge()[0];
                    tchecker::event_id_t event_id = system->edge(edge_id)->event_id();

                    if (!system->is_event_controllable(event_id)) {
                        // Only add if it doesn't block progress
                        if (!blocks_progress(system, zg, prev_s, event_id, current_attractor, loop_detection)) {
                            if (next_attractor.insert(prev_s).second) {
                                ++stats.visited_states();
                                has_winning_path = true;
                            }
                            ++stats.visited_transitions();
                        }
                    }
                }

                // If no winning path exists through uncontrollable transitions,
                // remove all uncontrollable predecessors added in this iteration
                if (!has_winning_path) {
                    for (auto && [status, prev_s, t] : v) {
                        tchecker::edge_id_t edge_id = t->vedge()[0];
                        tchecker::event_id_t event_id = system->edge(edge_id)->event_id();
                        if (!system->is_event_controllable(event_id)) {
                            next_attractor.erase(prev_s);
                        }
                    }
                }
            }

            v.clear();
        }

        // Check fixed point
        fixed_point_reached = (current_attractor == next_attractor);
        
        if (fixed_point_reached) {
            std::cout << "Fixed point reached after " << iteration << " iterations" << std::endl;
        }

        current_attractor = std::move(next_attractor);
    }

    std::cout << "No initial state reached after exploring all states" << std::endl;
    std::cout << "Final attractor size: " << current_attractor.size() << std::endl;
    stats.reachable() = false;
    return false;
}



void backward_reach(std::shared_ptr<tchecker::parsing::system_declaration_t> const & sysdecl)
{
    tchecker::algorithms::reach::stats_t stats;
    stats.set_start_time();
    compute_backward(sysdecl, stats);
    stats.set_end_time();

    std::map<std::string, std::string> m;
    stats.attributes(m);
    for (auto && [key, value] : m)
        std::cout << key << " " << value << std::endl;

    // TODO: Implement certificate output
}

int main(int argc, char * argv[])
{
    try {
        int optindex = parse_command_line(argc, argv);

        if (argc - optindex > 1) {
            std::cerr << "Too many input files" << std::endl;
            usage(argv[0]);
            return EXIT_FAILURE;
        }

        if (help) {
            usage(argv[0]);
            return EXIT_SUCCESS;
        }

        std::string input_file = (optindex == argc ? "" : argv[optindex]);

        std::shared_ptr<tchecker::parsing::system_declaration_t> sysdecl{load_system_declaration(input_file)};

        if (!sysdecl || tchecker::log_error_count() > 0)
            return EXIT_FAILURE;

        std::shared_ptr<std::ofstream> os_ptr{nullptr};

        if (certificate != CERTIFICATE_NONE && output_file != "") {
            try {
                os_ptr = std::make_shared<std::ofstream>(output_file);
                os = os_ptr.get();
            }
            catch (std::exception & e) {
                std::cerr << tchecker::log_error << e.what() << std::endl;
                return EXIT_FAILURE;
            }
        }

        switch (algorithm) {
        case ALGO_BW_REACH:
            std::cout << "Running backward reachability algorithm" << std::endl;
            
            backward_reach(sysdecl);
            break;
        default:
            throw std::runtime_error("No algorithm specified");
        }
    }
    catch (std::exception & e) {
        std::cerr << tchecker::log_error << e.what() << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
