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
                        + " phoneNumber, email, statusID, majorID,"
                        + " clubID, dmID, avtLink FROM tblUsers "
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
                    String clubID = rs.getString("clubID");
                    String dmID = rs.getString("dmID");
                    String avtLink = rs.getString("avtLink");
                    
                   
                    list.add(new UserDTO(userID, userName, password, roleID, address, phoneNumber, email, statusID, majorID, clubID, dmID, avtLink));
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
            String sql = " SELECT userID, userName, email, phoneNumber, ClubID, DmID, roleID, avtLink FROM tblUsers "
                    + " WHERE userID=? AND Password=? AND statusID = 'AC' ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("userName");
                String email = rs.getString("email");
                String phone = rs.getString("phoneNumber");
                String ClubID = rs.getString("ClubID");
                String DmID = rs.getString("DmID");
                String roleID = rs.getString("roleID");
                String avtLink = rs.getString("avtLink");
                user = new UserDTO(userID, userName, "****", roleID, "", phone, email, "AC", "",ClubID, DmID,   avtLink);
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

    //CRUD
    public boolean insertUserNew(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(userID, userName, password, roleID, Address,"
                        + " phoneNumber, email, statusID, majorID,"
                        + " clubID, dmID, avtLink) "
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getUserName());
                stm.setString(3, user.getPassword());
                stm.setString(4, user.getRoleID());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getPhoneNumber());
                stm.setString(7, user.getEmail());
                stm.setString(8, "AC");
                stm.setString(9, user.getMajorID());
                stm.setString(10, user.getClubID());
                stm.setString(11, user.getDmID());
                stm.setString(12, user.getAvtLink());
                
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
    
    public boolean checkUserExist(String userID) throws SQLException {
        boolean result=false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT userID "
                        + " FROM tblUsers "
                        + " WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public String getClubName(String clubID) throws SQLException {
        String clubName=null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT clubName "
                        + " FROM tblCLs "
                        + " WHERE clubID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, clubID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    clubName = rs.getString("clubName");
                }
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return clubName;
    }
    
    public String getDMName(String dmID) throws SQLException {
        String dmName=null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT dmName "
                        + " FROM tblDMs "
                        + " WHERE dmID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dmID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    dmName = rs.getString("dmName");
                }
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dmName;
    }
    
    public String getRoleName(String roleID) throws SQLException {
        String roleName=null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT roleName "
                        + " FROM tblRoles "
                        + " WHERE roleID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, roleID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    roleName = rs.getString("roleName");
                }
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return roleName;
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
                        + "majorID=?, clubID=?, dmID=?, avtLink=?"
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
                stm.setString(9, user.getClubID());
                stm.setString(10, user.getDmID());
                stm.setString(11, user.getAvtLink());
                stm.setString(12, user.getUserID());
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
                String sql = " UPDATE tblUsers "
                        + " SET statusID = 'NA' "
                        + " WHERE userID=? ";
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
