package DAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import DBUtils.DBUtils;
import Model.Product;

/**
 *
 * @author 
 */
public class ProductDAO {
    
    private static final String GET = "SELECT productID, name, price, quantity, picture, brand, status FROM tblProducts";
    private static final String GET_QUANTITY = "SELECT quantity FROM tblProducts WHERE productID =?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity = ? WHERE productID =?";
    private static final String SEARCH = "SELECT productID, name, price, quantity, picture, brand FROM tblProducts WHERE name LIKE ?";
    private static final String INSERT="INSERT INTO tblProducts (productID, name, price, quantity,picture,brand,status) VALUES(?,?,?,?,?,?,1) ";
    private static final String DELETE_PRODUCT = "DELETE FROM tblProducts WHERE productID =?";
    public List<Product> getListProduct() throws SQLException, ClassNotFoundException, NamingException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String picture = rs.getString("picture");
                    String brand = rs.getString("brand");
                    Integer status = rs.getInt("status");
                    list.add(new Product(productID, name, price, quantity, picture, brand,status ));
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
    
     public List<Product> getListProduct(String search) throws SQLException, ClassNotFoundException, NamingException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
            ptm= conn.prepareStatement(SEARCH);
            ptm.setString(1,"%"+search+"%");
            rs= ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String picture = rs.getString("picture");
                    String brand = rs.getString("brand");
                    int status = rs.getInt("status");
                    listProduct.add(new Product(productID, name, price, quantity, picture, brand,status));
                }
            }
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return listProduct;
    }

    public boolean checkQuantity(String id, int quantity) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int quantityFromDB = rs.getInt("quantity");
                    if (quantityFromDB >= quantity) {
                        check = true;
                    }
                }
            }   
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public boolean updateQuantity(String productID, int quantity) throws ClassNotFoundException, SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                // Step 1: Get the current quantity from the database
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                int currentQuantity = 0;
                if (rs.next()) {
                    currentQuantity = rs.getInt("quantity");
                }

                // Step 2: Calculate the new quantity
                int newQuantity = currentQuantity - quantity;

                // Step 3: Update the quantity in the database
                ptm.close();
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, productID);
                check = ptm.executeUpdate() > 0;
            }   
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
     public boolean insertV2(Product product) throws ClassNotFoundException, SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
            try{
                conn=DBUtils.getConnection();
                if(conn!=null){
                    ptm=conn.prepareStatement(INSERT);
                    ptm.setString(1,product.getProductID());
                    ptm.setString(2,product.getName());
                    ptm.setDouble(3,product.getPrice());
                    ptm.setInt(4,product.getQuantity());
                    ptm.setString(5, product.getPicture());
                    ptm.setString(6, product.getBrand());
                    check=ptm.executeUpdate()>0?true:false;
                }
            }finally{
                if (rs != null) rs.close();
                if (ptm != null) ptm.close();
                if (conn != null) conn.close();
            }
            return check;
    }
    
     
      public void deleteProduct(String pid) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setString(1, pid);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
  public boolean update(Product pro) throws SQLException, ClassNotFoundException, NamingException {
    boolean check = false;
    Connection conn = null;
    PreparedStatement ptm = null;
    try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            String sql = "UPDATE tblProducts SET name=?, price=?, quantity=?, picture=?, brand=? WHERE productID=?";
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, pro.getName());
            ptm.setDouble(2, pro.getPrice());
            ptm.setInt(3, pro.getQuantity());
            ptm.setString(4, pro.getPicture());
            ptm.setString(5, pro.getBrand());
            ptm.setString(6, pro.getProductID());
            check = ptm.executeUpdate() > 0;
        }
    } finally {
        if (ptm != null) ptm.close();
        if (conn != null) conn.close();
    }
    return check;
}

    
}
