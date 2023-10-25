<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Event</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="src/css/myEvent.css">
</head>
<body>
<%@ include file="eventNavbar.jsp"%>
<div class="container mt-3">
    <div class="profile-wrapper">
        <div class="profile-section-user">
            <div class="profile-cover-img"><img src="./src/assets/party.jpg" alt></div>
                <div class="text-center mt-3">
                    <h5 class="text-uppercase mb-4">Event Name</h5>
                    <p class="text-muted fz-base">Event Description.</p>
            </div>

            <hr class="m-0">
            <div class="hidden-sm-down">
                <hr class="m-0">
                <div class="profile-info-contact p-4">
                    <h6 class="mb-3">Event Information</h6>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td><strong>Event Place:</strong></td>
                            <td>
                                <p class="text-muted mb-0">Youssoufia</p>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Event Date:</strong></td>
                            <td>
                                <p class="text-muted mb-0">Date</p>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Event Time:</strong></td>
                            <td>
                                <p class="text-muted mb-0">Time of the event</p>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Category:</strong></td>
                            <td>
                                <p class="text-muted mb-0">event Cat</p>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Organiser:</strong></td>
                            <td>
                                <p class="text-muted mb-0">Organiser Name</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-center p-3 py-2">
                    <button class="btn btn-primary opacity-75">Buy Standard Ticket</button>
                    <button class="btn btn-warning opacity-75 px-4 ms-1">Buy VIP Ticket</button>
                </div>
            </div>
        </div>

        <div class="profile-section-main">

            <ul class="nav nav-tabs profile-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#profile-overview" role="tab">Comments</a></li>
            </ul>


            <div class="tab-content profile-tabs-content">
                <div class="tab-pane active" id="profile-overview" role="tabpanel">
                    <div class="post-editor">
                        <textarea name="post-field" id="post-field" class="post-field" placeholder="Write Something!"></textarea>
                        <div class="d-flex">
                            <button class="btn btn-success px-4 py-1">Post</button>
                        </div>
                    </div>

                    <div class="stream-posts">
                        <div class="stream-post">
                            <div class="sp-author">
                                <a href="#" class="sp-author-avatar"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt></a>
                                <h6 class="sp-author-name"><a href="#">John Doe</a></h6></div>
                            <div class="sp-content">
                                <div class="sp-info">posted 1h ago</div>
                                <p class="sp-paragraph mb-0">Auk Soldanella plainscraft acetonylidene wolfishness irrecognizant Candolleaceae provision Marsipobranchii arpen Paleoanthropus supersecular inidoneous autoplagiarism palmcrist occamy equestrianism periodontoclasia mucedin overchannel goelism decapsulation pourer zira</p>
                            </div>

                        </div>

                        <div class="stream-post">
                            <div class="sp-author">
                                <a href="#" class="sp-author-avatar"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt></a>
                                <h6 class="sp-author-name"><a href="#">Palmira Guthridge</a></h6></div>
                            <div class="sp-content">
                                <div class="sp-info">posted 1h ago</div>
                                <p class="sp-paragraph mb-0">Auk Soldanella plainscraft acetonylidene wolfishness irrecognizant Candolleaceae provision Marsipobranchii arpen Paleoanthropus supersecular inidoneous autoplagiarism palmcrist occamy equestrianism periodontoclasia mucedin overchannel goelism decapsulation pourer zira</p>
                            </div>

                        </div>

                        <div class="stream-post">
                            <div class="sp-author">
                                <a href="#" class="sp-author-avatar"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt></a>
                                <h6 class="sp-author-name"><a href="#">Meghann Fraser</a></h6></div>
                            <div class="sp-content">
                                <div class="sp-info">posted 2h ago</div>
                                <p class="sp-paragraph mb-0">Auk Soldanella plainscraft acetonylidene wolfishness irrecognizant Candolleaceae provision Marsipobranchii arpen Paleoanthropus supersecular inidoneous autoplagiarism palmcrist occamy equestrianism periodontoclasia mucedin overchannel goelism decapsulation pourer zira</p>
                            </div>
                        </div>

                        <div class="stream-post">
                            <div class="sp-author">
                                <a href="#" class="sp-author-avatar"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt></a>
                                <h6 class="sp-author-name"><a href="#">Kent Lemaitre</a></h6></div>
                            <div class="sp-content">
                                <div class="sp-info">posted 1h ago</div>
                                <p class="sp-paragraph mb-0">Auk Soldanella plainscraft acetonylidene wolfishness irrecognizant Candolleaceae provision Marsipobranchii arpen Paleoanthropus supersecular inidoneous autoplagiarism palmcrist occamy equestrianism periodontoclasia mucedin overchannel goelism decapsulation pourer zira</p>
                            </div>

                        </div>

                        <div class="stream-post mb-0">
                            <div class="sp-author">
                                <a href="#" class="sp-author-avatar"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt></a>
                                <h6 class="sp-author-name"><a href="#">Loria Lambing</a></h6></div>
                            <div class="sp-content">
                                <div class="sp-info">posted 2 days ago</div>
                                <p class="sp-paragraph">Auk Soldanella plainscraft acetonylidene wolfishness irrecognizant Candolleaceae provision Marsipobranchii arpen Paleoanthropus supersecular inidoneous</p>
                                <p class="sp-paragraph">autoplagiarism palmcrist occamy equestrianism periodontoclasia mucedin overchannel goelism decapsulation pourer zira</p>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

        </div>

    </div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
