package com.bagaicha.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.UserModel;
import com.bagaicha.util.PasswordUtil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
     * Constructor initializes the database connection.
     * Sets the connection error flag if the connection fails.
     */
	public LoginService() {
		try {
			dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
     * Validates the user credentials against the database records.
     *
     * @param userModel the UserModel object containing user credentials
     * @return true if the credentials are valid, false if invalid, or null if a connection error occurs
     */
	public Boolean loginUser(UserModel userModel) {
		
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT user_name, user_password FROM user WHERE user_name = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, userModel.getUserName());
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				String dbUsername = result.getString("user_name");
	            String dbPassword = result.getString("user_password");
	            
	            System.out.println("DEBUG - Stored encrypted password: " + dbPassword);
				return validatePassword(result, userModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return false;
	}

	/**
     * Validates the password retrieved from the database with the user input.
     *
     * @param result     the ResultSet containing user_name and user_password
     * @param userModel  the UserModel object containing user input
     * @return true if the passwords match, false otherwise
     * @throws SQLException if a database access error occurs
     */
	private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
		String dbUsername = result.getString("user_name");
		String dbPassword = result.getString("user_password");

		return dbUsername.equals(userModel.getUserName())
				&& PasswordUtil.decrypt(dbPassword, dbUsername).equals(userModel.getUserPassword());
	}
	 /**
     * Retrieves full user details based on the username.
     *
     * @param username the username to look up
     * @return UserModel object with all user details; null if not found or error occurs
     */
	public UserModel getUserDetails(String username) {
	    UserModel user = null;
	    String query = "SELECT * FROM user WHERE user_name = ?";
	    
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	        
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            user = new UserModel();
	            user.setUserId(rs.getInt("user_id"));
	            user.setFullName(rs.getString("full_name"));
	            user.setUserName(rs.getString("user_name"));
	            user.setUserEmail(rs.getString("user_email"));
	            user.setUserPhoneNo(rs.getString("user_phone_no"));
	            user.setUserAddress(rs.getString("user_address"));
	            user.setImage(rs.getString("image"));
	            user.setUserRole(rs.getString("user_role"));
	            // Add all other fields
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return user;
	    
	}
	 /**
     * Verifies if the provided password matches the stored encrypted password for the given username.
     *
     * @param username the username to verify
     * @param password the plain-text password input
     * @return true if the password matches the stored one; false otherwise
     */
	public boolean verifyPassword(String username, String password) {
	    if (isConnectionError) {
	        return false;
	    }

	    String query = "SELECT user_password FROM user WHERE user_name = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, username);
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            String encryptedPassword = result.getString("user_password");
	            String decryptedPassword = PasswordUtil.decrypt(encryptedPassword, username);
	            return decryptedPassword != null && decryptedPassword.equals(password);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

}