package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> findAll() {
        return this.userRepository.findAll();
    }

    public User findById(long id) {
        return this.userRepository.findById(id);
    }

    public List<User> findByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User createUser(User user) {
        user = this.userRepository.save(user);
        System.out.println("Create user" + user);
        return user;
    }

    public User updateUser(User user) {
        user = this.userRepository.save(user);
        return user;
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

}
