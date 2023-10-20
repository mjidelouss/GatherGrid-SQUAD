package com.squad.squad.service;

import com.squad.squad.domain.User;
import com.squad.squad.repository.UserRepository;

import java.util.Optional;

public class UserService {
    UserRepository repository ;

    public UserService() {
        this.repository = new UserRepository();
    }
    public Optional<User> save(User user){
        Optional<User> byEmail = repository.findByEmail(user.getEmail());
        if(byEmail.isEmpty()){
           repository.save(user);
        }
        return byEmail;
    }

}
