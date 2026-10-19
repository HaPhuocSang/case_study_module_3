package com.example.case_study.repository.order_status;

import com.example.case_study.enity.OrderStatus;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderIStatusRepository implements IOrderIStatusRepository {
    private final String SELECT_ALL = "select * from order_statuses;";
    @Override
    public List<OrderStatus> findAll() {
        Connection connection = ConnectDB.getConnectDB();
        List<OrderStatus> orderStatusList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String status = resultSet.getString("name");
                orderStatusList.add(new OrderStatus(id, status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderStatusList;
    }
}
