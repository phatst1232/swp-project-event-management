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
public class RoomDTO {
    private String roomID;
    private String eventID;

    public RoomDTO(String roomID, String eventID) {
        this.roomID = roomID;
        this.eventID = eventID;
    }

    public String getRoomID() {
        return roomID;
    }


    public String getEventID() {
        return eventID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }


    public void setEventID(String eventID) {
        this.eventID = eventID;
    }
    
}
