package com.squad.squad;

import java.io.*;
import java.sql.Time;
import java.util.Date;

import com.squad.squad.domain.Event;
import com.squad.squad.service.EventService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet", loadOnStartup = 1)
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
        EventService eventService = new EventService();
        Event event = new Event("Devox", new Date(), Time.valueOf("12:21:21"), "Taghazout", "Devox 2023");
        Event res = eventService.saveEvent(event);
        System.out.println(res);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}