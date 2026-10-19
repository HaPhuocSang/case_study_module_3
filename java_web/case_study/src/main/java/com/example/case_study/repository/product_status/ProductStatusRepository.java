package com.example.case_study.repository.product_status;

import com.example.case_study.enity.ProductStatus;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductStatusRepository implements IProductStatusRepository {
    private final String SELECT_ALL = "select * from product_statuses";
    @Override
    public List<ProductStatus> findAll() {
        List<ProductStatus> productStatusList = new ArrayList<>();
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                productStatusList.add(new ProductStatus(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productStatusList;
    }
}
