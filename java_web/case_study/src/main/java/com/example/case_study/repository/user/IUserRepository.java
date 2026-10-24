package com.example.case_study.repository.user;

import com.example.case_study.dto.UserDto;
import com.example.case_study.repository.IRepository;

public interface IUserRepository extends IRepository<UserDto> {
    boolean deleteUser(int id);

    UserDto login(String email, String password);

    boolean emailExists(String email);

    boolean register(
            String email,
            String password,
            String fullName,
            String phone,
            String address
    );
}
