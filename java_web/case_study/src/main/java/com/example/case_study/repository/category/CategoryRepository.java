package com.example.case_study.repository.category;

import com.example.case_study.enity.Category;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository extends BaseRepository implements ICategoryRepository {
    private final String SELECT_ALL = "select * from categories;";
    private final String INSERT_INTO = "insert into categories (name) values (?)";
    private final String DELETE = "delete from categories where id =?;";
    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = new Category(id, name);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }

    @Override
    public boolean addCategory(Category category) {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, category.getName());
            int rowEffect = preparedStatement.executeUpdate();
            return rowEffect == 1;
        } catch (SQLException e) {
            System.out.println("lỗi DB");
        }
        return false;
    }

    @Override
    public boolean deleteCategory(int id) {
        return deleteById(DELETE, id);
    }
}
