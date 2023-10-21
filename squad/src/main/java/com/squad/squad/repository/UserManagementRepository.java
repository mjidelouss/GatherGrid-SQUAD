package com.squad.squad.repository;

import com.squad.squad.domain.Event;
import com.squad.squad.domain.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class UserManagementRepository {
    private final EntityManagerFactory entityManagerFactory;

    public UserManagementRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
    }

    public User getUser(Long id){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        User user = entityManager.find(User.class, id);
        return user;
    }

    public User updateUser(User user, Long id){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        User updatedUser = getUser(id);
        if(updatedUser != null){
            updatedUser.setEmail(user.getEmail());
            updatedUser.setFirstName(user.getFirstName());
            updatedUser.setLastName(user.getLastName());
            updatedUser.setUsername(user.getUsername());
            updatedUser.setPassword(user.getPassword());
            entityManager.merge(updatedUser);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
        return updatedUser;
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
    public void deleteUser(Long id){
        User user = getUser(id);
        if (user != null) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            User u = entityManager.merge(user);

            entityManager.remove(u);
            entityManager.getTransaction().commit();
            entityManager.close();
        }
    }
}
