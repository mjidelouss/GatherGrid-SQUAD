<%@ page import="com.squad.squad.domain.Event" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Evenements</title>
    <link href="./src/css/navbar.css" rel="stylesheet">
    <link href="./src/css/footer.css" rel="stylesheet">
    <link href="./src/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp"%>

<section class="container mt-5" style="max-width: 1675px">

    <div class="text-center my-4">
        <h5 class="mx-auto fw-bold mt-5 mb-5 fs-3" style="color: #C3C6E2"> Explorez le Monde des Événements </h5>
        <p class="mx-auto text-white mt-3 mb-5 fs-5">Découvrez des Expériences Inoubliables près de Chez Vous </p>
    </div>

    <div class="row mt-5 justify-content-between">
        <div class="col-md-10 d-flex flex-column justify-content-center align-items-center rounded">
            <div class="input-wrapper mb-3 input-group input-group-lg input-group-merge"  style="background-color: transparent ">
                <span class="input-group-text"  style="background-color: transparent; border-color: #C3C6E2; border-right: none"><i class='bx bx-search-alt' style="color: #C3C6E2"></i></span>
                <input type="text" id="search-input" class="form-control" style="background-color: transparent; color: #C3C6E2 !important; box-shadow: none !important; border-color: #C3C6E2; border-left: none"  aria-label="search-input"  />
            </div>
        </div>

        <div class="col-md-2">
            <button type="submit" class="btn btn-info text-center w-100 h-75 border-0"  style="background-color: #C3C6E2 !important;">Rechercher</button>
        </div>
    </div>

    <div>
        <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events != null && !events.isEmpty()) {
                for (Event event : events) {
        %>
        <div class="row my-5">
            <div class="col-md-3 col-lg-3 mb-3">
                <div class="card border-0 bg-transparent" style="box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;">
                    <a href="#"> <img class="card-img-top img-fluid" src="src/img/event4.jpg" alt="Event image" style="max-height: 220px" /> </a>
                    <div class="card-body p-3">
                        <h5 class="card-title mt-2 mb-3" style="color: #C3C6E2"><%= event.getName() %></h5>
                        <p class="card-text mb-3" style="color: #857555"><%= event.getDate() %> <%= event.getHour() %></p>
                        <p class="card-text d-flex align-items-center mb-3" style="color: white"> <i class="bi bi-geo-alt-fill me-2"></i> <span><%= event.getPlace() %></span></p>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="card-text d-flex my-auto" style="color: white"> <i class="bi bi-people-fill me-2"></i><span><%= event.getCategory().getName() %></span></p>
                            <a href="#" class="btn btn-success border-0" style="color: #2f3349 !important; background-color: #C3C6E2 !important;"> Reserver</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>

</section>


<%@ include file="footer.jsp"%>
</body>
<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="./src/js/main.js"></script>
</html>
