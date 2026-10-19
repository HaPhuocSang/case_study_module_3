package com.example.case_study.repository.order;

import com.example.case_study.dto.OrderDto;
import com.example.case_study.enity.Order;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderRepository implements IOrderRepository {
    private final String SELECT_ALL = "select o.*, u.full_name as user_name, os.name as status, pm.name as payment_method, coalesce(sum(oi.price * oi.quantity), 0) as total_amount from orders o join users u on o.user_id = u.id join order_statuses os on o.status_id = os.id left join order_items oi on oi.order_id = o.id left join payments p on p.order_id = o.id left join payment_methods pm on p.payment_method_id = pm.id group by o.id, u.full_name, os.name, pm.name order by o.updated_at desc;";
    private final String SEARCH_BY_USER_NAME = "select o.*, u.full_name as user_name, os.name as status, pm.name as payment_method, coalesce(sum(oi.price * oi.quantity), 0) as total_amount from orders o join users u on o.user_id = u.id join order_statuses os on o.status_id = os.id left join order_items oi on oi.order_id = o.id left join payments p on p.order_id = o.id left join payment_methods pm on p.payment_method_id = pm.id where u.full_name like concat('%', ?, '%') group by o.id, u.full_name, os.name, pm.name order by o.updated_at desc;";
    private final String FIND_ORDER_BY_ID = "select o.*, u.full_name as user_name, os.name as status, pm.name as payment_method, coalesce(sum(oi.price * oi.quantity), 0) as total_amount from orders o join users u on o.user_id = u.id join order_statuses os on o.status_id = os.id left join order_items oi on oi.order_id = o.id left join payments p on p.order_id = o.id left join payment_methods pm on p.payment_method_id = pm.id where o.id = ? group by o.id, u.full_name, os.name, pm.name order by o.updated_at desc;";
    private final String UPDATE = "update orders set status_id = ? where id = ?;";

    @Override
    public List<OrderDto> findAll() {
        List<OrderDto> orders = new ArrayList<>();
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                orders.add(getOrderFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }

    private OrderDto getOrderFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String userName =  resultSet.getString("user_name");
        String status  = resultSet.getString("status");
        String receiverName = resultSet.getString("receiver_name");
        String receiverPhone =  resultSet.getString("receiver_phone");
        String receiverAddress =  resultSet.getString("receiver_address");
        Double totalAmount  = resultSet.getDouble("total_amount");
        String description =  resultSet.getString("description");
        String paymentMethod = resultSet.getString("payment_method");
        Date createTime  = resultSet.getDate("created_at");
        Date updateTime   = resultSet.getDate("updated_at");
        return new OrderDto(id, userName, status, receiverName, receiverPhone, receiverAddress, totalAmount, description, paymentMethod, createTime, updateTime);
    }

    @Override
    public boolean updateOrder(int orderId, int orderStatusId) {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(1, orderStatusId);
            preparedStatement.setInt(2, orderId);
            int rowEffect = preparedStatement.executeUpdate();
            return rowEffect == 1;
        } catch (SQLException e) {
            System.out.println("lỗi DB");
        }
        return false;
    }

    @Override
    public OrderDto getOrderByOrderId(int orderId) {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ORDER_BY_ID);
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getOrderFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<OrderDto> searchOrderByUserName(String userName) {
        List<OrderDto> orders = new ArrayList<>();
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_USER_NAME);
            preparedStatement.setString(1, userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                orders.add(getOrderFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }
}
