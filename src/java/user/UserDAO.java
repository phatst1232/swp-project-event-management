/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author benth
 */
public class UserDAO {

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID, userName, password, roleID, Address,"
                        + " PhoneNumber, Email, statusID, majorID, reportID, "
                        + " interestedDetail FROM tblUsers "
                        + " WHERE userName LIKE ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("USERID");
                    String userName = rs.getString("userName");
                    String password = "***";
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("Address");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String email = rs.getString("Email");
                    String statusID = rs.getString("statusID");
                    String majorID = rs.getString("majorID");
                    String reportID = rs.getString("reportID");
                    String interestedDetail = rs.getString("interestedDetail");
                   
                    list.add(new UserDTO(userID, userName, password, roleID, address, phoneNumber, email, statusID, majorID, reportID, interestedDetail, "", ""));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    //Login and Role
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = " SELECT userName, roleID FROM tblUsers "
                    + " WHERE userID=? AND Password=? AND statusID = 'AC' ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("userName");
                String roleID = rs.getString("ROLEID");
                user = new UserDTO(userID, userName, "", roleID);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public UserDTO checkRole(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT roleID FROM tblUsers "
                    + " WHERE userID=? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            rs = stm.executeQuery();
            if (rs.next()) {
                String roleID = rs.getString("roleID");
                user = new UserDTO(userID, "", roleID, "");
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    //CRUD
    public boolean insertUserNew(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(USERID, USERNAME, PASSWORD, ROLEID, ADDRESS,PHONENUMBER,"
                        + "EMAIL,STATUSID,MAJORID,REPORTID,interestedDetail) "
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getUserName());
                stm.setString(3, user.getPassword());
                stm.setString(4, user.getRoleID());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getPhoneNumber());
                stm.setString(7, user.getEmail());
                stm.setString(8, user.getStatusID());
                stm.setString(9, user.getMajorID());
                stm.setString(10, user.getReportID());
                stm.setString(11, user.getInterestedDetail());
                check = stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean isFPTEmail(String email) {
        String regex = "^[a-z][a-z0-9_\\.]{5,32}@fpt.edu.vn\\b$";
        return email.matches(regex);
    }

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUsers "
                        + " SET userName=?, Password=?, roleID=?, address=?, phoneNumber=?,email=?, statusID=?,"
                        + "majorID=?, reportID=?, interestedDetail=? "
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserName());
                stm.setString(2, user.getPassword());
                stm.setString(3, user.getRoleID());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getPhoneNumber());
                stm.setString(6, user.getEmail());
                stm.setString(7, user.getStatusID());
                stm.setString(8, user.getMajorID());
                stm.setString(9, user.getReportID());
                stm.setString(10, user.getInterestedDetail());
                stm.setString(11, user.getUserID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteUser(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE tblUsers "
                        + " WHERE USERID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
