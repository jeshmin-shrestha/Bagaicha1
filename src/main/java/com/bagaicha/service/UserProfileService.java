package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.UserModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserProfileService {

    private static final String UPDATE_USER_SQL = "UPDATE users SET full_name = ?, username = ?, phone = ? WHERE email = ?";

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

}
