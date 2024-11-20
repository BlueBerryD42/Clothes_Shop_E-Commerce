/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Account;
import javax.naming.NamingException;
/**
 *
 * @author ASUS
 */
public class AccountDAO {

    private static final String LOGIN="SELECT userID, fullname, roleID, picture FROM tblUsers WHERE userID = ? AND password = ?";
    private static final String SEARCH="SELECT userID, fullname, roleID, picture FROM tblUsers WHERE fullName LIKE ?";
    private static final String DELETE="DELETE tblUsers WHERE userid = ?";
    private static final String UPDATE="UPDATE tblUsers SET fullName = ?, roleID = ? WHERE userid = ?";
    private static final String DUPLICATE="SELECT userID, fullname, roleID FROM tblUsers WHERE userID = ?";
    private static final String INSERT="INSERT INTO tblUsers(userID, fullName, roleID, password, picture,status) VALUES(?, ?, ?, ?, ?,1)"   ; 
    private static final String SELECTTOP="SELECT TOP 1 userID, fullName, roleID FROM tblUsers";
    public Account checkLogin(String userID, String password) throws SQLException, ClassNotFoundException, NamingException {
        Account user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userIDfromDB = rs.getString("userID");
                    String fullName = rs.getString("fullname");
                    String roleID = rs.getString("roleID");
                    String picture = rs.getString("picture");
                    user = new Account(userIDfromDB, fullName, roleID, "***", picture);
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
              
        return user;
    }

    public List<Account> getListUser(String search) throws SQLException, ClassNotFoundException, NamingException {
        List<Account> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullname");
                    String roleID = rs.getString("roleID");
                    String password = "***";                    
                    String picture = rs.getString("picture");
                    list.add(new Account(userID, fullName, roleID, password, picture));                    
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
public Account getListUserTop1Last() throws SQLException, ClassNotFoundException, NamingException {
        Account user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECTTOP);
              
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new Account(userID, fullName, roleID,"","");                    
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return user;
    }


    public boolean delete(String userID) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public boolean update(Account user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getUserID());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    } 

    public boolean checkDuplicate(String userID) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
              
        return check;
    }

    public boolean insert(Account user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                ptm.setString(5, user.getPicture());
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

