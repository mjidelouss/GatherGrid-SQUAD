<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>A propos de Nous</title>
    <link href="./src/css/navbar.css" rel="stylesheet">
    <link href="./src/css/footer.css" rel="stylesheet">
    <link href="./src/css/style.css" rel="stylesheet">
    <link href="./src/css/aboutUs.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="container-fluid my-5">
    <div class="d-flex align-items-center justify-content-between">
        <div class="responsive-container-block leftSide">
            <p class="text-blk heading">
                EVENTY
            </p>
            <p class="text-blk subHeading" style="line-height: 35px">
                Bienvenue sur notre plateforme d'événements ! Chez nous,
                l'art de créer des expériences inoubliables est une passion que nous chérissons
                depuis longtemps. Notre équipe dévouée est composée d'experts passionnés par l'organisation
                d'événements, qu'ils soient petits ou grands, traditionnels ou innovants. Nous sommes ici pour
                vous aider à donner vie à vos rêves et à vos idées, qu'il s'agisse de mariages spectaculaires,
                de conférences inspirantes, de concerts mémorables ou de célébrations intimes. Notre mission est
                de simplifier le processus de planification tout en garantissant que chaque moment soit unique
                et mémorable. Rejoignez-nous dans cette aventure passionnante, et permettez-nous de créer
                ensemble des souvenirs extraordinaires pour vous et vos proches.
            </p>
        </div>
        <div class="responsive-container-block rightSide">
            <img class="number1img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/ET32.jpg">
            <img class="number2img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/d14.png">
            <img class="number3img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/b245.png">
            <img class="number5img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/Customer supports.png">
            <iframe allowfullscreen="allowfullscreen" class="number4vid" poster="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/b242.png" src="https://www.youtube.com/embed/svg%3E?">
            </iframe>
            <img class="number7img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/d51.png">
            <img class="number6img" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/d12.png">
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>

</body>
<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="./src/js/main.js"></script>

</html>
