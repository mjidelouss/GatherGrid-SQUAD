package com.squad.squad.controller;

import com.squad.squad.domain.*;
import com.squad.squad.domain.enums.TicketType;
import com.squad.squad.repository.CategoryRepository;
import com.squad.squad.repository.EventRepository;
import com.squad.squad.repository.TicketRepository;
import com.squad.squad.service.CategoryService;
import com.squad.squad.service.EventService;
import com.squad.squad.service.TicketService;
import com.squad.squad.utils.EntityManagerUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "eventServlet", value = "/event-servlet/*")
public class EventServlet extends HttpServlet {
    private EntityManager em = EntityManagerUtil.getEntityManager();
    private EventRepository eventRepository = new EventRepository(em);
    private EventService eventService = new EventService(eventRepository);
    private TicketRepository ticketRepository = new TicketRepository(em);

    private TicketService ticketService = new TicketService(ticketRepository);

    @Override
    public void init() throws ServletException {
        super.init();
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            User organiser = (User) request.getSession().getAttribute("user");
            List<Event> events = eventService.getEventsOfOrganiser(organiser);
            List<Ticket> tickets = ticketService.getAllTickets();
            List<Event> eventWithTickets = eventsWithTickets(events, tickets);
            CategoryRepository categoryRepository = new CategoryRepository(em);
            CategoryService categoryService = new CategoryService(categoryRepository);
            List<Category> categories = categoryService.getAllCategories();
            request.setAttribute("events", eventWithTickets);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("eventCrud.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURL().toString();
        if(path.contains("addEvent")) {
            addEvent(req, resp);
        }
        else if(path.contains("deleteEvent")) {
            doDelete(req, resp);
        } else if(path.contains("editEvent")) {
            editEvent(req, resp);
        }
    }
    protected void editEvent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryRepository categoryRepository = new CategoryRepository(em);
        CategoryService categoryService = new CategoryService(categoryRepository);
        TicketRepository ticketRepository = new TicketRepository(em);
        TicketService ticketService = new TicketService(ticketRepository);
        Long eventId = Long.parseLong(req.getParameter("editEventId"));
        String name = req.getParameter("editEventName");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = dateFormat.parse(req.getParameter("editEventDate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        LocalTime localTime = LocalTime.parse(req.getParameter("editEventTime"));
        Time time = Time.valueOf(localTime);
        String place = req.getParameter("editEventPlace");
        Long categoryId = Long.parseLong(req.getParameter("editEventCategoryId"));
        String description = req.getParameter("editEventDescription");
        Category category = categoryService.getCategoryById(categoryId);
        int ticketsQuantity = Integer.parseInt(req.getParameter("editEventTicketsQuantity"));
        double ticketPrice = Double.parseDouble(req.getParameter("editEventTicketPrice"));
        String type = req.getParameter("editEventTicketType");
        Long ticketId = Long.parseLong(req.getParameter("editTicketId"));
        TicketType ticketType;
        if (type.equals("STANDARD")) {
            ticketType = TicketType.STANDARD;
        } else {
            ticketType = TicketType.VIP;
        }
        User organiser = (User) req.getSession().getAttribute("user");
        Event updatedEvent = new Event(name, date, time, place, description, category, organiser);
        updatedEvent.setId(eventId);
        Ticket updatedTicket = new Ticket(ticketPrice, ticketsQuantity, ticketType, updatedEvent);
        updatedTicket.setId(ticketId);
        eventService.updateEvent(updatedEvent);
        ticketService.updateTicket(updatedTicket);
        resp.sendRedirect(req.getContextPath()+"/event-servlet");
    }
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TicketRepository ticketRepository = new TicketRepository(em);
        TicketService ticketService = new TicketService(ticketRepository);
        Long eventId = Long.parseLong(req.getParameter("eventId"));
        Long ticketId = Long.parseLong(req.getParameter("ticketId"));
        System.out.println(ticketId);
        System.out.println(eventId);
        ticketService.deleteTicket(ticketId);
        eventService.deleteEvent(eventId);
        resp.sendRedirect(req.getContextPath()+"/event-servlet");
    }

    protected void addEvent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryRepository categoryRepository = new CategoryRepository(em);
        CategoryService categoryService = new CategoryService(categoryRepository);
        TicketRepository ticketRepository = new TicketRepository(em);
        TicketService ticketService = new TicketService(ticketRepository);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String name = req.getParameter("eventName");
        Date date = null;
        try {
            date = dateFormat.parse(req.getParameter("eventDate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        LocalTime localTime = LocalTime.parse(req.getParameter("eventTime"));
        Time time = Time.valueOf(localTime);
        String place = req.getParameter("eventPlace");
        Long categoryId = Long.parseLong(req.getParameter("eventCategory"));
        String description = req.getParameter("eventDescription");
        int ticketsQuantity = Integer.parseInt(req.getParameter("eventTicketsQuantity"));
        double ticketPrice = Double.parseDouble(req.getParameter("eventTicketPrice"));
        String type = req.getParameter("eventTicketType");
        TicketType ticketType;
        if (type.equals("STANDARD")) {
            ticketType = TicketType.STANDARD;
        } else {
            ticketType = TicketType.VIP;
        }
        Category category = categoryService.getCategoryById(categoryId);
        User organiser = (User) req.getSession().getAttribute("user");
        Event event = new Event(name, date, time, place, description, category, organiser);
        Ticket ticket = new Ticket(ticketPrice, ticketsQuantity, ticketType, event);
        eventService.saveEvent(event);
        ticketService.saveTicket(ticket);
        resp.sendRedirect(req.getContextPath()+"/event-servlet");
    }

    @Override
    public void destroy() {

    }

    public List<Event> eventsWithTickets(List<Event> events, List<Ticket> tickets) {
        return events.stream()
                .map(event -> {
                    List<Ticket> eventTickets = tickets.stream()
                            .filter(ticket -> ticket.getEvent().getId() == event.getId())
                            .collect(Collectors.toList());
                    event.setTicket(eventTickets);
                    return event;
                })
                .collect(Collectors.toList());
    }

}
