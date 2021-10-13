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
                String sql = "SELECT EVENTID,EVENTNAME,EVENTCREATEDATE,EVENTSTARTDATE,USERID,CATEGORYID,STATUSID,LIMITMEMBER,ROOMID,INTERESTEDID,CONTENT,CLUBID,DMID FROM TblEVENTS "
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
                    String clubID = rs.getString("clubID");
                    String dmID = rs.getString("dmID");
                    list.add(new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, categoryID, statusID, LimitMember, roomID, interestID, content, clubID, dmID));
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
    
    public eventDTO getEvent(String eventID) throws SQLException {
        List<eventDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        eventDTO event = null ;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT eventID, eventName, eventCreateDate, eventStartDate, userID, categoryID, LimitMember, RoomID, interestedID,content, ClubID, DmID"
                        + " From tblEvents "
                        + " WHERE eventID = ? AND statusID='AC'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                if (rs.next()) {                   
                    String eventName = rs.getString("eventName");  
                    Date eventCreateDate = rs.getDate("eventCreateDate");
                    Date eventStartDate = rs.getDate("eventStartDate");
                    String userID = rs.getString("userID");
                    String categoryID = rs.getString("categoryID");
                    int LimitMember = rs.getInt("LimitMember");
                    int RoomID = rs.getInt("RoomID");
                    String interestedID = rs.getString("interestedID");
                    String content = rs.getString("content");
                    String ClubID = rs.getString("ClubID");
                    String DmID = rs.getString("DmID");
                    event = new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, categoryID, "AC", LimitMember, RoomID, interestedID, content, ClubID, DmID);
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
        return event;
    }

    public List<eventDTO> getListEvent(String search) throws SQLException {
        List<eventDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT eventID, eventName, eventCreateDate, eventStartDate, categoryID, LimitMember, RoomID, interestedID,content, ClubID, DmID"
                        + " From tblEvents "
                        + " WHERE eventName like ? AND statusID='AC' ORDER BY eventCreateDate ASC";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");  
                    Date eventCreateDate = rs.getDate("eventCreateDate");
                    Date eventStartDate = rs.getDate("eventStartDate");
                    String categoryID = rs.getString("categoryID");
                    int LimitMember = rs.getInt("LimitMember");
                    int RoomID = rs.getInt("RoomID");
                    String interestedID = rs.getString("interestedID");
                    String content = rs.getString("content");
                    String ClubID = rs.getString("ClubID");
                    String DmID = rs.getString("DmID");
                    list.add(new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, null, categoryID, null, LimitMember, RoomID, interestedID, content, ClubID, DmID));
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

    public int getQuantity() throws SQLException {
        int quantity=0;
        Connection conn = null;
        PreparedStatement stm = null;
         ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT COUNT(*) as quantity " 
                        +" FROM tblEvents ";                    
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    quantity=rs.getInt("quantity");
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
        return quantity;   
    }
    
    public boolean updateUser(eventDTO event) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblEvents "
                        + " SET eventName=?, eventCreateDate=?, eventStartDate=?, userID=?,categoryID=?, statusID=?, limitMember=?, roomID=?, interestID=?, content=?"
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
                stm.setString(10, event.getContent());
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
                String sql = " Insert INTO tblEvents(EVENTID,EVENTNAME,EVENTCREATEDATE,EVENTSTARTDATE,USERID,CATEGORYID,STATUSID,LIMITMEMBER,ROOMID,INTERESTEDID,CONTENT,ClUBID,DMID) "
                        + " Values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
                stm.setString(11, event.getContent());
                stm.setString(12, event.getClubID());
                stm.setString(13, event.getDmID());
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
