/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comment;

/**
 *
 * @author benth
 */
public class CommentDTO {
<<<<<<< HEAD
    private String commentID;
    private String commentContent;
    private String repliedTo;
    private String eventID;
    private int like;
    private String commentBy;

    public CommentDTO() {
    }

    public CommentDTO(String commentID, String commentContent) {
        this.commentID = commentID;
        this.commentContent = commentContent;
    }
    
    

    public CommentDTO(String commentID, String commentContent, String repliedTo, String commentBy) {
        this.commentID = commentID;
        this.commentContent = commentContent;
        this.repliedTo = repliedTo;
        this.commentBy = commentBy;
    }
    
    public CommentDTO(String commentID) {
        this.commentID = commentID;
    }

    public CommentDTO(String commentID, String commentContent, String repliedTo, String eventID, int like, String commentBy) {
        this.commentID = commentID;
        this.commentContent = commentContent;
        this.repliedTo = repliedTo;
        this.eventID = eventID;
        this.like = like;
        this.commentBy = commentBy;
=======
    private String commentID, commentDetail, replyID, userID, eventID;

    public CommentDTO(String commentID, String commentDetail, String replyID, String userID, String eventID) {
        this.commentID = commentID;
        this.commentDetail = commentDetail;
        this.replyID = replyID;
        this.userID = userID;
        this.eventID = eventID;
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

<<<<<<< HEAD
    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getRepliedTo() {
        return repliedTo;
    }

    public void setRepliedTo(String repliedTo) {
        this.repliedTo = repliedTo;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public String getCommentBy() {
        return commentBy;
    }

    public void setCommentBy(String commentBy) {
        this.commentBy = commentBy;
=======
    public String getCommentDetail() {
        return commentDetail;
    }

    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }

    public String getReplyID() {
        return replyID;
    }

    public void setReplyID(String replyID) {
        this.replyID = replyID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
    }
    
    
}
