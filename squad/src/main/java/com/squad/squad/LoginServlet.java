package com.squad.squad;

import com.squad.squad.domain.User;
import com.squad.squad.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    UserService service = new UserService();
    public void init() {
    }


}
