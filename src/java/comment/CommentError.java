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
public class CommentError {
    private String commentIDError, commentContentError, repliedToError, eventIDError, likeError,commentByError;

    public CommentError() {
    }

    public CommentError(String commentIDError, String commentContentError, String repliedToError, String commentByError) {
        this.commentIDError = commentIDError;
        this.commentContentError = commentContentError;
        this.repliedToError = repliedToError;
        this.commentByError = commentByError;
    }

    public CommentError(String commentIDError, String commentContentError) {
        this.commentIDError = commentIDError;
        this.commentContentError = commentContentError;
    }
    
    

    public CommentError(String commentIDError, String commentContentError, String repliedToError, String eventIDError, String likeError, String commentByError) {
        this.commentIDError = commentIDError;
        this.commentContentError = commentContentError;
        this.repliedToError = repliedToError;
        this.eventIDError = eventIDError;
        this.likeError = likeError;
        this.commentByError = commentByError;
    }

    public String getCommentIDError() {
        return commentIDError;
    }

    public void setCommentIDError(String commentIDError) {
        this.commentIDError = commentIDError;
    }

    public String getCommentContentError() {
        return commentContentError;
    }

    public void setCommentContentError(String commentContentError) {
        this.commentContentError = commentContentError;
    }

    public String getRepliedToError() {
        return repliedToError;
    }

    public void setRepliedToError(String repliedToError) {
        this.repliedToError = repliedToError;
    }

    public String getEventIDError() {
        return eventIDError;
    }

    public void setEventIDError(String eventIDError) {
        this.eventIDError = eventIDError;
    }

    public String getLikeError() {
        return likeError;
    }

    public void setLikeError(String likeError) {
        this.likeError = likeError;
    }

    public String getCommentByError() {
        return commentByError;
    }

    public void setCommentByError(String commentByError) {
        this.commentByError = commentByError;
    }
    
    
}
