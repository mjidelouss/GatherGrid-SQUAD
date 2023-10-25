package com.squad.squad.repository;

import com.squad.squad.domain.Event;
import com.squad.squad.domain.Ticket;
import com.squad.squad.domain.enums.TicketType;
import jakarta.persistence.EntityManager;

import java.util.List;

public class TicketRepository {
    private final EntityManager em;
    public TicketRepository(EntityManager em){
        this.em = em;
    }

    public List<Ticket> findByTicketType(TicketType ticketType) {
        List<Ticket> tickets = em.createQuery("SELECT t FROM Ticket t WHERE t.ticketType = :type", Ticket.class)
                .setParameter("type", ticketType)
                .getResultList();
        return tickets;
    }


    public void save(Ticket ticket){
        em.getTransaction().begin();
        em.persist(ticket);
        em.getTransaction().commit();
    }

    public Ticket findById(Long Id){
        Ticket ticket = em.find(Ticket.class, Id);
        return ticket;
    }

    public Long getTicketId(Long id) {
        Ticket ticket = em.createQuery("SELECT t FROM Ticket t WHERE t.event.id = id", Ticket.class).getSingleResult();
        return ticket.getId();
    }
    public List<Ticket> findAll(){
        List<Ticket> tickets = em.createQuery("SELECT t FROM Ticket t", Ticket.class).getResultList();
        return tickets;
    }

    public void update(Ticket ticketUpdated){
            em.getTransaction().begin();
            em.merge(ticketUpdated);
            em.getTransaction().commit();
    }

    public void delete(Long ticketId){
        Ticket ticket = findById(ticketId);
        if (ticket != null){
            em.getTransaction().begin();
            em.remove(ticket);
            em.getTransaction().commit();
        }
    }

    public List<Ticket> findByEvent(Event event){
        List<Ticket> tickets = em.createQuery("SELECT t FROM Ticket t where t.event = :event ", Ticket.class)
                .setParameter("event", event)
                .getResultList();
        return tickets;
    }
}