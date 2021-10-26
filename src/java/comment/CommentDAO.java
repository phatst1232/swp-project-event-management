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
    
    public CommentDTO getComment(String search) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CommentDTO cmt =null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT commentID, commentContent, repliedTo, eventID, [like] FROM tblComments"
                        + " WHERE commentBy LIKE ? AND eventID LIKE ?  ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String commentID = rs.getString("commentID");
                    String commentContent = rs.getString("commentContent");
                    String repliedTo = rs.getString("repliedTo");
                    String eventID = rs.getString("eventID");
                    int like = rs.getInt("like");
                    String commentBy = rs.getString("CommentBy");

                    list.add(new CommentDTO(commentID, commentContent, repliedTo, eventID, like, commentBy));
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
    
    //crud
    public boolean insertComment(CommentDTO comment) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblComments(commentID, commentContent, repliedTo, commentBy)"
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, comment.getCommentID());
                stm.setString(2, comment.getCommentContent());
                stm.setString(3, comment.getRepliedTo());
                stm.setString(4, comment.getCommentBy());
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
    
    public boolean updateComment(CommentDTO cmt) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblComments "
                        + " SET commentDetail=? "
                        + " WHERE commentID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cmt.getCommentID());
                stm.setString(2, cmt.getCommentContent());
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


    // thêm 1 insertLike ( like +1 )
    
    
    
}   