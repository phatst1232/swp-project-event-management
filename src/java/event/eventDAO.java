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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author benth
 */
public class eventDAO {

    public List<eventDTO> getListEvent(String search) throws SQLException {
        List<eventDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT eventID,eventName,eventCreateDate,eventStartDate, "
                        + " userID,statusID,limitMember, "
                        + " content,clubID,dmID,[like] "
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
                    String userID = rs.getString("userID");
                    String statusID = rs.getString("statusID");
                    int limitMember = rs.getInt("limitMember");
                    String content = rs.getString("content");
                    String clubID = rs.getString("clubID");
                    String dmID = rs.getString("dmID");
                    int like = rs.getInt("like");
                    list.add(new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, statusID, limitMember, content, clubID, dmID, like));
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

    public boolean postComment(CommentDTO comment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Insert INTO tblComments(commentContent,repliedTo,eventID,[like],commentBy) " +
                                " Values (?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, comment.getCommentContent());
                stm.setString(2, comment.getRepliedTo());
                stm.setString(3, comment.getEventID());
                stm.setInt(4, comment.getLike());
                stm.setString(5, comment.getCommentBy());             
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
    
    public boolean joinEvent(String eventID , String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Insert INTO tblJoins(eventID,userID) " +
                                " Values (?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                stm.setString(2, userID);                         
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

    public eventDTO getEvent(String eventID) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        eventDTO event = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT eventID,eventName,eventCreateDate,eventStartDate, "
                        + " userID,statusID,limitMember, "
                        + " content,clubID,dmID,[like] "
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
                    String statusID = rs.getString("statusID");
                    int limitMember = rs.getInt("limitMember");
                    String content = rs.getString("content");
                    String clubID = rs.getString("clubID");
                    String dmID = rs.getString("dmID");
                    int like = rs.getInt("like");
                    event = new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, statusID, limitMember, content, clubID, dmID, like);
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

    public eventDTO getEvent(String eventID) throws SQLException {
        List<eventDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        eventDTO event = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " eventID,eventName,eventCreateDate,eventStartDate,userID,categoryID,statusID,limitMember,roomID,content,clubID,dmID,like "
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
                    String statusID = rs.getString("statusID");
                    int limitMember = rs.getInt("limitMember");
                    String content = rs.getString("content");
                    String clubID = rs.getString("clubID");
                    String dmID = rs.getString("dmID");
                    int like = rs.getInt("like");
                    event = new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, statusID, limitMember, content, clubID, dmID, like);
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
                String sql = " SELECT eventID, eventName, eventCreateDate, eventStartDate, categoryID, LimitMember, interestedID,content, ClubID, DmID, like"
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
                    String userID = rs.getString("userID");
                    String statusID = rs.getString("statusID");
                    int limitMember = rs.getInt("limitMember");
                    String content = rs.getString("content");
                    String clubID = rs.getString("clubID");
                    String dmID = rs.getString("dmID");
                    int like = rs.getInt("like");
                    list.add(new eventDTO(eventID, eventName, eventCreateDate, eventStartDate, userID, statusID, limitMember, content, clubID, dmID, like));
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
                String sql = " UPDATE tblEvents "
                        + " SET statusID = 'NA' "
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

    public String getClubName(String clubID) throws SQLException {
        String clubName = null;
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
        String dmName = null;
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
    
    public String getImageLink(String eventID) throws SQLException {
        String imageLink = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT link "
                        + " FROM tblImages "
                        + " WHERE eventID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    imageLink = rs.getString("link");
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
        return imageLink;
    }

    public String getListSlot(String eventID) throws SQLException {
        String listSlot = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT slotID "
                        + " FROM tblEvent_Slots "
                        + " WHERE eventID=? ORDER BY slotID ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    listSlot += " " + rs.getString("slotID");
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
        return listSlot;
    }

    public List<String> getListCategoty(String eventID) throws SQLException {
        List<String> listCategoty = new ArrayList();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT tblCategory.categoryName "
                        + " FROM tblEvent_Categories , tblCategory "
                        + " WHERE tblEvent_Categories.categoryID = tblCategory.categoryID AND tblEvent_Categories.eventID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    listCategoty.add(rs.getString("categoryName"));
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
        return listCategoty;
    }

    public List<CommentDTO> getListComment(String eventID) throws SQLException {
        List<CommentDTO> listComment = new ArrayList();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT commentID,commentContent,repliedTo,[like],commentDate,commentBy "
                        + " FROM tblComments "
                        + " WHERE eventID = ? ORDER BY commentDate ASC " ;          //or DESC
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("commentID");
                    String commentContent = rs.getString("commentContent");
                    String repliedTo = rs.getString("repliedTo");
                    Timestamp commentDate = rs.getTimestamp("commentDate");
                    int like = rs.getInt("like");
                    String commentBy = rs.getString("commentBy");
                    listComment.add(new CommentDTO(commentID, commentContent, repliedTo, eventID, like,commentDate, commentBy));
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
        return listComment;
    }

    public int countFollow(String eventID) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT COUNT(*) as quantity "
                        + " FROM tblFollows "
                        + " WHERE eventID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("quantity");
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
        return count;
    }

    public int getQuantity() throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT COUNT(*) as quantity "
                        + " FROM tblEvents ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
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

    public boolean updateEvent(eventDTO event) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblEvents "
                        + " SET eventName=?, eventStartDate=?, "
                        + " limitMember=?, content=?, like=?"
                        + " WHERE eventID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, event.getEventName());
                stm.setDate(2, event.getEventStartDate());
                stm.setInt(3, event.getLimitMember());
                stm.setString(4, event.getContent());
                stm.setInt(5, event.getLike());
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

     public String getEventImage(String eventID) throws SQLException {
        String imageLink=null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT link "
                        + " FROM tblImages "
                        + " WHERE eventID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    imageLink = rs.getString("link");
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
        return imageLink;
    }
    
    public String getUserName(String userID) throws SQLException {
        String userName=null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT userName "
                        + " FROM tblUsers "
                        + " WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    userName = rs.getString("userName");
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
        return userName;
    }
    
    public boolean AddEvent(eventDTO event) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Insert INTO tblEvents(eventID,eventName,eventCreateDate,eventStartDate,userID,statusID,limitMember,content,clubID,dmID,like) "
                        + " Values (?,?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, event.getEventID());
                stm.setString(2, event.getEventName());
                stm.setDate(3, event.getCreateDate());
                stm.setDate(4, event.getEventStartDate());
                stm.setString(5, event.getUserID());
                stm.setString(6, event.getStatusID());
                stm.setInt(7, event.getLimitMember());
                stm.setString(8, event.getContent());
                stm.setString(9, event.getClubID());
                stm.setString(10, event.getDmID());
                stm.setInt(10, event.getLike());
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
