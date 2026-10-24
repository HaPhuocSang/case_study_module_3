package com.example.case_study.repository.user;

import com.example.case_study.dto.UserDto;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserRepository extends BaseRepository implements IUserRepository{
    private final String SELECT_ALL_USER = "select u.id, u.email, u.password, u.full_name, u.phone, u.address, u.created_at, u.last_login, r.name as role, us.name as status, count(o.id) as order_count from users u join roles r on u.role_id = r.id left join orders o on u.id = o.user_id join user_statuses us on u.status_id = us.id where r.name = 'user' group by u.id, u.email, u.password, u.full_name, u.phone, u.address, u.created_at, u.last_login, r.name, us.name order by u.last_login desc;";
    private final String DELETE = "delete from users where id =?;";
    private final String LOGIN = "select u.id, u.email, u.password, u.full_name, u.phone, u.address, u.created_at, u.last_login, r.name as role, us.name as status, count(o.id) as order_count from users u join roles r on u.role_id = r.id left join orders o on u.id = o.user_id join user_statuses us on u.status_id = us.id where u.email = ? and u.password = ? group by u.id, u.email, u.password, u.full_name, u.phone, u.address, u.created_at, u.last_login, r.name, us.name order by u.last_login desc;";
    @Override
    public boolean deleteUser(int id) {
        return deleteById(DELETE, id);
    }

    @Override
    public UserDto login(String email, String password) {
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(LOGIN)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return getUserFromResultSet(resultSet);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi SQL khi đăng nhập", e);
        }

        return null;
    }

    @Override
    public List<UserDto> findAll() {
        List<UserDto> userList = new ArrayList<>();
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                userList.add(getUserFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }
    private UserDto getUserFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String email = resultSet.getString("email");
        String password = resultSet.getString("password");
        String fullName = resultSet.getString("full_name");
        String phone = resultSet.getString("phone");
        String address = resultSet.getString("address");
        Date createdAt = resultSet.getDate("created_at");
        Date lastLogin = resultSet.getDate("last_login");
        int orderCount = resultSet.getInt("order_count");
        String role = resultSet.getString("role");
        String status = resultSet.getString("status");
        return new UserDto(id, email, password,fullName, phone, address, role, status, createdAt, lastLogin, orderCount);
    }

    @Override
    public boolean emailExists(String email) {
        String sql = "SELECT 1 FROM users WHERE email = ?";

        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, email);

            try (ResultSet rs = statement.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean register(
            String email,
            String password,
            String fullName,
            String phone,
            String address) {

        String sql =
                "INSERT INTO users " +
                        "(email, password, full_name, phone, address, role_id, status_id) " +
                        "SELECT ?, ?, ?, ?, ?, r.id, s.id " +
                        "FROM roles r CROSS JOIN user_statuses s " +
                        "WHERE r.name = 'user' AND s.name = 'active'";

        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, fullName);
            statement.setString(4, phone);
            statement.setString(5, address);

            return statement.executeUpdate() == 1;

        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                return false;
            }

            throw new RuntimeException(e);
        }
    }

}
