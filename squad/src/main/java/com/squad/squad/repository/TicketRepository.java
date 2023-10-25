package com.squad.squad.repository;

import com.squad.squad.domain.Event;
import com.squad.squad.domain.Ticket;
import com.squad.squad.domain.enums.TicketType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class TicketRepository {
    private final EntityManagerFactory entityManagerFactory;

    public  TicketRepository(){
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
    }

    public List<Ticket> findByTicketType(TicketType ticketType) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<Ticket> tickets = entityManager.createQuery("SELECT t FROM Ticket t WHERE t.ticketType = :type", Ticket.class)
                .setParameter("type", ticketType)
                .getResultList();
        entityManager.close();
        return tickets;
    }


    public void save(Ticket ticket){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(ticket);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public Ticket findById(Long Id){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Ticket ticket = entityManager.find(Ticket.class, Id);
        entityManager.close();
        return ticket;
    }

    public List<Ticket> findAll(){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<Ticket> tickets = entityManager.createQuery("SELECT t FROM Ticket t", Ticket.class).getResultList();
        entityManager.close();
        return tickets;
    }

    public void update(Ticket ticketUpdated, Long TicketId){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Ticket ticket = findById(TicketId);
        if (ticket != null){
            ticket.setTicketType(ticketUpdated.getTicketType());
            ticket.setAvailableQuantity(ticketUpdated.getAvailableQuantity());
            ticket.setPrice(ticketUpdated.getPrice());
            ticket.setEvent(ticketUpdated.getEvent());
            entityManager.merge(ticket);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public void delete(Long ticketId){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Ticket ticket = findById(ticketId);
        if (ticket != null){
            entityManager.remove(ticket);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public List<Ticket> findByEvent(Event event){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<Ticket> tickets = entityManager.createQuery("SELECT t FROM Ticket t where t.event = :event ", Ticket.class)
                .setParameter("event", event)
                .getResultList();
        entityManager.close();
        return tickets;
    }
}
