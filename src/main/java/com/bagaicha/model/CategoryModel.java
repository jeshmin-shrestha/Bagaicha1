package com.bagaicha.model;

/**
 * Represents a plant category in the system.
 */
public class CategoryModel {

    private int categoryId;
    private String categoryName;
    private String categoryDescription;

    // Default constructor
    public CategoryModel() { }

    /**
     * Constructs a CategoryModel with all fields.
     * 
     * @param categoryId          the unique identifier of the category
     * @param categoryName        the name of the category
     * @param categoryDescription a brief description of the category
     */
    public CategoryModel(int categoryId, String categoryName, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
    }

    /**
     * Constructs a CategoryModel without ID, typically used for inserts.
     * 
     * @param categoryName        the name of the category
     * @param categoryDescription a brief description of the category
     */
    public CategoryModel(String categoryName, String categoryDescription) {
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
    }

    // Getters and Setters
    /**
     * Gets the unique identifier of the category.
     * 
     * @return the category ID
     */
    public int getCategoryId() {
        return categoryId;
    }
    /**
     * Sets the unique identifier of the category.
     * 
     * @param categoryId the category ID to set
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }
}
