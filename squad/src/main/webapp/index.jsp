<%@ page import="com.squad.squad.domain.Event" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>

  <title>Eventy - Accueil</title>
  <link href="./src/css/navbar.css" rel="stylesheet">
  <link href="./src/css/footer.css" rel="stylesheet">
  <link href="./src/css/style.css" rel="stylesheet">
  <link href="./src/css/banner.css" rel="stylesheet">

</head>
<body>
<%@ include file="navbar.jsp"%>

<%@ include file="banner.jsp"%>

<%@ include file="wrapper.jsp"%>

<section class="container mt-5" style="max-width: 1675px">

  <div class="row">
    <div class="col-sm-12 text-center mb-5 ">
      <h3 class="section-title fw-bold" style="color: #C3C6E2"> EVENEMENTS POPULAIRES </h3>
    </div>

    <div class="col-sm-12 text-center d-flex justify-content-center" >
      <a href="#" class="event_category text-decoration-none me-5 px-4" style="color: #C3C6E2"> Tous</a>
      <a href="#" class="event_category text-decoration-none me-5 px-4" style="color: #C3C6E2"> Aujourd'hui</a>
      <a href="#" class="event_category text-decoration-none me-5 px-4" style="color: #C3C6E2"> Ce Week-End</a>
      <a href="#" class="event_category text-decoration-none me-5 px-4" style="color: #C3C6E2"> En Ligne</a>
    </div>
  </div>

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
            <p class="card-text d-flex my-auto" style="color: white"> <i class="bi bi-people-fill me-2"></i><span><%= event.getCategory() %></span></p>
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



</section>

<%@ include file="sponsorsSection.jsp"%>

<!--<a href="profileSettings.jsp">profile</a>-->

<%@ include file="footer.jsp"%>
</body>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="./src/js/main.js"></script>
<script>

  $(document).ready(function(){
    $('.customer-logos').slick({
      slidesToShow: 5,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: false,
      dots: false,
      pauseOnHover:false,
      responsive: [{
        breakpoint: 768,
        setting: {
          slidesToShow:4
        }
      }, {
        breakpoint: 520,
        setting: {
          slidesToShow: 3
        }
      }]
    });
  });

</script>
</html>