<%@ page import="com.squad.squad.domain.User" %>
<nav class="navbar navbar-expand-md" style="background-color: transparent">
    <div class="container-fluid">
        <a class="navbar-brand d-flex justify-content-center align-items-center ms-lg-3 ms-md-3" href="index.jsp">
            <img class="logo" src="./src/img/logo1.png" alt="" width="35" height="35">
            <div class="fs-4 text-bold text-white" style="font-family: 'Pacifico', cursive;">venty</div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-light me-5 text-bold" href="about.jsp">A propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light me-5" href="eventCardServlet">Evenements</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light me-5" href="contact.jsp">Contact</a>
                </li>
                <% if (session.getAttribute("user") != null) { %>
                <li class="nav-item">
                    <a class="nav-link text-light me-5" href="myTicket.jsp">Mes Tickets</a>
                </li>
                <% } %>
            </ul>
<%--            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-light" href="LoginServlet">Connexion</a>
                </li>
                <button type="button" class="btn btn-outline-light ms-3 me-lg-3 me-md-3">Inscrire</button>
            </ul>--%>
            <ul class="navbar-nav ms-auto">
                <% if (session.getAttribute("user") != null) { %>
                <li class="nav-item">
                    <a class="nav-link text-light" href="logout">Logout</a>
                </li>
                <a type="button" class="btn btn-outline-light ms-3 me-lg-3 me-md-3" href="manage-profile">>
            <%= ((User) session.getAttribute("user")).getFirstName() %>
        </a>
                <% } else { %>
                <a type="button" class="btn btn-outline-light ms-3 me-lg-3 me-md-3" href="registration.jsp">Inscrire</a>
                <li class="nav-item">
                    <a class="nav-link text-light" href="login.jsp">Connexion</a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
