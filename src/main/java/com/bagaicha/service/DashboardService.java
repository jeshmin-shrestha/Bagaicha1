package com.bagaicha.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bagaicha.config.DbConfig;
/**
 * Service class for dashboard-related statistics and summaries.
 * Provides methods to fetch counts, recent records, and top categories.
 */
public class DashboardService {
	/**
     * Gets the total number of users from the database.
     * 
     * @return total user count
     */
    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM user";
        return getCount(query);
    }
    /**
     * Gets the total number of plants from the database.
     * 
     * @return total plant count
     */
    public int getTotalPlants() {
        String query = "SELECT COUNT(*) FROM plant";
        return getCount(query);
    }
    /**
     * Gets the total number of categories from the database.
     * 
     * @return total category count
     */
    public int getTotalCategories() {
        String query = "SELECT COUNT(*) FROM category";
        return getCount(query);
    }
    /**
     * Helper method to run a COUNT query.
     * 
     * @param query SQL query string to count records
     * @return the count result
     */
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
    /**
     * Gets the names of the 3 most recently added plants.
     * 
     * @return list of recent plant names
     */
    public List<String> getRecentPlants() {
        String query = "SELECT plant_name FROM plant ORDER BY plant_added_date DESC LIMIT 3";
        return getRecentNames(query);
    }
    /**
     * Gets the full names of the 3 most recently registered users.
     * 
     * @return list of recent user full names
     */
    public List<String> getRecentUsers() {
        String query = "SELECT full_name FROM User ORDER BY user_id DESC LIMIT 3";
        return getRecentNames(query);
    }
    /**
     * Helper method to get recent entries' names using a given SQL query.
     * 
     * @param query SQL query to fetch recent names
     * @return list of names from the result set
     */
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
    /**
     * Retrieves the top 5 categories with the most plants.
     * Each entry includes the category name and the count of plants.
     * 
     * @return list of maps containing category name and plant count
     */
    public List<Map<String, Object>> getTopCategories() {
        List<Map<String, Object>> categories = new ArrayList<>();
        String query = "SELECT c.category_name, COUNT(p.plant_id) AS plant_count " +
                       "FROM category c LEFT JOIN plant p ON c.category_id = p.category_id " +
                       "GROUP BY c.category_id ORDER BY plant_count DESC LIMIT 5";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Map<String, Object> category = new HashMap<>();
                category.put("name", rs.getString("category_name"));
                category.put("count", rs.getInt("plant_count"));
                categories.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
}
