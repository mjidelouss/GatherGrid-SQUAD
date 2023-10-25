package com.squad.squad.controller;
import com.squad.squad.domain.User;
import com.squad.squad.repository.UserManagementRepository;
import com.squad.squad.service.UserManagementService;
import com.squad.squad.utils.EntityManagerUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;


@WebServlet(name = "manageProfile" , value = {"/manage-profile","/manage-info","/manage-password","/delete-profile"})
public class UserManagementServlet extends HttpServlet {
    private EntityManager entityManager = EntityManagerUtil.getEntityManager();
    private UserManagementRepository userManagementRepository = new UserManagementRepository(entityManager);
    private UserManagementService userManagementService = new UserManagementService(userManagementRepository);
    @Override
    public void init() throws ServletException {
        super.init();
        //userManagementService.deleteUser((long)4);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getServletContext().getRequestDispatcher("/profileSettings.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path) {
            case "/manage-info":
                manageInfo(req, resp);
                break;
            case "/manage-password":
                resetPassword(req, resp);
                break;
            case "/delete-profile":
                deleteAccount(req, resp);
                break;
            default:
                resp.sendError(resp.SC_NOT_FOUND);
                break;
        }
    }

    public void manageInfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String email = req.getParameter("email");
        User user = new User();
        user.setUsername(username);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setEmail(email);
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");
        User userSuccess = userManagementService.updateUser(user, currentUser.getId());
        if (userSuccess.getId() != null) {
            req.setAttribute("message", "Profile updated successfully");
            req.getRequestDispatcher("/profileSettings.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", "Profile update failed. Please try again.");
            req.getRequestDispatcher("/yourOriginalFormPage.jsp").forward(req, resp);
        }
    }

    public void resetPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String currentPassword = req.getParameter("current_password");
        String newPassword = req.getParameter("new_password");
        String newPasswordConfirmation = req.getParameter("new_password_confirmation");

        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (BCrypt.checkpw(currentPassword, currentUser.getPassword())) {
            if (newPassword.equals(newPasswordConfirmation)) {
                currentUser.setPassword(newPassword);
                User userSuccess = userManagementService.resetPassword(currentUser, newPassword);

                if (userSuccess.getId() != null) {
                    req.setAttribute("messageP", "Password reset successfully");
                    req.getRequestDispatcher("/profileSettings.jsp").forward(req, resp);
                } else {
                    req.setAttribute("messageP", "Password reset failed. Please try again.");
                    req.getRequestDispatcher("/profileSettings.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("messageP", "New password and confirmation do not match.");
                req.getRequestDispatcher("/profileSettings.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("messageP", "Incorrect current password.");
            req.getRequestDispatcher("/profileSettings.jsp").forward(req, resp);
        }
    }

    public void deleteAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        userManagementService.deleteUser(user.getId());
        //req.setAttribute("messageP", "Incorrect current password.");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }


}
