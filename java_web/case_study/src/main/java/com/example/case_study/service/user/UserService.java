package com.example.case_study.service.user;

import com.example.case_study.dto.UserDto;
import com.example.case_study.repository.user.IUserRepository;
import com.example.case_study.repository.user.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository userRepository =  new UserRepository();


    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public UserDto login(String email, String password) {
        return userRepository.login(email,password);
    }

    @Override
    public List<UserDto> findAll() {
        return userRepository.findAll();
    }
}
