package com.squad.squad.utils;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.*;

public class EntityManagerUtil {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
    private static EntityManager entityManager;

    private EntityManagerUtil() {}

    public static EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = emf.createEntityManager();
        }
        return entityManager;
    }

    public static void closeEntityManager() {
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
    }
}

