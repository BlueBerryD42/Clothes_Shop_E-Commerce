/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import Model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author ASUS
 */
public class OrderDetailDAO {
        private static final String INSERT = "INSERT INTO tblOrderDetail (orderID, productID, price, quantity, status) VALUES(?, ?, ?, ?, 1)";
    
    public boolean insert(OrderDetail orderDetail) throws ClassNotFoundException, SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, orderDetail.getOrderID());
                ptm.setString(2, orderDetail.getProductID());
                ptm.setDouble(3, orderDetail.getPrice());
                ptm.setInt(4, orderDetail.getQuantity());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
}
