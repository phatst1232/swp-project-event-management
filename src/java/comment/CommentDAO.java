/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comment;

import java.sql.Connection;
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
public class CommentDAO {
<<<<<<< HEAD
    
=======

>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
    public CommentDTO getComment(String search) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CommentDTO cmt =null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
<<<<<<< HEAD
                String sql = " SELECT commentID, commentContent, repliedTo, eventID, [like] FROM tblComments"
                        + " WHERE commentBy LIKE ? AND eventID LIKE ?  ";
=======
                String sql = "SELECT commentID, commentDetail, replyID FROM tblComments "
                        + " WHERE userID LIKE ? AND eventID LIKE ? ";
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String commentID = rs.getString("commentID");
<<<<<<< HEAD
                    String commentContent = rs.getString("commentContent");
                    String repliedTo = rs.getString("repliedTo");
                    String eventID = rs.getString("eventID");
                    int like = rs.getInt("like");
                    String commentBy = rs.getString("CommentBy");

                    list.add(new CommentDTO(commentID, commentContent, repliedTo, eventID, like, commentBy));
=======
                    String commentDetail = rs.getString("commentDetail");
                    String replyID = rs.getString("replyID");
                    String userID = rs.getString("userID");
                    String eventID = rs.getString("eventID");

                    list.add(new CommentDTO(commentID, commentDetail, replyID, userID, eventID));
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
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
        return cmt;
    }
<<<<<<< HEAD
    
    public int getQuantity() throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT COUNT(*) as quantity "
                        + " FROM tblComments ";
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
    
=======

>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
    //crud
    public boolean insertComment(CommentDTO comment) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
<<<<<<< HEAD
                String sql = "INSERT INTO tblComments(commentID, commentContent, repliedTo, commentBy)"
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, comment.getCommentID());
                stm.setString(2, comment.getCommentContent());
                stm.setString(3, comment.getRepliedTo());
                stm.setString(4, comment.getCommentBy());
=======
                String sql = "INSERT INTO tblComments(commentID, commentDetail, replyID, userID, eventID)"
                        + " VALUES(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, comment.getCommentID());
                stm.setString(2, comment.getCommentDetail());
                stm.setString(3, comment.getReplyID());
                stm.setString(4, comment.getUserID());
                stm.setString(5, comment.getEventID());
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
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
<<<<<<< HEAD
    
=======

>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
    public boolean updateComment(CommentDTO cmt) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblComments "
<<<<<<< HEAD
                        + " SET commentDetail=? "
                        + " WHERE commentID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cmt.getCommentID());
                stm.setString(2, cmt.getCommentContent());
=======
                        + " SET commentID=?, commentDetail=?, replyID=? "
                        + " WHERE userID=? AND WHERE eventID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cmt.getCommentID());
                stm.setString(2, cmt.getCommentDetail());
                stm.setString(3, cmt.getReplyID());
                stm.setString(4, cmt.getUserID());
                stm.setString(5, cmt.getEventID());
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
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
    
    public boolean deleteComment(String commentID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE tblComments "
                        + " WHERE commentID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, commentID);
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
<<<<<<< HEAD


    // thêm 1 insertLike ( like +1 )
    
    
    
}   
=======
}
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
