package com.squad.squad.service;
import com.squad.squad.repository.EventRepository;

public class EventService {
    public final EventRepository eventRepository;
    public EventService(){
        eventRepository = new EventRepository();
    }
}