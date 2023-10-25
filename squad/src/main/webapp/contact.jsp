<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Contactez-nous</title>
    <link href="./src/css/navbar.css" rel="stylesheet">
    <link href="./src/css/footer.css" rel="stylesheet">
    <link href="./src/css/style.css" rel="stylesheet">
    <link href="./src/css/contact.css" rel="stylesheet">
</head>
<body>


    <%@ include file="navbar.jsp"%>


    <section class="container my-5" style="max-width: 1600px !important; color: #C3C6E2 !important;">

    <div class="section-head col-sm-12 mb-5">
        <h3 class="fs-3 fw-bold" style="color: #C3C6E2">Contactez Nous</h3>
        <p style="color: #ffffff"> Nous sommes là pour répondre à toutes les questions et préoccupations que vous pourriez avoir. Contactez-nous pour en savoir plus sur notre hôtel et nos services, ou pour effectuer une réservation.</p>
    </div>

    <div class="contact-wrapper py-5">
        <div class="contact-wrapper-right-thumb bg_img right-bg" id="right-bg">
        </div>
        <div class="row" style="background: transparent">
            <div class="col-lg-6">
                <div class="contact-left-area bg_img left-bg" id="left-bg">
                    <div class="contact-info-wrapper">
                        <div class="contact-info-list mb-4">
                            <div class="contact-info">
                                <div class="icon">
                                    <i class='fas bx bx-map-pin text-dark'></i>
                                </div>
                                <div class="content">
                                    <h6 class="title mb-1">
                                        Adresse
                                    </h6>
                                    <p class="text-dark">
                                        1 Boulevard Menara, Marrakech, Morocco
                                    </p>
                                </div>
                            </div>
                            <div class="contact-info">
                                <div class="icon">
                                    <i class='fas bx bx-envelope text-dark' ></i>
                                </div>
                                <div class="content">
                                    <h6 class="title mb-1">
                                        Adresse Mail
                                    </h6>
                                    <p class="text-dark">
                                        <a href="">
                                            Eventy_Assistance@gmail.com
                                        </a>
                                    </p>
                                </div>
                            </div>
                            <div class="contact-info">
                                <div class="icon">
                                    <i class='fas bx bxs-phone text-dark'></i>
                                </div>
                                <div class="content">
                                    <h6 class="title mb-1">
                                        Téléphone
                                    </h6>
                                    <p class="text-dark">
                                        +212 661 65 87 23
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-4">
                <div class="contact-right-area">
                    <div class="row mb-5 mx-auto" style="background:transparent;">
                        <div class="col-lg-10">
                            <h3 class="title mb-2 text-center">
                                N'hésitez pas à nous contacter
                            </h3>
                            <p class="description fs-6 text-center text-dark">
                                Notre équipe est toujours heureuse de vous assister. Contactez-nous pour toute aide dont vous pourriez avoir besoin.                            </p>
                        </div>
                    </div>
                    <form method="post" action="" class="">

                        <div class="mb-3 position-relative">
                            <label>
                                Nom Complet
                            </label>
                            <div class="custom-icon-field">
                                <input name="full_name" type="text" class="form--control" value="" placeholder="Entrer votre adresse Mail" required>
                                <i class='bx bxs-user fas text-dark'></i>
                            </div>
                        </div>
                        <div>

                        </div>
                        <div class="mb-3">
                            <label>
                                Adresse Mail
                            </label>
                            <div class="custom-icon-field">
                                <input name="email" type="email" class="form--control" value="" placeholder="Entrer votre adresse mail" required>
                                <i class='bx bxs-envelope fas text-dark' ></i>
                            </div>
                        </div>
                        <div>

                        </div>
                        <div class="mb-3">
                            <label>
                                Sujet
                            </label>
                            <input name="subject" type="text" class="form--control" value="" placeholder="Entrer le sujet" required>
                        </div>
                        <div>

                        </div>
                        <div class="mb-3">
                            <label>
                                Message
                            </label>
                            <textarea name="message" rows="4" class="form--control" placeholder="Ecrire votre message" required></textarea>
                        </div>
                        <div>

                        </div>
                        <button type="submit" class="btn btn--base text-dark fw-bold">Envoyer</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </section>


    <section>
    <div class=" mt-5">
        <!--Google map-->
        <div id="map-container-google-1" class="z-depth-1-half map-container" style="height: 450px">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d18735.23780092819!2d-8.028005134327636!3d31.605569906812633!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xdafeee34d9c2ac9%3A0xaeddec9a066e9ae!2sAv.%20de%20la%20M%C3%A9nara%2C%20Marrakech!5e0!3m2!1sfr!2sma!4v1682240682949!5m2!1sfr!2sma"
                    height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <!--Google Maps-->
    </div>
</section>

    <%@ include file="footer.jsp"%>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="./src/js/main.js"></script>
</html>
