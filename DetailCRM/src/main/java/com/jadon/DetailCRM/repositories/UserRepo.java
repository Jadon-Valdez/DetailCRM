package com.jadon.DetailCRM.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jadon.DetailCRM.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
    Optional<User> findByEmail(String email);
    
    Iterable<User> findAll();
}
