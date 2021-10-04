/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event;

import java.sql.Date;

/**
 *
 * @author AN515-52
 */
public class eventErrors {

    private String eventIDError;
    private String eventNameError;
    private String createDateError;
    private String eventStartDateError;
    private String userIDError;
    private String categoryIDError;
    private String statusIDError;
    private String limitMemberError;
    private String roomIDError;
    private String interestedIDError;

    public eventErrors() {
    }

    public eventErrors(String eventIDError, String eventNameError, String createDateError, String eventStartDateError, String userIDError, String categoryIDError, String statusIDError, String limitMemberError, String roomIDError, String interestedIDError) {
        this.eventIDError = eventIDError;
        this.eventNameError = eventNameError;
        this.createDateError = createDateError;
        this.eventStartDateError = eventStartDateError;
        this.userIDError = userIDError;
        this.categoryIDError = categoryIDError;
        this.statusIDError = statusIDError;
        this.limitMemberError = limitMemberError;
        this.roomIDError = roomIDError;
        this.interestedIDError = interestedIDError;
    }

    public void setEventIDError(String eventIDError) {
        this.eventIDError = eventIDError;
    }

    public void setEventNameError(String eventNameError) {
        this.eventNameError = eventNameError;
    }

    public void setCreateDateError(String createDateError) {
        this.createDateError = createDateError;
    }

    public void setEventStartDateError(String eventStartDateError) {
        this.eventStartDateError = eventStartDateError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public void setStatusIDError(String statusIDError) {
        this.statusIDError = statusIDError;
    }

    public void setLimitMemberError(String limitMemberError) {
        this.limitMemberError = limitMemberError;
    }

    public void setRoomIDError(String roomIDError) {
        this.roomIDError = roomIDError;
    }

    public void setInterestedIDError(String interestedIDError) {
        this.interestedIDError = interestedIDError;
    }

    public String getEventIDError() {
        return eventIDError;
    }

    public String getEventNameError() {
        return eventNameError;
    }

    public String getCreateDateError() {
        return createDateError;
    }

    public String getEventStartDateError() {
        return eventStartDateError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public String getStatusIDError() {
        return statusIDError;
    }

    public String getLimitMemberError() {
        return limitMemberError;
    }

    public String getRoomIDError() {
        return roomIDError;
    }

    public String getInterestedIDError() {
        return interestedIDError;
    }

}