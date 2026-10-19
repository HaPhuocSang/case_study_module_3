package com.example.case_study.repository.product;

import com.example.case_study.dto.ProductDto;
import com.example.case_study.enity.Product;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.untils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductRepository extends BaseRepository implements IProductRepository {
    private final String SELECT_ALL = "select p.*,c.name as category, ps.name as status from products p join categories c on p.category_id = c.id join product_statuses ps on p.status_id = ps.id order by p.updated_at desc;";
    private final String SELECT_ALL_WHERE_STATUS_NOT_HIDDEN = "select p.*,c.name as category, ps.name as status from products p join categories c on p.category_id = c.id join product_statuses ps on p.status_id = ps.id where ps.name <> 'hidden' order by p.updated_at desc;";
    private final String FIND_BY_CATEGORY_ID = "select p.*,c.name as category, ps.name as status from products p join categories c on p.category_id = c.id join product_statuses ps on p.status_id = ps.id where c.id = ? order by p.updated_at desc;";
    private final String SEARCH_BY_NAME = "select p.*,c.name as category, ps.name as status from products p join categories c on p.category_id = c.id join product_statuses ps on p.status_id = ps.id where p.name like concat('%', ?, '%') order by p.updated_at desc;";
    private final String INSERT_INTO = "insert into products (category_id, status_id, name, price, discount_price, quantity, description, image) values (?, ?, ?, ?, ?, ?, ?, ?);";
    private final String UPDATE = "update products set category_id = ?, status_id = ?, name = ?, price = ?, discount_price = ?, quantity = ?, description = ?, image = ? where id = ?;";
    private final String UPDATE_STATUS = "update products set status_id = ? where id = ?;";
    private final String DELETE = "delete from products where id =?;";

    @Override
    public List<ProductDto> findAll() {
        return getProductListBySql(SELECT_ALL);
    }

    @Override
    public List<ProductDto> getProductList() {
        return getProductListBySql(SELECT_ALL_WHERE_STATUS_NOT_HIDDEN);
    }

    @Override
    public List<ProductDto> findByCategoryId(int categoryId) {
        Connection connection = ConnectDB.getConnectDB();
        List<ProductDto> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_CATEGORY_ID);
            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productList.add(getProductFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public List<ProductDto> searchByName(String name) {
        Connection connection = ConnectDB.getConnectDB();
        List<ProductDto> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                productList.add(getProductFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public boolean addProduct(Product product) {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            setProductParameters(preparedStatement, product);
            int rowEffect = preparedStatement.executeUpdate();
            return rowEffect == 1;
        } catch (SQLException e) {
            System.out.println("lỗi DB");
        }
        return false;
    }

    @Override
    public boolean updateProduct(Product product) {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            setProductParameters(preparedStatement, product);
            preparedStatement.setInt(9, product.getId());
            int rowEffect = preparedStatement.executeUpdate();
            return rowEffect == 1;
        } catch (SQLException e) {
            System.out.println("lỗi DB");
        }
        return false;
    }

    @Override
    public boolean updateProductStatus(int productId, int statusId) {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS);
            preparedStatement.setInt(1, statusId);
            preparedStatement.setInt(2, productId);
            int rowEffect = preparedStatement.executeUpdate();
            return rowEffect == 1;
        } catch (SQLException e) {
            System.out.println("lỗi DB");
        }
        return false;
    }


    @Override
    public boolean deleteProduct(int id) {
        return deleteById(DELETE, id);
    }

    private ProductDto getProductFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String name = resultSet.getString("name");
        double price = resultSet.getDouble("price");
        double discountPrice = resultSet.getDouble("discount_price");
        int quantity = resultSet.getInt("quantity");
        String description = resultSet.getString("description");
        String imageUrl = resultSet.getString("image");
        String category = resultSet.getString("category");
        String status = resultSet.getString("status");
        Date createdAt = resultSet.getDate("created_at");
        Date updatedAt = resultSet.getDate("updated_at");
        return new ProductDto(id, category, status, name, price, discountPrice, quantity, description, imageUrl, createdAt, updatedAt);
    }

    private List<ProductDto> getProductListBySql(String sql) {
        List<ProductDto> productDtoList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                productDtoList.add(getProductFromResultSet(resultSet));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productDtoList;
    }

    private void setProductParameters(PreparedStatement preparedStatement, Product product) throws SQLException {
        preparedStatement.setInt(1, product.getCategoryId());
        preparedStatement.setInt(2, product.getStatusId());
        preparedStatement.setString(3, product.getName());
        preparedStatement.setDouble(4, product.getPrice());
        preparedStatement.setDouble(5, product.getDiscountPrice());
        preparedStatement.setInt(6, product.getQuantity());
        preparedStatement.setString(7, product.getDescription());
        preparedStatement.setString(8, product.getImageUrl());
    }
}
