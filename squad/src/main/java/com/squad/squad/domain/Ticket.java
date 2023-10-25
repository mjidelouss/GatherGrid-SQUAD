package com.squad.squad.domain;
import com.squad.squad.domain.enums.TicketType;
import jakarta.persistence.*;

import java.util.Objects;

@Entity
public class Ticket {

    @Id  @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double price;

    private Integer availableQuantity;

    @Enumerated(EnumType.STRING)
    private TicketType ticketType;
  
    @ManyToOne
    private Event event;



    public Ticket() {
    }

    public Ticket(double price, int availableQuantity, TicketType ticketType, Event event) {
        this.price = price;
        this.availableQuantity = availableQuantity;
        this.ticketType = ticketType;
        this.event = event;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Integer getAvailableQuantity() {
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

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }


    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + id +
                ", price=" + price +
                ", availableQuantity=" + availableQuantity +
                ", ticketType=" + ticketType +
                ", event=" + event +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ticket ticket = (Ticket) o;
        return Double.compare(ticket.price, price) == 0 && availableQuantity == ticket.availableQuantity && Objects.equals(id, ticket.id) && ticketType == ticket.ticketType && Objects.equals(event, ticket.event);
    }
}