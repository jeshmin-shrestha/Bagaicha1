package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.util.PasswordUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 * Service class responsible for handling password reset operations.
 * Encrypts the new password and updates it in the database for the specified username.
 */
public class PasswordResetService {
    private Connection dbConn;
    private boolean isConnectionError = false;
    /**
     * Constructor initializes the database connection.
     * Sets the connection error flag if the connection fails.
     */
    public PasswordResetService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }
    /**
     * Updates the password of a user in the database after encrypting it.
     *
     * @param username    the username whose password is to be updated
     * @param newPassword the new plain-text password to be encrypted and stored
     * @return true if the password update was successful, false otherwise
     */
    public boolean updatePassword(String username, String newPassword) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return false;
        }

        String query = "UPDATE user SET user_password = ? WHERE user_name = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            String encryptedPassword = PasswordUtil.encrypt(username, newPassword);
            stmt.setString(1, encryptedPassword);
            stmt.setString(2, username);
            int updatedRows = stmt.executeUpdate();
            return updatedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}