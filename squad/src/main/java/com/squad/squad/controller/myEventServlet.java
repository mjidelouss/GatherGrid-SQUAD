package com.squad.squad.controller;

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

@WebServlet(name = "myEventServlet", value = "/myEvent-servlet")
public class myEventServlet extends HttpServlet {
    private EntityManager em = EntityManagerUtil.getEntityManager();
    private EventRepository eventRepository = new EventRepository(em);
    private EventService eventService = new EventService(eventRepository);
    @Override
    public void init() throws ServletException {
        super.init();
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("event.jsp").forward(request, response);
    }
    @Override
    public void destroy() {
    }
}