package com.squad.squad.repository;
import com.squad.squad.domain.Event;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.Date;
import java.util.List;

public class EventRepository {
    private final EntityManagerFactory entityManagerFactory;
    public EventRepository(){
        entityManagerFactory= Persistence.createEntityManagerFactory("default");
    }

    public Event getEvent(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        return entityManager.find(Event.class, id);
    }

    public List<Event> getAllEvents() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
         return entityManager.createQuery("SELECT e FROM Event e, Event.class").getResultList();
    }

    public List<Event> searchEvents(String name, Date date, String hour, String place, String jpql) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TypedQuery<Event> query = entityManager.createQuery(jpql, Event.class);
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
