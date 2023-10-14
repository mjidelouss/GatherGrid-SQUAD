package com.squad.squad.domain;

import com.squad.squad.domain.enums.TicketType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double price;
    private int availableQuantity;
    private TicketType ticketType;


    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public Ticket(double price, int availableQuantity, TicketType ticketType) {
        this.price = price;
        this.availableQuantity = availableQuantity;
        this.ticketType = ticketType;
    }

    public Ticket() {
    }

    public double getPrice() {
        return price;
    }

    public void setPrix(double price) {
        this.price = price;
    }

    public int getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(int availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    public TicketType getTicketType() {
        return ticketType;
    }

    public void setTicketType(TicketType ticketType) {
        this.ticketType = ticketType;
    }

    @Override
    public String toString() {
        return "Billet{" +
                "prix=" + price +
                ", quantiteDisponible=" + availableQuantity +
                ", billetType=" + ticketType +
                '}';
    }


}

