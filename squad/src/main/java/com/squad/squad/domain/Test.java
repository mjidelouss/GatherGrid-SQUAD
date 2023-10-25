package com.squad.squad.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class Test {
    List<Event> eventList = new ArrayList<>();

    public List<Event> printEvent(List<Event> events){
        List<Ticket> tickets = new ArrayList<>();
        List<Event> events1 = eventList.stream().filter(event -> event.getComments().size()>20 && event.getDate().after(new Date())).collect(Collectors.toList());
        return events1;
    }
}
