<%@ page import="com.squad.squad.domain.Event" %>
<%@ page import="java.util.List" %>
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
                    <a href="#editEventModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                    <a href="#deleteEventModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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

<!-- Edit Modal HTML -->
<div id="addEventModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Add Event</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Event Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Date</label>
                        <input type="date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Place</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Time</label>
                        <input type="time" class="form-control" required>
                    </div>
                        <div class="form-group">
                            <strong class="fs-5">Category:</strong>
                            <select class="form-control" name="category_id" required>
                                <option disabled selected> Select Category</option>
                                <option value="">{{ $category->category }}</option>
                                @endforeach
                            </select>
                        </div>
                    <div class="form-group">
                        <label>Event Description</label>
                        <textarea class="form-control" required></textarea>
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
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Edit Event</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Event Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Date</label>
                        <input type="date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Place</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Time</label>
                        <input type="time" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Event Description</label>
                        <textarea class="form-control" required></textarea>
                    </div>
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
            <form>
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
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
