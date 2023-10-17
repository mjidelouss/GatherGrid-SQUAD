package com.squad.squad.service;

import com.squad.squad.domain.Event;
import com.squad.squad.repository.EventRepository;

import java.util.Date;
import java.util.List;

public class EventService {
    private final EventRepository eventRepository;

    public EventService() {
        eventRepository = new EventRepository();
    }

    public Event saveEvent(Event event) {
        return eventRepository.saveEvent(event);
    }

    public List<Event> searchEvents(String name, Date date, String hour, String place) {
        String jpql = "SELECT e FROM Event e WHERE 1=1";
        if (name != null && !name.isEmpty()) {
            jpql += " AND e.name LIKE :name";
        }
        if (date != null) {
            jpql += " AND e.date = :date";
        }
        if (hour != null && !hour.isEmpty()) {
            jpql += " AND e.hour = :hour";
        }
        if (place != null && !place.isEmpty()) {
            jpql += " AND e.place LIKE :place";
        }
        return eventRepository.searchEvents(name, date, hour, place, jpql);
    }
    public Event updateEvent(Event event, Long id) {

        return eventRepository.updateEvent(event, id);
    }
    public void deleteEvent(Long id) {
        eventRepository.deleteEvent(id);
    }
    public List<Event> getAllEvents() {
        return eventRepository.getAllEvents();
    }
}
