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

<<<<<<< HEAD
    @Enumerated(EnumType.STRING)
    private TicketType ticketType;

    @ManyToOne()
=======
    private TicketType ticketType;

    @ManyToOne
>>>>>>> main
    private Event event;



    public Ticket() {
    }

    public Ticket(double price, int availableQuantity, TicketType ticketType, Event event) {
        this.price = price;
        this.availableQuantity = availableQuantity;
        this.ticketType = ticketType;
        this.event = event;
<<<<<<< HEAD
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setAvailableQuantity(Integer availableQuantity) {
        this.availableQuantity = availableQuantity;
=======
>>>>>>> main
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
<<<<<<< HEAD
=======
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
>>>>>>> main
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ticket ticket = (Ticket) o;
        return Double.compare(ticket.price, price) == 0 && availableQuantity == ticket.availableQuantity && Objects.equals(id, ticket.id) && ticketType == ticket.ticketType && Objects.equals(event, ticket.event);
    }


    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + id +
                ", price=" + price +
                ", availableQuantity=" + availableQuantity +
                ", ticketType=" + ticketType +
                ", event=" + event.getName() +
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