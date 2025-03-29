package com.example.DoAn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User manh);

    boolean existsByEmail(String email);

    User findByEmail(String email);

    User findById(long id);

    Page<User> findAll(Pageable page);

    void deleteById(long id);
}
