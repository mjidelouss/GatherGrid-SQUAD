package com.squad.squad.repository;

import com.squad.squad.domain.Event;
import com.squad.squad.domain.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;

public class UserManagementRepository {
    private final EntityManager entityManager;

    public UserManagementRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Optional<User> getUser(Long id){
        try {
            User user = entityManager.find(User.class, id);
            return Optional.ofNullable(user);
        }catch (Exception e){
          return Optional.empty();
        }
    }

    public User updateUser(User newUser, User oldUser){
        entityManager.getTransaction().begin();
        oldUser.setEmail(newUser.getEmail());
        oldUser.setFirstName(newUser.getFirstName());
        oldUser.setLastName(newUser.getLastName());
        oldUser.setUsername(newUser.getUsername());
        entityManager.merge(oldUser);
        entityManager.getTransaction().commit();
        return oldUser;
    }

    public User resetPassword(User user, String newPassword) {
        entityManager.getTransaction().begin();
        user.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt()));
        entityManager.merge(user);
        entityManager.getTransaction().commit();
        return user;
    }


    /*public void deleteUser(Long id){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        User user = getUser(id);
        if (user != null) {
            entityManager.remove(user);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }*/

    public void deleteUser(User user) {
        entityManager.getTransaction().begin();
        entityManager.remove(user);
        entityManager.getTransaction().commit();
    }


}
