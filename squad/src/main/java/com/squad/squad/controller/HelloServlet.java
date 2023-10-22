package com.squad.squad.controller;

import java.io.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
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
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager entityManager = entityManagerFactory.createEntityManager();

    public EntityManager getEntityManager() {
        return entityManager;
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        /*response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");*/
        this.getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
    }

    public void destroy() {
    }
}