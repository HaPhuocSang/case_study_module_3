package com.example.case_study.service;

import java.util.List;

public interface IService<T> {
    List<T> findAll();
}
