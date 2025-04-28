package com.bagaicha.service;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.UserModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
		  

			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new user in the database.
	 *
	 * @param UserModel the user details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addUser(UserModel userModel) {
	   

	    if (dbConn == null) {
		   

	        System.err.println("Database connection is not available.");
	        return null;
	    }
	   

	    // The SQL query for inserting the user
	    String insertQuery = "INSERT INTO user (fullName, userName, userEmail, userPhoneNo, userPassword, userRole, userAddress, image) "
	            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";


	    try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {  // Properly using try-with-resources

	        // Insert student details
	    	insertStmt.setString(1, userModel.getFullName());
	    	insertStmt.setString(2, userModel.getUserName());
	    	insertStmt.setString(3, userModel.getUserEmail());
	    	insertStmt.setString(4, userModel.getUserPhoneNo());
	    	insertStmt.setString(5, userModel.getUserPassword());
	    	insertStmt.setString(6, userModel.getUserRole());      
	    	insertStmt.setString(7, userModel.getUserAddress());    
	    	insertStmt.setString(8, userModel.getImage()); 

	        // Execute the insert query and return true if a row is inserted
	        return insertStmt.executeUpdate() > 0;
	    } catch (SQLException e) {
	        System.err.println("Error during user registration: " + e.getMessage());
	        e.printStackTrace();
	        return false; // Ensure it returns a boolean
	    }
	}
	public boolean isUsernameTaken(String username) throws SQLException {
	    if (dbConn == null) {
	        throw new SQLException("Database connection is not available.");
	    }

	    String query = "SELECT COUNT(*) FROM user WHERE userName = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, username);
	        try (var rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt(1) > 0; // Returns true if username exists
	            }
	        }
	    }
	    return false;
	}
}