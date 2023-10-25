package com.squad.squad;

import com.squad.squad.domain.User;
import com.squad.squad.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginServlet", value ={ "/LoginServlet","/logout"})
public class LoginServlet extends HttpServlet {
    UserService service = new UserService();
    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String uemail =request.getParameter("email");
        String upwd =request.getParameter("password");
        Optional<User> user = service.CheckEmail(uemail , upwd);
        if (user.isPresent()) {
            request.getSession(true).setAttribute("user", user.get());
            request.setAttribute("success", "You are logged in successfully");
            this.getServletContext().getRequestDispatcher("/event.jsp").forward(request, response);
            //this.getServletContext().getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
        }else {
            request.setAttribute("validationEmail", "Email Or Password Not exists.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURL().toString();
        if (path.contains("logout")) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                req.getSession().invalidate();
            }
            req.setAttribute("message", "you are logged out !!");
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }


    public void destroy() {
    }
}
