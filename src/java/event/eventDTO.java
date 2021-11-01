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
    private String statusID;
    private int limitMember;
    private String content;
    private String clubID;
    private String dmID;
    private int like;

    public eventDTO() {
    }

    public eventDTO(String eventID, String eventName, Date createDate, Date eventStartDate, String userID, String statusID, int limitMember, String content, String clubID, String dmID, int like) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.createDate = createDate;
        this.eventStartDate = eventStartDate;
        this.userID = userID;
        this.statusID = statusID;
        this.limitMember = limitMember;
        this.content=content;
        this.clubID=clubID;
        this.dmID=dmID;
        this.like=like;
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

    public void setLike(int like) {
        this.like = like;
    }

    public int getLike() {
        return like;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
}
