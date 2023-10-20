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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="src/css/eventCrud.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="src/js/eventCrud.js" type="module"></script>
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Events</b></h2>
                </div>
                <div class="col-sm-6">
                    <a href="#addEventModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Event</span></a>
                    <a href="#deleteEventModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
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
                    <a href="#editEventModal" class="edit" data-toggle="modal" onclick="editEvent('<%= event.getId() %>', '<%= event.getName() %>', '<%= event.getDate() %>', '<%= event.getHour() %>', '<%= event.getPlace() %>', '<%= event.getDescription() %>', '<%= event.getCategory().getId() %>');"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                    <a href="#deleteEventModal" class="delete" data-toggle="modal" onclick="setEventId(<%= event.getId() %>);"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                </td>
                    <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" class="">No Events found</td>
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
<div id="addEventModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="event-servlet/addEvent" method="POST">
                <div class="modal-header">
                    <h4 class="modal-title">Add Event</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="eventName">Event Name</label>
                        <input type="text" id="eventName" name="eventName" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="eventDate">Event Date</label>
                        <input type="date" id="eventDate" name="eventDate" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="eventPlace">Event Place</label>
                        <input type="text" id="eventPlace" name="eventPlace" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="eventTime">Event Time</label>
                        <input type="time" id="eventTime" name="eventTime" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="">Category:</label>
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
                        <label for="eventDescription">Event Description</label>
                        <textarea id="eventDescription" name="eventDescription" class="form-control" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit Modal HTML -->
<div id="editEventModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="event-servlet/editEvent" method="POST">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Event</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Event Name</label>
                        <input type="text" value="" class="form-control" name="editEventName" id="editEventName" required>
                    </div>
                    <div class="form-group">
                        <label>Event Date</label>
                        <input type="date" value="" class="form-control" name="editEventDate" id="editEventDate" required>
                    </div>
                    <div class="form-group">
                        <label>Event Place</label>
                        <input type="text" value="" class="form-control" name="editEventPlace" id="editEventPlace" required>
                    </div>
                    <div class="form-group">
                        <label>Event Time</label>
                        <input type="time" value="" class="form-control" name="editEventTime" id="editEventTime" required>
                    </div>
                    <div class="form-group">
                        <label class="">Category:</label>
                        <select class="form-control" name="editEventCategoryId" id="editEventCategoryId" required>
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
                        <label>Event Description</label>
                        <textarea class="form-control" value="" name="editEventDescription" id="editEventDescription" required></textarea>
                    </div>
                    <!-- Hidden input for event ID -->
                    <input type="hidden" name="editEventId" id="editEventId" value="">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEventModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="event-servlet/deleteEvent" id="deleteEventForm" method="POST">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Event</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Events?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" name="" class="btn btn-danger" value="Delete">
                </div>
                <input type="hidden" id="eventId" name="eventId">
            </form>
        </div>
    </div>
</div>
<script>
    function editEvent(eventId, eventName, eventDate, eventTime, eventPlace, eventDescription, eventCategoryId) {
        document.getElementById('editEventId').value = eventId;
        document.getElementById('editEventName').value = eventName;
        document.getElementById('editEventPlace').value = eventPlace;
        document.getElementById('editEventTime').value = eventTime;
        document.getElementById('editEventDate').valueAsDate = new Date(eventDate);
        document.getElementById('editEventDescription').value = eventDescription;
        document.getElementById('editEventCategoryId').value = eventCategoryId;
    }
    function setEventId(eventId) {
        document.getElementById('eventId').value = eventId;
    }
</script>
</body>
</html>
