package com.bagaicha.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bagaicha.config.DbConfig;

public class DashboardService {

    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM user";
        return getCount(query);
    }

    public int getTotalPlants() {
        String query = "SELECT COUNT(*) FROM plant";
        return getCount(query);
    }

    public int getTotalCategories() {
        String query = "SELECT COUNT(*) FROM category";
        return getCount(query);
    }

    private int getCount(String query) {
        int count = 0;
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public List<String> getRecentPlants() {
        String query = "SELECT plant_name FROM plant ORDER BY plant_added_date DESC LIMIT 3";
        return getRecentNames(query);
    }

    public List<String> getRecentUsers() {
        String query = "SELECT fullName FROM User ORDER BY user_id DESC LIMIT 3";
        return getRecentNames(query);
    }

    private List<String> getRecentNames(String query) {
        List<String> names = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                names.add(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return names;
    }
}

