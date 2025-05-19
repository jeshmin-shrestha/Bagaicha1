package com.bagaicha.model;

import java.sql.Date;

/**
 * Represents a plant in the system.
 */
public class PlantModel {

    private int plantId;
    private String plantName;
    private String scientificName;
    private String soilType;
    private String fertilizerRequirement;
    private String sunlightRequirement;
    private String bloomingSeason;
    private String waterFrequency;
    private String careDescription;
    private Date plantAddedDate;
    private String imageUrl;
    private int categoryId;

    // Default constructor
    public PlantModel() {}
    /**
     * Constructs a PlantModel with all fields.
     *
     * @param plantId               the unique identifier of the plant
     * @param plantName             the common name of the plant
     * @param scientificName        the scientific name of the plant
     * @param soilType              the preferred soil type
     * @param fertilizerRequirement the fertilizer needs
     * @param sunlightRequirement   the sunlight needs
     * @param bloomingSeason        the season when the plant blooms
     * @param waterFrequency        the watering frequency
     * @param careDescription       the care instructions
     * @param plantAddedDate        the date the plant was added
     * @param imageUrl              the image URL of the plant
     * @param categoryId            the ID of the category the plant belongs to
     */
    // Full constructor
    public PlantModel(int plantId, String plantName, String scientificName, String soilType,
                      String fertilizerRequirement, String sunlightRequirement, String bloomingSeason,
                      String waterFrequency, String careDescription, Date plantAddedDate,
                      String imageUrl, int categoryId) {
        this.plantId = plantId;
        this.plantName = plantName;
        this.scientificName = scientificName;
        this.soilType = soilType;
        this.fertilizerRequirement = fertilizerRequirement;
        this.sunlightRequirement = sunlightRequirement;
        this.bloomingSeason = bloomingSeason;
        this.waterFrequency = waterFrequency;
        this.careDescription = careDescription;
        this.plantAddedDate = plantAddedDate;
        this.imageUrl = imageUrl;
        this.categoryId = categoryId;
    }

    // Constructor without ID (for inserts)
    public PlantModel(String plantName, String scientificName, String soilType,
                      String fertilizerRequirement, String sunlightRequirement, String bloomingSeason,
                      String waterFrequency, String careDescription, Date plantAddedDate,
                      String imageUrl, int categoryId) {
        this.plantName = plantName;
        this.scientificName = scientificName;
        this.soilType = soilType;
        this.fertilizerRequirement = fertilizerRequirement;
        this.sunlightRequirement = sunlightRequirement;
        this.bloomingSeason = bloomingSeason;
        this.waterFrequency = waterFrequency;
        this.careDescription = careDescription;
        this.plantAddedDate = plantAddedDate;
        this.imageUrl = imageUrl;
        this.categoryId = categoryId;
    }

    // Getters and Setters

    /**
     * @param plantId the plant ID to set
     */
    public int getPlantId() {
        return plantId;
    }
    /**
     * @return the plant name
     */
    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }

    public String getPlantName() {
        return plantName;
    }

    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }

    public String getSoilType() {
        return soilType;
    }

    public void setSoilType(String soilType) {
        this.soilType = soilType;
    }

    public String getFertilizerRequirement() {
        return fertilizerRequirement;
    }

    public void setFertilizerRequirement(String fertilizerRequirement) {
        this.fertilizerRequirement = fertilizerRequirement;
    }

    public String getSunlightRequirement() {
        return sunlightRequirement;
    }

    public void setSunlightRequirement(String sunlightRequirement) {
        this.sunlightRequirement = sunlightRequirement;
    }

    public String getBloomingSeason() {
        return bloomingSeason;
    }

    public void setBloomingSeason(String bloomingSeason) {
        this.bloomingSeason = bloomingSeason;
    }

    public String getWaterFrequency() {
        return waterFrequency;
    }

    public void setWaterFrequency(String waterFrequency) {
        this.waterFrequency = waterFrequency;
    }

    public String getCareDescription() {
        return careDescription;
    }

    public void setCareDescription(String careDescription) {
        this.careDescription = careDescription;
    }

    public Date getPlantAddedDate() {
        return plantAddedDate;
    }

    public void setPlantAddedDate(Date plantAddedDate) {
        this.plantAddedDate = plantAddedDate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
