/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author benth
 */
public class eventDAO {

    public List<eventDTO> getlistEvent(String search) throws SQLException {
        List<eventDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT EVENTID,EVENTNAME,EVENTCREATEDATE,EVENTSTARTDATE,USERID,CATEGORYID,STATUSID,LIMITMEMBER,ROOMID,INTERESTEDID FROM TblEVENTS "
                        + " WHERE EVENTIDLIKE ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");
                    Date eventCreateDate = rs.getDate("eventCreateDate");
                    Date eventStartDate = rs.getDate("eventStartDate");
                    String userID = rs.getString("userID");
                    String categoryID = rs.getString("categoryID");
                    String statusID = rs.getString("statusID");
                    int LimitMember = Integer.parseInt(rs.getString("LimitMember"));
                    int roomID = Integer.parseInt(rs.getString("RoomID"));
                    String interestID = rs.getString("InterestID");
                    String content = rs.getString("content");
                    list.add(new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, categoryID, statusID, LimitMember, roomID, interestID,content));
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

    public boolean deleteEvent(String eventID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE tblUsers "
                        + " WHERE eventID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
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

    public boolean updateUser(eventDTO event) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblEvents "
                        + " SET eventName=?, eventCreateDate=?, eventStartDate=?, userID=?,categoryID=?, statusID=?, limitMember=?, roomID=?, interestID=?"
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, event.getEventName());
                stm.setDate(2, event.getCreateDate());
                stm.setDate(3, event.getEventStartDate());
                stm.setString(4, event.getUserID());
                stm.setString(5, event.getCategoryID());
                stm.setString(6, event.getStatusID());
                stm.setInt(7, event.getLimitMember());
                stm.setInt(8, event.getRoomID());
                stm.setString(9, event.getInterestedID());
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
    
    public boolean AddEvent(eventDTO event) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Insert INTO tblEvents( EVENTID,EVENTNAME,EVENTCREATEDATE,EVENTSTARTDATE,USERID,CATEGORYID,STATUSID,LIMITMEMBER,ROOMID,INTERESTEDID)"
                        + "Values (?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, event.getEventID());
                stm.setString(2, event.getEventName());
                stm.setDate(3, event.getCreateDate());
                stm.setDate(4, event.getEventStartDate());
                stm.setString(5, event.getUserID());
                stm.setString(6, event.getCategoryID());
                stm.setString(7, event.getStatusID());
                stm.setInt(8, event.getLimitMember());
                stm.setInt(9, event.getRoomID());
                stm.setString(10, event.getInterestedID());
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
}
