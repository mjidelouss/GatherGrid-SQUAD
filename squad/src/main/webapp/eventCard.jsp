<%@ page import="com.squad.squad.domain.Event" %>
<%@ page import="java.util.List" %>
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