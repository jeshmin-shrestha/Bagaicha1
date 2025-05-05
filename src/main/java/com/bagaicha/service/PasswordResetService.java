package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.util.PasswordUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PasswordResetService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    public PasswordResetService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    public boolean updatePassword(String username, String newPassword) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return false;
        }

        String query = "UPDATE user SET userPassword = ? WHERE userName = ?";
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
