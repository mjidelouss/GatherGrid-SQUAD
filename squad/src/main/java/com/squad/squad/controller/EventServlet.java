package com.squad.squad.controller;

import com.squad.squad.domain.Category;
import com.squad.squad.domain.Comment;
import com.squad.squad.domain.Event;
import com.squad.squad.domain.User;
import com.squad.squad.repository.CategoryRepository;
import com.squad.squad.repository.EventRepository;
import com.squad.squad.service.CategoryService;
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
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@WebServlet(name = "eventServlet", value = "/event-servlet")
public class EventServlet extends HttpServlet {
    private EntityManager em = EntityManagerUtil.getEntityManager();
    private EventRepository eventRepository = new EventRepository(em);
    private EventService eventService = new EventService(eventRepository);
    @Override
    public void init() throws ServletException {
        super.init();
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Event> events = eventService.getAllEvents();
        CategoryRepository categoryRepository = new CategoryRepository(em);
        CategoryService categoryService = new CategoryService(categoryRepository);
        List<Category> categories = categoryService.getAllCategories();
        request.setAttribute("events", events);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("eventCrud.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryRepository categoryRepository = new CategoryRepository(em);
        CategoryService categoryService = new CategoryService(categoryRepository);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String name = req.getParameter("eventName");
        Date date = null;
        try {
            date = dateFormat.parse(req.getParameter("eventDate"));
        } catch (ParseException e) {
            e.printStackTrace(); // Handle the parsing exception as needed
        }
        LocalTime localTime = LocalTime.parse(req.getParameter("eventTime"));
        Time time = Time.valueOf(localTime);
        String place = req.getParameter("eventPlace");
        Long categoryId = Long.parseLong(req.getParameter("eventCategory"));
        String description = req.getParameter("eventDescription");
        Category category = categoryService.getCategoryById(categoryId);
        User organiser = new User("johndoe", "John", "Doe", "user1@example.com", "password1");
        organiser.setId((long)1);
        Event event = new Event(name, date, time, place, description, category, organiser);
        eventService.saveEvent(event);
        resp.sendRedirect("event-servlet");
    }
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long eventId = Long.parseLong(req.getParameter(""));
        eventService.deleteEvent(eventId);
        resp.sendRedirect("event-servlet");
    }
    @Override
    public void destroy() {

    }
}
