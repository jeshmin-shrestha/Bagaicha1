package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.UserModel;
import com.bagaicha.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserProfileService {

    private static final String UPDATE_USER_SQL = "UPDATE user SET full_name = ?, username = ?, phone = ? WHERE email = ?";

    // Method to update user information in the database
    public boolean updateUser(UserModel updatedUser) {
        boolean updated = false;

        try (Connection connection = DbConfig.getDbConnection(); // Get the connection from the DbConfig
             PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL)) {

            // Setting parameters for the SQL query
            statement.setString(1, updatedUser.getFullName());
            statement.setString(2, updatedUser.getUserName());
            statement.setString(3, updatedUser.getUserPhoneNo());
            statement.setString(4, updatedUser.getUserEmail()); // Using email as the unique identifier

            // Executing the update query
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Log both exceptions if necessary
            System.err.println("Error updating user profile: " + e.getMessage());
            e.printStackTrace(); // Consider logging this with a logging framework
        }

        return updated;
    }
   
    	private static final String UPDATE_PASSWORD_SQL = 
    	        "UPDATE user SET userPassword = ? WHERE user_id = ?";

    	    public boolean updatePassword(int userId, String newPassword) {
    	        if (newPassword == null || newPassword.length() < 8) {
    	            return false;
    	        }
    	        
    	        try (Connection conn = DbConfig.getDbConnection();
    	             PreparedStatement stmt = conn.prepareStatement(UPDATE_PASSWORD_SQL)) {
    	            
    	            conn.setAutoCommit(false);
    	            
    	            // Encrypt the new password
    	            String encryptedPassword = PasswordUtil.encrypt(userId + "", newPassword);
    	            
    	            if (encryptedPassword == null) {
    	                return false;
    	            }
    	            
    	            stmt.setString(1, encryptedPassword);
    	            stmt.setInt(2, userId);
    	            
    	            int rowsAffected = stmt.executeUpdate();
    	            conn.commit();
    	            
    	            return rowsAffected > 0;
    	        } catch (SQLException | ClassNotFoundException e) {
    	            e.printStackTrace();
    	            return false;
    	        }
    	    }

}
