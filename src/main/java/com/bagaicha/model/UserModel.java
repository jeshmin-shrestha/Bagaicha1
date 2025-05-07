package com.bagaicha.model;

import java.sql.Timestamp; 


/**
 * Represents a user in the system.
 */
public class UserModel {

    private int userId;
    private String fullName;
    private String userName;
    private String userEmail;
    private String userPhoneNo;
    private String userPassword;
    private String userRole; 
    private String userAddress;
    
    private PlantModel plant;
    private String image;
 // Default constructor
    public UserModel() { }
 // Constructor for login
    public UserModel(String username, String pasword) {
    	this.userName = username;
		this.userPassword = pasword;
	}
 // Full constructor
	public UserModel(int userId, String fullName, String userName, String userEmail, String userPhoneNo,
			String userPassword, String userRole, String userAddress, Timestamp lastLogin, PlantModel plant,String image) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhoneNo = userPhoneNo;
		this.userPassword = userPassword;
		this.userRole = userRole;
		this.userAddress = userAddress;
	
		this.plant=plant;
		this.image = image;
	}
	// Constructor without ID and lastLogin (for inserts)
	public UserModel(String fullName, String userName, String userEmail, String userPhoneNo,
			String userPassword, String userRole, String userAddress, String image) {
		this.fullName = fullName;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhoneNo = userPhoneNo;
		this.userPassword = userPassword;
		this.userRole = userRole;
		this.userAddress = userAddress;
		this.image = image;
		
	}

	// Getters and Setters
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhoneNo() {
		return userPhoneNo;
	}
	public void setUserPhoneNo(String userPhoneNo) {
		this.userPhoneNo = userPhoneNo;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
	public PlantModel getPlant() {
		return plant;
	}
	public void setPlant(PlantModel plant) {
		this.plant = plant;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}


}
