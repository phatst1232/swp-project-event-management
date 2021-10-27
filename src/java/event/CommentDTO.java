/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author phats
 */
public class CommentDTO {
    private int commentID;
    private String commentContent;
    private String repliedTo;
    private String eventID;
    private int like;
    private Timestamp commentDate;
    private String commentBy;

    public CommentDTO() {
    }

    public CommentDTO(int commentID, String commentContent, String repliedTo, String eventID, int like, Timestamp commentDate, String commentBy) {
        this.commentID = commentID;
        this.commentContent = commentContent;
        this.repliedTo = repliedTo;
        this.eventID = eventID;
        this.like = like;
        this.commentDate = commentDate;
        this.commentBy = commentBy;
    }

    public void setCommentDate(Timestamp commentDate) {
        this.commentDate = commentDate;
    }

    public Timestamp getCommentDate() {
        return commentDate;
    }

    public int getCommentID() {
        return commentID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public String getRepliedTo() {
        return repliedTo;
    }

    public String getEventID() {
        return eventID;
    }

    public int getLike() {
        return like;
    }

    public String getCommentBy() {
        return commentBy;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public void setRepliedTo(String repliedTo) {
        this.repliedTo = repliedTo;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public void setCommentBy(String commentBy) {
        this.commentBy = commentBy;
    }
    
}
