/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event;

/**
 *
 * @author AN515-52
 */
public class LikeDTO {
    private String userID;
    private String eventID;

    public LikeDTO(String userID, String eventID) {
        this.userID = userID;
        this.eventID = eventID;
    }

    public String getUserID() {
        return userID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }
    
    
}
