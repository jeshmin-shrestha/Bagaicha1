package com.bagaicha.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.UserModel;

/**
 * Service class for updating student information in the database.
 * 
 * This class provides methods to update student details and fetch program IDs
 * from the database. It manages database connections and handles SQL
 * exceptions.
 */
public class UpdateProfileService {
	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public UpdateProfileService() {
		try {
			dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			// Log and handle exceptions related to database connection
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Updates student information in the database.
	 * 
	 * @param student The StudentModel object containing the updated student data.
	 * @return Boolean indicating the success of the update operation. Returns null
	 *         if there is a connection error or an exception occurs.
	 */
	public Boolean updateUserInfo(UserModel user) {
	    if (isConnectionError) {
	        return null;
	    }

	    // Check if the user exists in the database
	    int userId = user.getUserId();
	    if (userId == 0) {
	        System.out.println("Invalid user ID: " + userId);
	        return false;
	    }

	    // Update user information query
	    String updateSQL = "UPDATE users SET full_name = ?, email = ?, phone_number = ?, user_address = ?, image = ? WHERE user_id = ?";

	    try (PreparedStatement preparedStatement = dbConn.prepareStatement(updateSQL)) {
	        // Set the parameters for the prepared statement
	        preparedStatement.setString(1, user.getFullName());
	        preparedStatement.setString(2, user.getUserEmail());
	        preparedStatement.setString(3, user.getUserPhoneNo());
	        preparedStatement.setString(4, user.getUserAddress());
	        preparedStatement.setString(5, user.getImage());  // Update image field (if necessary)
	        preparedStatement.setInt(6, user.getUserId());    // Ensure the correct user ID is set

	        // Execute the update query
	        int rowsAffected = preparedStatement.executeUpdate();
	        return rowsAffected > 0;  // Returns true if the update is successful
	    } catch (SQLException e) {
	        // Log and handle SQL exceptions
	        e.printStackTrace();
	        return null;
	    }
	}

}
