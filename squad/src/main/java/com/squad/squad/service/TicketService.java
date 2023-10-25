package com.squad.squad.service;

import com.squad.squad.domain.enums.TicketType;
import com.squad.squad.domain.Event;
import com.squad.squad.domain.Ticket;
import com.squad.squad.repository.TicketRepository;

import java.util.List;

public class TicketService {

    private TicketRepository ticketRepository;
    public TicketService(TicketRepository ticketRepository){
        this.ticketRepository = ticketRepository;
    }

    private Boolean isValidateTicket(Ticket ticket){

        Double price = ticket.getPrice();

        if (price <= 0){
            return false;
        }

        Integer availableQuantity = ticket.getAvailableQuantity();

        if (availableQuantity <= 0){
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
    public String updateTicket(Ticket ticketUpdated) {
        if (isValidateTicket(ticketUpdated)) {
            ticketRepository.update(ticketUpdated);
            return "Le billet a été mis à jour avec succès.";
        } else {
            return "Échec de la mise à jour du billet. Veuillez vérifier les données.";
        }
    }

    public String deleteTicket(Long ticketId){
        ticketRepository.delete(ticketId);
        return "Le billet a été supprimé avec succès !";
    }
    public Long getTicketId(Long id) {
        return ticketRepository.getTicketId(id);
    }
}
