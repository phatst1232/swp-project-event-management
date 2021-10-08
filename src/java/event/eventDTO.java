/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event;

import java.sql.Date;

/**
 *
 * @author benth
 */
public class eventDTO {
    private String eventID;
    private String eventName;
    private Date createDate;
    private Date eventStartDate;
    private String userID;
    private String categoryID;
    private String statusID;
    private int limitMember;
    private int roomID;
    private String interestedID;
    private String content;
    private String clubID;
    private String dmID;

    public eventDTO() {
    }

    public eventDTO(String eventID, String eventName, Date createDate, Date eventStartDate, String userID, String categoryID, String statusID, int limitMember, int roomID, String interestedID,String content, String clubID, String dmID) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.createDate = createDate;
        this.eventStartDate = eventStartDate;
        this.userID = userID;
        this.categoryID = categoryID;
        this.statusID = statusID;
        this.limitMember = limitMember;
        this.roomID = roomID;
        this.interestedID = interestedID;
        this.content=content;
        this.clubID=clubID;
        this.dmID=dmID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public void setClubID(String clubID) {
        this.clubID = clubID;
    }

    public void setDmID(String dmID) {
        this.dmID = dmID;
    }

    public String getClubID() {
        return clubID;
    }

    public String getDmID() {
        return dmID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getEventStartDate() {
        return eventStartDate;
    }

    public void setEventStartDate(Date eventStartDate) {
        this.eventStartDate = eventStartDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public int getLimitMember() {
        return limitMember;
    }

    public void setLimitMember(int limitMember) {
        this.limitMember = limitMember;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getInterestedID() {
        return interestedID;
    }

    public void setInterestedID(String interestedID) {
        this.interestedID = interestedID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
