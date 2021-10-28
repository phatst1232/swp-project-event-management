/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author benth
 */
public class UserDTO {
    private String userID;
    private String userName;
    private String password;
    private String roleID;
    private String address;
    private String phoneNumber;
    private String email;
    private String statusID;
    private String majorID;
    private String clubID;
    private String dmID;
    private String avtLink;
    

    public UserDTO() {
    }

    public UserDTO(String userID, String userName, String password, String roleID, String address, String phoneNumber, String email, String statusID, String majorID, String clubID, String dmID, String avtLink) {
        this.userID = userID;
        this.userName = userName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.statusID = statusID;
        this.majorID = majorID;
        this.clubID = clubID;
        this.dmID = dmID;
        this.avtLink = avtLink;
    }    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    public String getAvtLink() {
        return avtLink;
    }

    public void setAvtLink(String avtLink) {
        this.avtLink = avtLink;
    }
}
