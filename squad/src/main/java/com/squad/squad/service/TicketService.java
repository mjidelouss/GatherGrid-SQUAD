package com.squad.squad.service;

import com.squad.squad.domain.enums.TicketType;
import com.squad.squad.domain.Event;
import com.squad.squad.domain.Ticket;
import com.squad.squad.repository.TicketRepository;

import java.util.List;

public class TicketService {

    private TicketRepository ticketRepository;
    private EventService eventService;

    public TicketService(TicketRepository ticketRepository, EventService eventService){

        this.ticketRepository = ticketRepository;
        this.eventService = eventService;

    }

    private Boolean isValidateTicket(Ticket ticket){

        Double price = ticket.getPrice();

        if (price <= 0){
            return false;
        }

        Integer availableQuantity = ticket.getAvailableQuantity();

        if (availableQuantity < 0){
            return false;
        }

        Event event = eventService.getEventById(ticket.getEvent().getId());

        if (event == null){
            return false;
        }

        if (ticket.getTicketType() == null) {
            return false;
        }

        try {
            TicketType.valueOf(ticket.getTicketType().name());
        } catch (IllegalArgumentException e) {
            return false;
        }
        return true;

    }


    public List<Ticket> getTicketByEvent(Event event){
        return ticketRepository.findByEvent(event);
    }

    public List<Ticket> getTicketByType(TicketType ticketType){
        return ticketRepository.findByTicketType(ticketType);
    }

    public Ticket getTicketById(Long ticketId){
        return ticketRepository.findById(ticketId);
    }

    public List<Ticket> getAllTickets(){
        return ticketRepository.findAll();
    }

    public String saveTicket(Ticket ticket){
        if (isValidateTicket(ticket)){
            ticketRepository.save(ticket);
            return "Le billet a été enregistré avec succès !";
        }
        return "Échec de l'enregistrement du billet. Veuillez vérifier les données.";
    }


    public String updateTicket(Ticket ticketUpdated, Long ticketId) {
        if (isValidateTicket(ticketUpdated)) {
            ticketRepository.update(ticketUpdated, ticketId);
            return "Le billet a été mis à jour avec succès.";
        } else {
            return "Échec de la mise à jour du billet. Veuillez vérifier les données.";
        }
    }

    public String deleteTicket(Long ticketId){
        ticketRepository.delete(ticketId);
        return "Le billet a été supprimé avec succès !";
    }



}
