package com.squad.squad.controller;

import com.squad.squad.domain.Category;
import com.squad.squad.domain.Event;
import com.squad.squad.repository.CategoryRepository;
import com.squad.squad.repository.EventRepository;
import com.squad.squad.service.EventService;
import com.squad.squad.utils.EntityManagerUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "eventCardsServlet", value = "/eventCardServlet", loadOnStartup = 1)
public class EventCardServlet extends HttpServlet {
    private EntityManager em = EntityManagerUtil.getEntityManager();
    private EventRepository eventRepository = new EventRepository(em);
    private EventService eventService = new EventService(eventRepository);
    @Override
    public void init() throws ServletException {
        super.init();
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("enterd");
        List<Event> events = eventService.getAllEvents();
        request.setAttribute("events", events);
        System.out.println("made cond");
        request.getRequestDispatcher("eventsPage.jsp").forward(request, response);
    }

}
