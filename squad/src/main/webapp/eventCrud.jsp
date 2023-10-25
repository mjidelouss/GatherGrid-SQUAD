<%@ page import="com.squad.squad.domain.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="com.squad.squad.domain.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Events</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Montserrat:wght@300;400;500;600;700;800;900&family=Mynerve&family=Pacifico&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Unkempt:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="src/css/eventCrud.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="src/js/eventCrud.js" type="module"></script>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Events</b></h2>
                </div>
                <div class="col-sm-6">
                    <a href="" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addEventModal"><i class="material-icons">&#xE147;</i> <span>Add New Event</span></a>
                    <a href="" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteEventModal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>
       <span class="custom-checkbox">
        <input type="checkbox" id="selectAll">
        <label for="selectAll"></label>
       </span>
                </th>
                <th>Name</th>
                <th>Place</th>
                <th>Date</th>
                <th>Hour</th>
                <th>Category</th>
                <th>Organiser</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Event> events = (List<Event>) request.getAttribute("events");
                System.out.println("------------");
                System.out.println(events);
                if (events != null && !events.isEmpty()) {
                    for (Event event : events) {
            %>
            <tr>
                <td>
       <span class="custom-checkbox">
        <input type="checkbox" id="checkbox1" name="options[]" value="1">
        <label for="checkbox1"></label>
       </span>
                </td>
                <td><%= event.getName() %></td>
                <td><%= event.getPlace() %></td>
                <td><%= event.getDate() %></td>
                <td><%= event.getHour() %></td>
                <td><%= event.getCategory().getName() %></td>
                <td><%= event.getOrganiser().getFirstName() %></td>
                <td>
                    <a href="" class="edit" data-bs-toggle="modal" data-bs-target="#editEventModal" onclick="editEvent('<%= event.getId() %>', '<%= event.getName() %>', '<%= event.getDate() %>', '<%= event.getHour() %>', '<%= event.getPlace() %>', '<%= event.getDescription() %>', '<%= event.getCategory().getId() %>', '<%= event.getTicket().get(0).getPrice() %>', '<%= event.getTicket().get(0).getAvailableQuantity() %>', '<%= event.getTicket().get(0).getTicketType().name() %>', '<%= event.getTicket().get(0).getId() %>');"><i class="material-icons" data-bs-toggle="tooltip" title="Edit">&#xE254;</i></a>
                    <a href="" class="delete" data-bs-toggle="modal" data-bs-target="#deleteEventModal" onclick="setEventId('<%= event.getId() %>', '<%= event.getTicket().get(0).getId() %>');"><i class="material-icons" data-bs-toggle="tooltip" title="Delete">&#xE872;</i></a>
                </td>
                <td></td>
                    <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" class="d-flex justify-content-center">No Events found</td>
            </tr>
            <%
                }
            %>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- Add Modal HTML -->
<div class="modal fade" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="addEventModal" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
        <div class="modal-content rounded-0">
            <div class="modal-body py-0">
                <div class="d-flex main-content">
                    <div class="bg-image promo-img mr-3" style="background-image: url('./src/assets/party.jpg');"></div>
                    <div class="content-text p-4 w-100">
                        <h3>Add Event</h3>
            <form action="event-servlet/addEvent" method="POST">
                    <div class="form-group">
                        <label for="eventName" class="col-form-label">Event Name</label>
                        <input type="text" id="eventName" name="eventName" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="eventDate" class="col-form-label">Event Date</label>
                        <input type="date" id="eventDate" name="eventDate" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="eventPlace" class="col-form-label">Event Place</label>
                        <input type="text" id="eventPlace" name="eventPlace" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="eventTime" class="col-form-label">Event Time</label>
                        <input type="time" id="eventTime" name="eventTime" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Category:</label>
                        <select id="category" name="eventCategory" class="form-control" required>
                            <option disabled selected> Select Category</option>
                            <%
                                List<Category> categories = (List<Category>) request.getAttribute("categories");
                                if (categories != null && !categories.isEmpty()) {
                                    for (Category category : categories) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName() %></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                <div class="form-group">
                    <label for="eventTicketsQuantity" class="col-form-label">Tickets Quantity</label>
                    <input type="text" id="eventTicketsQuantity" name="eventTicketsQuantity" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="eventTicketPrice" class="col-form-label">Ticket Price</label>
                    <input type="text" id="eventTicketPrice" name="eventTicketPrice" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Ticket Type:</label>
                    <select id="ticketType" name="eventTicketType" class="form-control" required>
                        <option disabled selected> Select Ticket Type</option>
                        <option value="STANDARD">STANDARD</option>
                        <option value="VIP">VIP</option>
                    </select>
                </div>
                    <div class="form-group">
                        <label for="eventDescription" class="col-form-label">Event Description</label>
                        <textarea id="eventDescription" name="eventDescription" class="form-control" required></textarea>
                    </div>
                <div class="form-group mt-3 d-flex justify-content-center">
                    <input type="button" class="btn btn-default w-50 btn-block" data-bs-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success opacity-75 w-50 btn-block" value="Add Event">
                </div>
            </form>
        </div>
    </div>
</div>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
            <div class="modal fade" id="editEventModal" tabindex="-1" role="dialog" aria-labelledby="editEventModal" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                    <div class="modal-content rounded-0">
                        <div class="modal-body py-0">
                            <div class="d-flex main-content">
                                <div class="bg-image promo-img mr-3" style="background-image: url('./src/assets/party.jpg');">
                                </div>
                                <div class="content-text p-4 w-100">
                                    <h3>Edit Event</h3>
                                    <form action="event-servlet/editEvent" method="POST">
                                        <div class="form-group">
                                            <label for="eventName" class="col-form-label">Event Name</label>
                                            <input type="text" id="editEventName" name="editEventName" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="eventDate" class="col-form-label">Event Date</label>
                                            <input type="date" id="editEventDate" name="editEventDate" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="eventPlace" class="col-form-label">Event Place</label>
                                            <input type="text" id="editEventPlace" name="editEventPlace" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="eventTime" class="col-form-label">Event Time</label>
                                            <input type="time" id="editEventTime" name="editEventTime" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">Category:</label>
                                            <select id="editEventCategoryId" name="editEventCategoryId" class="form-control" required>
                                                <option value="" selected> Select Category</option>
                                                <%
                                                    for (Category category : categories) {
                                                %>
                                                <option value="<%= category.getId() %>"><%= category.getName() %></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventTicketsQuantity" class="col-form-label">Tickets Quantity</label>
                                            <input type="text" id="editEventTicketsQuantity" name="editEventTicketsQuantity" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventTicketPrice" class="col-form-label">Ticket Price</label>
                                            <input type="text" id="editEventTicketPrice" name="editEventTicketPrice" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">Ticket Type:</label>
                                            <select id="editEventTicketType" name="editEventTicketType" class="form-control" required>
                                                <option value="" selected> Select Ticket Type</option>
                                                <option value="STANDARD">STANDARD</option>
                                                <option value="VIP">VIP</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventDescription" class="col-form-label">Event Description</label>
                                            <textarea id="editEventDescription" name="editEventDescription" class="form-control" required></textarea>
                                        </div>
                                        <input type="hidden" name="editEventId" id="editEventId" value="">
                                        <input type="hidden" name="editTicketId" id="editTicketId" value="">
                                        <div class="form-group mt-3 d-flex justify-content-center">
                                            <input type="button" class="btn btn-default w-50 btn-block" data-bs-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-info opacity-75 w-50 btn-block" value="Update Event">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- Delete Modal HTML -->
<div class="modal fade" id="deleteEventModal" tabindex="-1" role="dialog" aria-labelledby="deleteEventModal" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content rounded-0">
            <div class="modal-body py-0">
                <div class="d-flex main-content">
                    </div>
                    <div class="content-text p-4 w-100">
                        <h3>Delete Event</h3>
                        <form action="event-servlet/deleteEvent" method="POST">
                            <p>Are you sure you want to delete these Events?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                            <div class="form-group mt-3 d-flex justify-content-center">
                                <input type="button" class="btn btn-default w-50 btn-block" data-bs-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-danger opacity-75 w-50 btn-block" value="Delete">
                            </div>
                            <input type="hidden" name="ticketId" id="ticketId" value="">
                            <input type="hidden" id="eventId" name="eventId">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
        function editEvent(eventId, eventName, eventDate, eventTime, eventPlace, eventDescription, eventCategoryId, eventTicketPrice, eventTicketQuantity, eventTicketType, ticketId) {
            document.getElementById('editEventId').value = eventId;
            document.getElementById('editEventName').value = eventName;
            document.getElementById('editEventPlace').value = eventPlace;
            document.getElementById('editEventTime').value = eventTime;
            document.getElementById('editEventDate').valueAsDate = new Date(eventDate);
            document.getElementById('editEventDescription').value = eventDescription;
            document.getElementById('editEventCategoryId').value = eventCategoryId;
            document.getElementById('editEventTicketsQuantity').value = eventTicketQuantity;
            document.getElementById('editEventTicketPrice').value = eventTicketPrice;
            document.getElementById('editEventTicketType').value = eventTicketType;
            document.getElementById('editTicketId').value = ticketId;
        }
        function setEventId(eventId, ticketId) {
            document.getElementById('eventId').value = eventId;
            document.getElementById('ticketId').value = ticketId;
        }
</script>
</body>
</html>
