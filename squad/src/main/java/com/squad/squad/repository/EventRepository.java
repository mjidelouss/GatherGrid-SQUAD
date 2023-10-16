package com.squad.squad.repository;
import com.squad.squad.domain.Event;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class EventRepository {
    private final EntityManagerFactory entityManagerFactory;
    public EventRepository(){
        entityManagerFactory= Persistence.createEntityManagerFactory("default");
    }

    public Event getEvent(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Event event = entityManager.find(Event.class, id);
        entityManager.close();
        return event;
    }

    public List<Event> getAllEvents() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<Event> events = entityManager.createQuery("SELECT e FROM Event e, Event.class").getResultList();
        entityManager.close();
        return events;
    }
    public Event saveEvent(Event event) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(event);
        entityManager.getTransaction().commit();
        entityManager.close();
        return event;
    }

    public Event updateEvent(Event updatedEvent, Long eventId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Event event = getEvent(eventId);
        if (event != null) {
            event.setName(updatedEvent.getName());
            event.setPlace(updatedEvent.getPlace());
            event.setCategory(updatedEvent.getCategory());
            event.setDate(updatedEvent.getDate());
            event.setHour(updatedEvent.getHour());
            event.setDescription(updatedEvent.getDescription());
            entityManager.merge(event);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
        return event;
    }
    public void deleteEvent(Long eventId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Event event = getEvent(eventId);
        if (event != null) {
            entityManager.remove(event);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
