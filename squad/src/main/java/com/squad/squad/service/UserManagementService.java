package com.squad.squad.service;


import com.squad.squad.domain.User;
import com.squad.squad.repository.UserManagementRepository;
import jakarta.persistence.EntityManager;

public class UserManagementService {
    private final UserManagementRepository userManagementRepository;
    public UserManagementService() {
        userManagementRepository = new UserManagementRepository();
    }
    public User updateUser(User user, Long id){
        return userManagementRepository.updateUser(user, id);
    }
    public void deleteUser(Long id){
        userManagementRepository.deleteUser(id);
    }
}
