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
		if (dbConn != null) {
			System.out.println("Database connection successful!");
		} else {
			System.out.println("Failed to connect to database!");
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
		System.out.println("\n===== UPDATE PROFILE SERVICE START =====");
		System.out.println("Attempting to update user ID: " + user.getUserId());

		if (isConnectionError) {
			System.out.println("ERROR: Database connection error");
			return false;
		}

		// Change the SQL query to match your exact column names
		String updateSQL = "UPDATE `user` SET full_name = ?, user_name = ?, user_email = ?, "
				+ "user_phone_no = ?, user_address = ? WHERE user_id = ?";

		System.out.println("Prepared SQL: " + updateSQL);
		System.out.println("Parameters:");
		System.out.println("1. full_name: " + user.getFullName());
		System.out.println("2. user_name: " + user.getUserName());
		System.out.println("3. user_email: " + user.getUserEmail());
		System.out.println("4. user_phone_no: " + user.getUserPhoneNo());
		System.out.println("5. user_address: " + user.getUserAddress());
		System.out.println("6. user_id: " + user.getUserId());

		try (PreparedStatement preparedStatement = dbConn.prepareStatement(updateSQL)) {
			preparedStatement.setString(1, user.getFullName());
			preparedStatement.setString(2, user.getUserName());
			preparedStatement.setString(3, user.getUserEmail());
			preparedStatement.setString(4, user.getUserPhoneNo());
			preparedStatement.setString(5, user.getUserAddress());
			preparedStatement.setInt(6, user.getUserId());

			System.out.println("Executing update...");
			int rowsAffected = preparedStatement.executeUpdate();
			System.out.println("Rows affected: " + rowsAffected);

			boolean success = rowsAffected > 0;
			System.out.println(success ? "SUCCESS: User updated" : "WARNING: No rows affected");
			System.out.println("===== UPDATE PROFILE SERVICE END =====\n");
			return success;
		} catch (SQLException e) {
			System.out.println("SQL ERROR:");
			e.printStackTrace();
			System.out.println("===== UPDATE PROFILE SERVICE END =====\n");
			return false;
		}
	}
}