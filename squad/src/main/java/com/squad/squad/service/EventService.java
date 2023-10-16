package com.squad.squad.service;

import com.squad.squad.repository.EventRepository;

public class EventService {
    private final EventRepository eventRepository;

    public EventService() {
        eventRepository = new EventRepository();
    }
}
