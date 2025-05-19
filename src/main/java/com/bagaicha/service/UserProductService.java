package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.PlantModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserProductService {
	/**
     * Retrieves the latest 4 featured plants ordered by their added date (descending).
     * Typically used for homepage display.
     * 
     * @return List<PlantModel> list of featured PlantModel objects
     * @throws ClassNotFoundException if the database driver class is not found
     */
    // Method to get featured plants (for homepage display)
	public List<PlantModel> getFeaturedPlants() throws ClassNotFoundException {
	    System.out.println("DEBUG: Starting getFeaturedPlants()");
	    List<PlantModel> plants = new ArrayList<>();
	    String query = "SELECT * FROM plant ORDER BY plant_added_date DESC LIMIT 4";
	    
	    try (Connection connection = DbConfig.getDbConnection()) {
	        System.out.println("DEBUG: Connection successful: " + connection);
	        
	        try (PreparedStatement statement = connection.prepareStatement(query)) {
	            
	            try (ResultSet resultSet = statement.executeQuery()) {
	                
	                
	                if (!resultSet.isBeforeFirst()) {
	                    System.out.println("DEBUG: ResultSet is empty - no rows returned");
	                }
	                
	                while (resultSet.next()) {
	                    System.out.println("DEBUG: Found plant - ID: " + resultSet.getInt("plant_id") 
	                        + ", Name: " + resultSet.getString("plant_name"));
	                    
	                    PlantModel plant = mapResultSetToPlant(resultSet);
	                    plants.add(plant);
	                }
	                System.out.println("DEBUG: Total plants mapped: " + plants.size());
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println("ERROR in getFeaturedPlants:");
	        e.printStackTrace();
	    }
	    return plants;
	}
	 /**
     * Retrieves all plants available in the database.
     * 
     * @return List<PlantModel> list of all PlantModel objects
     * @throws ClassNotFoundException if the database driver class is not found
     */
    // Method to get all plants
	public List<PlantModel> getAllPlants() throws ClassNotFoundException {
	    List<PlantModel> plants = new ArrayList<>();
	    String query = "SELECT * FROM plant"; 
	    
	    try (Connection connection = DbConfig.getDbConnection();
	         PreparedStatement statement = connection.prepareStatement(query);
	         ResultSet resultSet = statement.executeQuery()) {
	        
	        while (resultSet.next()) {
	            PlantModel plant = mapResultSetToPlant(resultSet);
	            plants.add(plant);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return plants;
	}
	 /**
     * Retrieves a single plant by its unique ID.
     * 
     * @param id int the unique identifier of the plant
     * @return PlantModel the PlantModel object matching the ID, or null if not found
     * @throws ClassNotFoundException if the database driver class is not found
     */
    // Method to get a single plant by ID
    public PlantModel getPlantById(int id) throws ClassNotFoundException {
        PlantModel plant = null;
        String query = "SELECT * FROM plant WHERE plant_id = ?";
        
        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    plant = mapResultSetToPlant(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plant;
    }
    /**
     * Retrieves plants that belong to a specific category.
     * 
     * @param categoryId int the ID of the category
     * @return List<PlantModel> list of plants within the specified category
     * @throws ClassNotFoundException if the database driver class is not found
     */
    // Method to get plants by category
    public List<PlantModel> getPlantsByCategory(int categoryId) throws ClassNotFoundException {
        List<PlantModel> plants = new ArrayList<>();
        String query = "SELECT * FROM plant WHERE category_id = ? ORDER BY plant_name ASC";
        
        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, categoryId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    PlantModel plant = mapResultSetToPlant(resultSet);
                    plants.add(plant);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plants;
    }
    /**
     * Helper method to map the current row of a ResultSet to a PlantModel object.
     * 
     * @param resultSet ResultSet the ResultSet positioned at a valid row
     * @return PlantModel the mapped PlantModel object
     * @throws SQLException if any SQL error occurs during reading the ResultSet
     */
    // Helper method to map ResultSet to PlantModel
    private PlantModel mapResultSetToPlant(ResultSet resultSet) throws SQLException {
        PlantModel plant = new PlantModel();
        plant.setPlantId(resultSet.getInt("plant_id"));
        plant.setPlantName(resultSet.getString("plant_name"));
        plant.setScientificName(resultSet.getString("scientific_name"));
        plant.setSoilType(resultSet.getString("soil_type"));
        plant.setFertilizerRequirement(resultSet.getString("fertilizer_requirement"));
        plant.setSunlightRequirement(resultSet.getString("sunlight_requirement"));
        plant.setBloomingSeason(resultSet.getString("blooming_season"));
        plant.setWaterFrequency(resultSet.getString("water_frequency"));
        plant.setCareDescription(resultSet.getString("care_description"));
        plant.setPlantAddedDate(resultSet.getDate("plant_added_date"));
        plant.setCategoryId(resultSet.getInt("category_id"));
     // Handle image URL
        String imageUrl = resultSet.getString("image_url");
        if (imageUrl != null) {
            // Ensure the path starts with /resources/images/system/
            if (!imageUrl.startsWith("/resources/images/system/")) {
                imageUrl = "/resources/images/system/" + imageUrl;
            }
            // Ensure the URL has the correct extension
            if (!imageUrl.toLowerCase().endsWith(".jpg") && 
                !imageUrl.toLowerCase().endsWith(".png") && 
                !imageUrl.toLowerCase().endsWith(".jpeg")) {
                imageUrl += ".jpg"; // default to jpg if no extension
            }
        }
        plant.setImageUrl(imageUrl);
        
        return plant;
  
    }
    /**
     * Searches for plants where the plant name or scientific name contains the given keyword.
     * The search is case-insensitive and supports partial matches.
     * 
     * @param keyword String the search keyword to look for in plant names or scientific names
     * @return List<PlantModel> list of plants matching the search criteria
     * @throws ClassNotFoundException if the database driver class is not found
     */
    // Method to search plants by name or scientific name
    public List<PlantModel> searchPlants(String keyword) throws ClassNotFoundException {
        List<PlantModel> plants = new ArrayList<>();
        String query = "SELECT * FROM plant WHERE plant_name LIKE ? OR scientific_name LIKE ? ORDER BY plant_name ASC";
        
        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            String searchPattern = "%" + keyword + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    PlantModel plant = mapResultSetToPlant(resultSet);
                    plants.add(plant);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plants;
    }
}