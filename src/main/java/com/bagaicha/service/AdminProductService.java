package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.PlantModel;
import com.bagaicha.model.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class AdminProductService {

    public List<PlantModel> getAllPlants() {
        List<PlantModel> plants = new ArrayList<>();

        String sql = "SELECT * FROM plant";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PlantModel plant = new PlantModel();
                plant.setPlantId(rs.getInt("plant_id"));
                plant.setPlantName(rs.getString("plant_name"));
                plant.setScientificName(rs.getString("scientific_name"));
                plant.setSoilType(rs.getString("soil_type"));
                plant.setFertilizerRequirement(rs.getString("fertilizer_requirement"));
                plant.setSunlightRequirement(rs.getString("sunlight_requirement"));
                plant.setBloomingSeason(rs.getString("blooming_season"));
                plant.setWaterFrequency(rs.getString("water_frequency"));
                plant.setCareDescription(rs.getString("care_description"));
                plant.setPlantAddedDate(rs.getDate("plant_added_date")); 
                plant.setImageUrl(rs.getString("image_url"));
                plant.setCategoryId(rs.getInt("category_id"));
                plants.add(plant);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Total plants fetched: " + plants.size());

        return plants;
    }
    public PlantModel getPlantById(int plantId) throws ClassNotFoundException {
        PlantModel plant = null;
        String sql = "SELECT * FROM plant WHERE plant_id = ?";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, plantId);
            System.out.println("DEBUG: Executing query for plant ID: " + plantId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    plant = new PlantModel();
                    plant.setPlantId(rs.getInt("plant_id"));
                    plant.setPlantName(rs.getString("plant_name"));
                    plant.setScientificName(rs.getString("scientific_name"));
                    plant.setSoilType(rs.getString("soil_type"));
                    plant.setFertilizerRequirement(rs.getString("fertilizer_requirement"));
                    plant.setSunlightRequirement(rs.getString("sunlight_requirement"));
                    plant.setBloomingSeason(rs.getString("blooming_season"));
                    plant.setWaterFrequency(rs.getString("water_frequency"));
                    plant.setCareDescription(rs.getString("care_description"));
                    plant.setImageUrl(rs.getString("image_url"));
                    plant.setCategoryId(rs.getInt("category_id"));
                    
                    // Debug print all values
                    System.out.println("DEBUG: Retrieved plant data:");
                    System.out.println("Name: " + plant.getPlantName());
                    System.out.println("Scientific: " + plant.getScientificName());
                    System.out.println("Soil: " + plant.getSoilType());
                    System.out.println("Fertilizer: " + plant.getFertilizerRequirement());
                    System.out.println("Sunlight: " + plant.getSunlightRequirement());
                    System.out.println("Season: " + plant.getBloomingSeason());
                    System.out.println("Water: " + plant.getWaterFrequency());
                    System.out.println("Desc: " + plant.getCareDescription());
                    System.out.println("Image: " + plant.getImageUrl());
                    System.out.println("Category: " + plant.getCategoryId());
                }
            }
        } catch (SQLException e) {
            System.err.println("ERROR getting plant by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return plant;
    }
    public boolean addPlant(PlantModel plant) throws ClassNotFoundException {
        String sql = "INSERT INTO plant (plant_name, scientific_name, soil_type, fertilizer_requirement, " +
                     "sunlight_requirement, blooming_season, water_frequency, care_description, " +
                     "image_url, category_id, plant_added_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, plant.getPlantName());
            stmt.setString(2, plant.getScientificName());
            stmt.setString(3, plant.getSoilType());
            stmt.setString(4, plant.getFertilizerRequirement());
            stmt.setString(5, plant.getSunlightRequirement());
            stmt.setString(6, plant.getBloomingSeason());
            stmt.setString(7, plant.getWaterFrequency());
            stmt.setString(8, plant.getCareDescription());
            stmt.setString(9, plant.getImageUrl());
            stmt.setInt(10, plant.getCategoryId());
            stmt.setDate(11, new java.sql.Date(System.currentTimeMillis()));
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        plant.setPlantId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error adding plant: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePlant(PlantModel plant) throws ClassNotFoundException {
        String sql = "UPDATE plant SET plant_name=?, scientific_name=?, soil_type=?, " +
                     "fertilizer_requirement=?, sunlight_requirement=?, blooming_season=?, " +
                     "water_frequency=?, care_description=?, category_id=?, image_url=? WHERE plant_id=?";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, plant.getPlantName());
            stmt.setString(2, plant.getScientificName());
            stmt.setString(3, plant.getSoilType());
            stmt.setString(4, plant.getFertilizerRequirement());
            stmt.setString(5, plant.getSunlightRequirement());
            stmt.setString(6, plant.getBloomingSeason());
            stmt.setString(7, plant.getWaterFrequency());
            stmt.setString(8, plant.getCareDescription());
            stmt.setInt(9, plant.getCategoryId());
            stmt.setString(10, plant.getImageUrl());
            stmt.setInt(11, plant.getPlantId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error updating plant: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePlant(int plantId) throws ClassNotFoundException {
        String sql = "DELETE FROM plant WHERE plant_id = ?";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, plantId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting plant: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
 // Add this method to your AdminProductService class
    public List<PlantModel> searchPlants(String searchTerm) {
        List<PlantModel> plants = new ArrayList<>();
        
        // Search in multiple fields: plant_name, scientific_name, soil_type, etc.
        String sql = "SELECT * FROM plant WHERE " +
                     "plant_name LIKE ? OR " +
                     "scientific_name LIKE ? OR " +
                     "soil_type LIKE ? OR " +
                     "fertilizer_requirement LIKE ? OR " +
                     "sunlight_requirement LIKE ? OR " +
                     "blooming_season LIKE ? OR " +
                     "water_frequency LIKE ? OR " +
                     "care_description LIKE ?";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            // Add wildcards to search for partial matches
            String searchPattern = "%" + searchTerm + "%";
            for (int i = 1; i <= 8; i++) {
                ps.setString(i, searchPattern);
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PlantModel plant = new PlantModel();
                    plant.setPlantId(rs.getInt("plant_id"));
                    plant.setPlantName(rs.getString("plant_name"));
                    plant.setScientificName(rs.getString("scientific_name"));
                    plant.setSoilType(rs.getString("soil_type"));
                    plant.setFertilizerRequirement(rs.getString("fertilizer_requirement"));
                    plant.setSunlightRequirement(rs.getString("sunlight_requirement"));
                    plant.setBloomingSeason(rs.getString("blooming_season"));
                    plant.setWaterFrequency(rs.getString("water_frequency"));
                    plant.setCareDescription(rs.getString("care_description"));
                    plant.setPlantAddedDate(rs.getDate("plant_added_date")); 
                    plant.setImageUrl(rs.getString("image_url"));
                    plant.setCategoryId(rs.getInt("category_id"));
                    plants.add(plant);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println("Search results for '" + searchTerm + "': " + plants.size() + " plants found");
        return plants;
    }
    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();
        String query = "SELECT user_id, full_name, user_name, user_email, user_phone_no, " +
                       "user_role, user_address, image FROM user"; // Fixed column & table names
        
        System.out.println("[DEBUG] Executing query: " + query);
        
        try (Connection conn = DbConfig.getDbConnection()) {
            System.out.println("[DEBUG] Database connection successful!");
            
            try (PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                
                System.out.println("[DEBUG] Query executed, checking results...");
                
                while (rs.next()) {
                    UserModel user = new UserModel();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFullName(rs.getString("full_name"));  // Matches database
                    user.setUserName(rs.getString("user_name"));  // Matches database
                    user.setUserEmail(rs.getString("user_email")); // Matches database
                    user.setUserPhoneNo(rs.getString("user_phone_no")); // Matches database
                    user.setUserRole(rs.getString("user_role"));
                    user.setUserAddress(rs.getString("user_address"));
                    user.setImage(rs.getString("image"));
                    
                    users.add(user);
                    
                    if (users.size() == 1) {
                        System.out.println("[DEBUG] First user found: " + user.getUserName());
                    }
                }
                
                System.out.println("[DEBUG] Total users fetched: " + users.size());
                
            } catch (SQLException e) {
                System.err.println("[ERROR] SQL Error in query: " + e.getMessage());
                e.printStackTrace();
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("[ERROR] Failed to connect to database: " + e.getMessage());
            e.printStackTrace();
        }
        
        return users;
    }}