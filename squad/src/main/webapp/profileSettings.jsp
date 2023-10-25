<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Mon profil</title>
    <link href="./src/css/navbar.css" rel="stylesheet">
    <link href="./src/css/footer.css" rel="stylesheet">
    <link href="./src/css/style.css" rel="stylesheet">
</head>
<body>

<%@ include file="navbar.jsp"%>

<section>
    <div class="content-wrapper">
        <div class="container-fluid flex-grow-1 mt-5" style="max-width: 1500px !important;">
            <div class="row">
                <div class="col-md-12 ps-0 ms-0">
                    <ul class="nav nav-pills flex-column flex-md-row my-4">
                        <li class="nav-item">
                            <a class="nav-link active" href="javascript:void(0);" style="background-color: #C3C6E2 ; color:#020202;"><i class='bx bx-user'></i>${user.getFirstName()} ${user.getLastName()}</a>
                        </li>
                    </ul>
                </div>
                <div class="row g-3 align-items-center mb-5 mt-3" style="box-shadow: 0 6px 9px 9px #323856">
                    <div class="col-7 d-flex flex-column ">
                        <h5 class="mx-auto fw-bold mb-3" style="color: #C3C6E2">Est-ce que vous souhaitez actualiser votre profil ?</h5>
                        <p class="mx-auto fw-bold text-white">Merci de prendre le temps de mettre à jour vos informations. Votre attention aux détails</p>
                        <p class="mx-auto fw-bold text-white">contribue à maintenir notre base de données précise et à jour. Nous apprécions</p>
                        <p class="mx-auto fw-bold text-white"> votre engagement à fournir des données fiables. Merci pour votre contribution !</p>
                    </div>
                    <div class="col-5 d-flex justify-content-center rounded pt-4">
                        <img
                                src="src/img/page-misc-under-maintenance.png"
                                alt="wizard-create-deal"
                                width="300"
                                class="img-fluid" />
                    </div>
                </div>
                <div class="card  mt-3 mb-4 border-0 px-5 py-4 shadow-5" style="background-color: #2f3349">
                    <h5 class="fw-bold" style="color: #C3C6E2">Changer Mes Informations Personnelles</h5>
                    <hr style="color: #C3C6E2">
                    <div class="card-body p-0">
                        <form action="manage-info" method="post" class="">

                            <c:if test="${not empty message}">
                                <h3>${message}</h3>
                            </c:if>

                            <div class="row">

                                <div class="mb-3 col-md-6">
                                    <label for="lastname" class="form-label text-white">Nom d'utilisateur</label>
                                    <input class="form-control text-white border-white bg-transparent" style="box-shadow: none !important;" type="text" id="username" name="username" value="${user.getUsername()}"/>
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="email" class="form-label text-white">Adresse Mail</label>
                                    <input class="form-control text-white border-white bg-transparent" style="box-shadow: none !important;" type="email" id="email" name="email" value="${user.getEmail()}"/>
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="firstname" class="form-label text-white">Prénom</label>
                                    <input class="form-control text-white border-white bg-transparent" style="box-shadow: none !important;" type="text" name="firstname" id="firstname" value="${user.getFirstName()}"/>
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="lastname" class="form-label text-white">Nom</label>
                                    <input class="form-control text-white border-white bg-transparent" style="box-shadow: none !important;" type="text" id="lastname" name="lastname" value="${user.getLastName()}"/>
                                </div>
                            </div>

                            <div class="col-md-12 d-flex justify-content-start my-3">
                                <button type="submit" class="btn btn-primary me-3 border-0 fw-bold px-4 py-2" style="background-color: #C3C6E2 !important; color: #020202 !important;">Sauvegarder Les Changements</button>
                                <a href="" type="reset" class="btn btn-secondary border-0 fw-bold px-4 py-2" style="background-color: #C13584 !important; color:white;">Quitter</a>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="card mt-3 mb-5 border-0 px-5 py-4 shadow-5" style="background-color: #2f3349">
                    <h5 class="" style="color: #C3C6E2">Changer Mon Mot de Passe</h5>
                    <hr style="color: #C3C6E2">
                    <div class="card-body p-0">
                        <form action="manage-password" method="post">
                            <c:if test="${not empty messageP}">
                                <h3>${messageP}</h3>
                            </c:if>
                            <div class="row">
                                <div class="mb-3 col-md-4 form-password-toggle">
                                    <label for="current_password" class="form-label text-white">Mot de passe actuel</label>
                                    <div class="input-group input-group-merge">
                                        <input class="form-control text-white border-white bg-transparent border-end-0"  id="current_password" type="password" name="current_password" style="box-shadow: none !important;" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;">
                                        <span class="input-group-text cursor-pointe bg-transparent border-start-0"><i class='bx bx-low-vision' style="color: white"></i></span>
                                    </div>
                                </div>

                                <div class="mb-3 col-md-4 form-password-toggle">
                                    <label for="new_password"  class="form-label text-white">Nouveau mot de passe</label>
                                    <div class="input-group input-group-merge">
                                        <input class="form-control text-white border-white bg-transparent border-end-0" id="new_password" type="password" name="new_password" style="box-shadow: none !important;"  placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;">
                                        <span class="input-group-text cursor-pointer bg-transparent border-start-0"><i class='bx bx-low-vision' style="color: white"></i></span>
                                    </div>
                                </div>

                                <div class="mb-3 col-md-4 form-password-toggle">
                                    <label for="new_password_confirmation" class="form-label text-white">Confirmation du nouveau mot de passe</label>
                                    <div class="input-group input-group-merge">
                                        <input class="form-control text-white border-white bg-transparent border-end-0" id="new_password_confirmation" type="password" name="new_password_confirmation" style="	box-shadow: none !important;" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;">
                                        <span class="input-group-text cursor-pointer bg-transparent border-start-0"><i class='bx bx-low-vision' style="color: white"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex justify-content-start mt-3">
                                <button class="btn btn-primary me-3 border-0 fw-bold px-4 py-2" type="submit" style="background-color: #C3C6E2 !important; color: #020202 !important;">Changer Mot de Passe</button>
                                <a href="" type="reset" class="btn btn-label-secondary border-0 fw-bold px-4 py-2" style="background-color: #C13584 !important; color:white;">Quitter</a>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card mt-3 mb-5 border-0 px-5 py-4 shadow-5" style="background-color: #2f3349">
                    <h5 class="fw-bold" style="color: #C3C6E2">Supprimer Mon Compte</h5>
                    <hr style="color: #C3C6E2">
                    <div class="card-body">
                        <div class="mb-3 col-12">
                            <div class="alert alert-warning">
                                <h5 class="alert-heading mb-1">Êtes-vous sûr(e) de vouloir supprimer votre compte ? </h5>
                                <p class="mb-0">
                                    Une fois que vous aurez supprimé votre compte, il n'y aura aucun retour en arrière possible. Veuillez être certain(e) de votre décision.
                                </p>
                            </div>
                        </div>
                        <form id="formAccountDeactivation" action="delete-profile" method="post">
                            <div class="form-check mb-4">
                                <input class="form-check-input bg-transparent" style="box-shadow: none !important;" type="checkbox" name="accountActivation" id="accountActivation" value="1"/>
                                <label class="form-check-label text-white" for="accountActivation">
                                    Je confirme la suppression de mon compte.
                                </label>
                            </div>
                            <button type="submit" class="btn btn-danger deactivate-account"> Supprimer Mon Compte</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
{{-- JS --}}
<script src="./src/js/main.js"></script>
</body>
</html>
