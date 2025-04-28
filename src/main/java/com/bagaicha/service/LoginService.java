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
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
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
 * @return true if the credentials are valid, false otherwise; null if a connection error occurs
 */
	public Boolean loginUser(UserModel userModel) {
		
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT userName, userPassword FROM user WHERE userName = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, userModel.getUserName());
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				String dbUsername = result.getString("userName");
	            String dbPassword = result.getString("userPassword");
	            
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
	 * Validates the password retrieved from the database.
	 *
	 * @param result       the ResultSet containing the username and password from
	 *                     the database
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
		String dbUsername = result.getString("userName");
		String dbPassword = result.getString("userPassword");

		return dbUsername.equals(userModel.getUserName())
				&& PasswordUtil.decrypt(dbPassword, dbUsername).equals(userModel.getUserPassword());
	}
	
	public UserModel getUserDetails(String username) {
	    UserModel user = null;
	    String query = "SELECT * FROM user WHERE userName = ?";
	    
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	        
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            user = new UserModel();
	            user.setUserId(rs.getInt("user_id"));
	            user.setFullName(rs.getString("fullName"));
	            user.setUserName(rs.getString("userName"));
	            user.setUserEmail(rs.getString("userEmail"));
	            user.setUserPhoneNo(rs.getString("userPhoneNo"));
	            user.setUserAddress(rs.getString("userAddress"));
	            user.setImage(rs.getString("image"));
	            user.setUserRole(rs.getString("userRole"));
	            // Add all other fields
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return user;
	    
	}
	/**
	 * Verifies if the provided password matches the stored password for a given username.
	 * 
	 * @param username The username to verify
	 * @param password The plain-text password to check
	 * @return true if the password matches, false otherwise
	 */
	public boolean verifyPassword(String username, String password) {
	    if (isConnectionError) {
	        return false;
	    }

	    String query = "SELECT userPassword FROM user WHERE userName = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, username);
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            String encryptedPassword = result.getString("userPassword");
	            String decryptedPassword = PasswordUtil.decrypt(encryptedPassword, username);
	            return decryptedPassword != null && decryptedPassword.equals(password);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

}