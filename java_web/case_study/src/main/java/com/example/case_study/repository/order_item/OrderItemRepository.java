package com.example.case_study.repository.order_item;

import com.example.case_study.enity.OrderItem;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderItemRepository extends BaseRepository implements IOrderItemRepository {
    private final String SELECT_ORDER_ITEM_BY_ORDER_ID = "select * from order_item where order_id = ?";
    private final String DELETE = "delete from order_items where id =?;";

    @Override
    public List<OrderItem> findOrderItemByOrderId(int orderId) {
        Connection connection = ConnectDB.getConnectDB();
        List<OrderItem> orderItems = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_ITEM_BY_ORDER_ID);
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idOrder = resultSet.getInt("order_id");
                int productId = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                orderItems.add(new OrderItem(id, idOrder,productId, productName,price, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderItems;
    }

    @Override
    public boolean deleteOrderItem(int orderItemId) {
        return deleteById(DELETE, orderItemId);
    }
}
