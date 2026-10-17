package com.example.case_study.repository;

import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BaseRepository {
    protected boolean deleteById(String sql, int id) {
        try (
                Connection connection = ConnectDB.getConnectDB();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
