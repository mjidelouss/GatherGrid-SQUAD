package com.squad.squad.service;

import com.squad.squad.domain.Ticket;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class TicketService {

    private final EntityManagerFactory entityManagerFactory;

    public  TicketService(){
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
    }


    public void saveTicket(Ticket ticket){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(ticket);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public Ticket findTicketById(Long Id){
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

    public void updateTicket(Ticket ticketUpdated, Long TicketId){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Ticket ticket = findTicketById(TicketId);
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

    public void deleteTicket(Long ticketId){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Ticket ticket = findTicketById(ticketId);
        if (ticket != null){
            entityManager.remove(ticket);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }

}
