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
}
