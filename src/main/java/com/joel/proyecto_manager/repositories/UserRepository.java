package com.joel.proyecto_manager.repositories;

import com.joel.proyecto_manager.models.User;

public interface UserRepository extends BaseRepository<User> {
    
    User findByEmail(String email);

}