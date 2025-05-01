package com.bagaicha.service;

import com.bagaicha.config.DbConfig;
import com.bagaicha.model.PlantModel;

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
    public boolean updatePlant(PlantModel plant) throws ClassNotFoundException {
        String sql = "UPDATE plant SET plant_name=?, scientific_name=?, soil_type=?, " +
                     "fertilizer_requirement=?, sunlight_requirement=?, blooming_season=?, " +
                     "water_frequency=?, care_description=?, category_id=? WHERE plant_id=?";
        
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
            stmt.setInt(10, plant.getPlantId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error updating plant: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
