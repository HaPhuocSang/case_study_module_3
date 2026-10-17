package com.example.case_study.enity;

public class UserStatus {
    private int id;
    private String name;

    public UserStatus() {
    }

    public UserStatus(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
