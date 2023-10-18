package com.squad.squad.controller;

import java.io.*;
import java.sql.Time;
import java.util.Date;

import com.squad.squad.domain.Event;
import com.squad.squad.service.EventService;
import com.squad.squad.utils.EntityManagerUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet", loadOnStartup = 1)
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        EntityManager em = EntityManagerUtil.getEntityManager();
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