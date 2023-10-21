package com.squad.squad;

import java.io.*;
import java.util.Optional;

import com.squad.squad.domain.User;
import com.squad.squad.service.UserService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    UserService service = new UserService();
    public void init() {
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       String uusername =request.getParameter("username");
       String ufirstname =request.getParameter("firstName");
       String ulastname =request.getParameter("lastName");
       String uemail =request.getParameter("email");
       String upwd =request.getParameter("password");
        User user = new User(uusername,ufirstname,ulastname,uemail,upwd);
        Optional<User> save = service.save(user);
        if(save.isPresent()){
            String message = "Error this action not valide";
            request.setAttribute("message",message);
            request.getServletContext().getRequestDispatcher("/registration.jsp").forward(request,response);
        }
        else {
            String message = "Registration Successfully";
            request.setAttribute("message",message);
            request.getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    public void destroy() {

    }
}