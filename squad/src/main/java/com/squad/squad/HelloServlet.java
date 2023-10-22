package com.squad.squad;

import java.io.*;

import com.squad.squad.domain.User;
import com.squad.squad.service.EventService;
import com.squad.squad.service.UserManagementService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet", loadOnStartup = 1)
public class HelloServlet extends HttpServlet {
    private String message;
    public void init() {
        //UserManagementService userManagementService = new UserManagementService();
        //public User(String username, String firstName, String lastName, String email, String password) {
        //User user = new User("Asmae", "Asmae", "Asmae", "aaa@aaa.com", "asmae");
        //userManagementService.updateUser(user, (long) 6);
        //userManagementService.deleteUser((long)9);
        message = "Hello World!";
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