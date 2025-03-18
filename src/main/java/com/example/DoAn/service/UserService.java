package com.example.DoAn.service;

import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Role;
import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.RegisterDTO;
import com.example.DoAn.repository.RoleRepository;
import com.example.DoAn.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User handleSaveUser(User user) {
        User manh = this.userRepository.save(user);
        return manh;
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
