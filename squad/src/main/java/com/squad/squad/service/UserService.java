package com.squad.squad.service;

import com.squad.squad.domain.User;
import com.squad.squad.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;

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
    public Optional<User> CheckEmail(String email , String pass){
        Optional<User> user1 = repository.findByEmail(email);
        if(user1.isPresent()) {
            if( BCrypt.checkpw(pass ,user1.get().getPassword())) {
                return user1;
            }
        }
        return Optional.empty();
    }
}
