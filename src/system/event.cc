/*
 * This file is a part of the TChecker project.
 *
 * See files AUTHORS and LICENSE for copyright details.
 *
 */

#include "tchecker/system/event.hh"

namespace tchecker {

namespace system {

/* events_t */

void events_t::add_event(std::string const & name, tchecker::system::attributes_t const & attributes)
{
  tchecker::event_id_t id = _events_attributes.size();
  _events_index.add(name, id);
  _events_attributes.emplace_back(attributes);
}

tchecker::system::events_t::events_identifiers_range_t events_t::events_identifiers() const
{
  return tchecker::make_integer_range<tchecker::event_id_t>(0, events_count());
}

tchecker::system::attributes_t const & events_t::event_attributes(tchecker::event_id_t id) const
{
  if (id >= events_count())
    throw std::invalid_argument("Unknown event");
  return _events_attributes[id];
}

bool events_t::is_event(tchecker::event_id_t id) const { return (id < events_count()); }

bool events_t::is_event(std::string const & event) const
{
  return _events_index.find_key(event) != _events_index.end_key_map();
}

void tchecker::system::events_t::add_event(std::string const & name, tchecker::event_id_t id, tchecker::system::attributes_t const & attributes)
{
  if (is_event(name))
    throw std::invalid_argument("Event " + name + " already exists");

  if (id != _events_attributes.size())
    throw std::invalid_argument("Invalid event id");

  _events_index.add(name, id);
  _events_attributes.push_back(attributes);
}

bool tchecker::system::events_t::is_controllable(tchecker::event_id_t id) const
{
  if (!is_event(id))
    throw std::invalid_argument("Invalid event id");

  auto const & attributes = _events_attributes[id];
  auto range = attributes.range("controllable");
  
  for (auto it = range.begin(); it != range.end(); ++it) {
    if ((*it).value() == "true") {
      return true;
    }
  }
  
  return false;
}

} // end of namespace system

} // end of namespace tchecker
