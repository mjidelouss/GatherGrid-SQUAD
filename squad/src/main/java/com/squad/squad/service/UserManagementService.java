package com.squad.squad.service;


import com.squad.squad.domain.User;
import com.squad.squad.repository.UserManagementRepository;
import jakarta.persistence.EntityManager;

import java.util.Optional;

public class UserManagementService {
    private final UserManagementRepository userManagementRepository;
    public UserManagementService(UserManagementRepository userManagementRepository) {
        this.userManagementRepository = userManagementRepository;
    }
    public User updateUser(User newUser, Long id){
        Optional<User> user = userManagementRepository.getUser(id);
        User uuser = user.orElse(null);
        if(user.isPresent()) {
            return userManagementRepository.updateUser(newUser, uuser);
        }
        return uuser;
    }
    public User resetPassword(User currentUser, String newPassword) {
        Optional<User> user = userManagementRepository.getUser(currentUser.getId());
        User uuser = user.orElse(null);
        if (user.isPresent()) {
            return userManagementRepository.resetPassword(uuser, newPassword);
        }
        return uuser;
    }

    public void deleteUser(Long id) {
        Optional<User> optionalUser = userManagementRepository.getUser(id);
        optionalUser.ifPresent(user -> userManagementRepository.deleteUser(user));
    }

}
