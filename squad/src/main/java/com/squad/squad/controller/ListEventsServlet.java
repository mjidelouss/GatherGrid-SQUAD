package com.squad.squad.controller;

import com.squad.squad.domain.Event;
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
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "listEventServlet", value = "/listEvent-servlet")
public class ListEventsServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("tEST");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        EntityManager em = EntityManagerUtil.getEntityManager();
        EventRepository eventRepository = new EventRepository(em);
        EventService eventService = new EventService(eventRepository);
        List<Event> events = eventService.getAllEvents();
        request.setAttribute("events", events);
        request.getRequestDispatcher("eventCrud.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    public void destroy() {

    }
}

