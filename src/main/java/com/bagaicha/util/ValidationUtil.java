package com.bagaicha.util;

import java.time.LocalDate;
//import java.time.Period;
import java.util.regex.Pattern;
import jakarta.servlet.http.Part;
/**
 * Utility class for various input validations used across the Bagaicha application.
 * <p>
 * This class provides static methods to validate common user input such as names,
 * emails, phone numbers, passwords, roles, addresses, dates, and file uploads.
 * It centralizes validation logic to ensure consistency and maintainability.
 * </p>
 * 
 * @author Jeshmin Shrestha
 */
public class ValidationUtil {
	/**
	 * Checks if a given string is null or empty after trimming.
	 * @param value The string to check.
	 * @return true if null or empty, false otherwise.
	 */
	// 1. Null or empty check
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    // 2. Name validation (only letters and spaces allowed)
    public static boolean isValidName(String value) {
        return value != null && value.matches("^[a-zA-Z\\s]{2,50}$");
    }
    public static boolean isAlphanumericStartingWithLetter(String value) {
        return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
    }
    // 3. Email validation
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    // 4. Phone validation (starts with 98 and 10 digits)
    public static boolean isValidPhoneNumber(String number) {
        return number != null && number.matches("^98\\d{8}$");
    }

    // 5. Password strength validation (at least 8 characters, 1 uppercase, 1 number, 1 symbol)
    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password != null && password.matches(passwordRegex);
    }

    // 6. Password match check
    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }

    // 7. Role check (admin or customer)
    public static boolean isValidUserRole(String role) {
        return "admin".equalsIgnoreCase(role) || "customer".equalsIgnoreCase(role);
    }

    // 8. Address validation (allow alphanumeric + punctuation, min 5 chars)
    public static boolean isValidAddress(String address) {
        return address != null && address.matches("^[\\w\\s,.-]{5,100}$");
    }

   

    // 10. Alphanumeric ID check
    public static boolean isValidID(String id) {
        return id != null && id.matches("^[a-zA-Z0-9_-]{3,20}$");
    }

    // 11. Plant name (letters, optional numbers, spaces)
    public static boolean isValidPlantName(String name) {
        return name != null && name.matches("^[a-zA-Z0-9\\s]{2,50}$");
    }

    // 12. Scientific name validation
    public static boolean isValidScientificName(String scientificname) {
        return scientificname != null && scientificname.matches("^[A-Z][a-z]+\\s[a-z]+$"); // e.g. Ficus elastica
    }

    // 13. General short description (50 to 200 characters)
    public static boolean isValidDescription(String desc) {
        return desc != null && desc.length() >= 10 && desc.length() <= 200;
    }

    // 14. Validate frequency, requirement, etc. as not null and not too long
    public static boolean isValidGeneralField(String value) {
        return value != null && value.length() <= 100;
    }

    // 15. Blooming season format (e.g., Spring, Winter)
    public static boolean isValidSeason(String season) {
        return season != null && season.matches("^[a-zA-Z\\s]{3,20}$");
    }

    // 16. Image file extension
    public static boolean isValidImageExtension(Part imagePart) {
        if (imagePart == null || isNullOrEmpty(imagePart.getSubmittedFileName())) {
            return false;
        }
        String fileName = imagePart.getSubmittedFileName().toLowerCase();
        return fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png") || fileName.endsWith(".gif");
    }

    // 17. Added date (must be today or before)
    public static boolean isValidAddedDate(LocalDate addedDate) {
        return addedDate != null && !addedDate.isAfter(LocalDate.now());
    }

    // 18. Category name and description
    public static boolean isValidCategoryName(String name) {
        return name != null && name.matches("^[a-zA-Z\\s]{3,30}$");
    }

    public static boolean isValidCategoryDescription(String desc) {
        return desc != null && desc.length() <= 200;
    }

 // Updated method: 9. Last login check for Timestamp
    public static boolean isValidLastLogin(java.sql.Timestamp lastLogin) {
        return lastLogin == null || lastLogin.before(new java.sql.Timestamp(System.currentTimeMillis()));
    }
    


}