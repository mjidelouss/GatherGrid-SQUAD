package com.squad.squad.repository;

import com.squad.squad.domain.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;
import java.util.Optional;

public class UserRepository {
        private final EntityManagerFactory entityManagerFactory;

        public UserRepository() {
            entityManagerFactory = Persistence.createEntityManagerFactory("default");
        }

        public void save(User user) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
            entityManager.close();
        }

        public User findById(Long id) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            User user = entityManager.find(User.class, id);
            entityManager.close();
            return user;
        }

    public Optional<User> findByEmail(String Email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Optional email = entityManager.createQuery("select u from User u where u.email = :email").setParameter("email", Email).getResultStream().findAny();
        return email;
    }

        public List<User> getAllUsers() {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            List<User> users = entityManager.createQuery("SELECT u FROM User u", User.class).getResultList();
            entityManager.close();
            return users;
        }

        public void update(Long userId, User updatedUser) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            User user = entityManager.find(User.class, userId); // Retrieve the user entity by ID
            if (user != null) {
                // Update the properties of the user entity with the values from the updatedUser object
                user.setUsername(updatedUser.getUsername());
                user.setEmail(updatedUser.getEmail());

                entityManager.merge(user);
            }

            entityManager.getTransaction().commit();
            entityManager.close();
        }

        public void delete(Long userId) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            User user = entityManager.find(User.class, userId); // Retrieve the user entity by ID
            if (user != null) {
                entityManager.remove(user);
            }

            entityManager.getTransaction().commit();
            entityManager.close();
        }

}
