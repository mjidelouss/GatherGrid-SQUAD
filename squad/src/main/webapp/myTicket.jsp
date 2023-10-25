<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Mes Tickets</title>
  <link href="./src/css/navbar.css" rel="stylesheet">
  <link href="./src/css/footer.css" rel="stylesheet">
  <link href="./src/css/style.css" rel="stylesheet">
  <link href="./src/css/myTicket.css" rel="stylesheet">

</head>
<body>
  <%@ include file="navbar.jsp"%>

  <section class="container mt-5" style="max-width: 1675px">
    <div class="my-5 text-center">
      <h5 class="fw-bold fs-3 mb-5 " style="color: #C3C6E2">Mes Tickets</h5>
      <p class="fs-5 text-white mb-5">Détails de ma réservation et informations du billet</p>
    </div>

    <div class="ticket my-5 py-5">
      <div class="stub">
        <div class="top">
          <span class="admit">Admit</span>
          <span class="line"></span>
          <span class="num">
            Ticket
        <span>31415926</span>
      </span>
        </div>
        <div class="number">1</div>
        <div class="invite">
          Ticket for you
        </div>
      </div>
      <div class="check">
        <div class="big">
          Event <br> Name
        </div>
        <div class="number">#1</div>
        <div class="info">
          <section>
            <div class="title">Date</div>
            <div>4/27/2016</div>
          </section>
          <section>
            <div class="title">Organized By</div>
            <div>Organizer</div>
          </section>
          <section>
            <div class="title">Place</div>
            <div>Some place</div>
          </section>
        </div>
      </div>
    </div>
  </section>
  <%@ include file="footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="./src/js/main.js"></script>
</html>
