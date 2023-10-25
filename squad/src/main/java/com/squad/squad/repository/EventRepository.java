package com.squad.squad.repository;
import com.squad.squad.domain.Event;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.Date;
import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EventRepository {

    private final EntityManager em;
    public EventRepository(EntityManager em){
        this.em = em;
    }

    public Event getEvent(Long id) {
        return em.find(Event.class, id);
    }

    public List<Event> getEventsOfOrganiser(Long id) {
        return em.createQuery("SELECT e FROM Event e WHERE e.organiser.id = id", Event.class).getResultList();
    }
    public List<Event> getAllEvents() {
         return em.createQuery("SELECT e FROM Event e", Event.class).getResultList();
    }

    public List<Event> searchEvents(String name, Date date, String hour, String place, String jpql) {
        TypedQuery<Event> query = em.createQuery(jpql, Event.class);
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (date != null) {
            query.setParameter("date", date);
        }
        if (hour != null && !hour.isEmpty()) {
            query.setParameter("hour", hour);
        }
        if (place != null && !place.isEmpty()) {
            query.setParameter("place", "%" + place + "%");
        }
        return query.getResultList();
    }
    public Event saveEvent(Event event) {
        em.getTransaction().begin();
        em.persist(event);
        em.getTransaction().commit();
        return event;
    }

    public Event updateEvent(Event updatedEvent, Long eventId) {
        em.getTransaction().begin();
        Event event = getEvent(eventId);
        if (event != null) {
            event.setName(updatedEvent.getName());
            event.setPlace(updatedEvent.getPlace());
            event.setCategory(updatedEvent.getCategory());
            event.setDate(updatedEvent.getDate());
            event.setHour(updatedEvent.getHour());
            event.setDescription(updatedEvent.getDescription());
            event.setCategory(updatedEvent.getCategory());
            em.merge(event);
        }
        em.getTransaction().commit();
        return event;
    }
    public void deleteEvent(Long eventId) {
        em.getTransaction().begin();
        Event event = getEvent(eventId);
        if (event != null) {
            em.remove(event);
        }
        em.getTransaction().commit();
    }
}

































