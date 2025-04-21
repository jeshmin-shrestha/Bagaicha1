<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-green: #2E7D32;
            --light-green: #C3CDB2;
            --soft-green: #d0d9cd;
            --accent-orange: #F0AD4E;
            --danger-red: #D9534F;
            --success-green: #5CB85C;
            --neutral-gray: #9E9E9E;
            --dark-text: #2D3748;
            --light-text: #718096;
            --white: #FFFFFF;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.12);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark-text);
            background-color: #f5f7f5;
            line-height: 1.6;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .profile-card {
            background-color: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--shadow-lg);
            margin-bottom: 40px;
        }
        

        .profile-header {
background:#C3CDB2;
            color: var(--white);
            padding: 30px;
            text-align: center;
            position: relative;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--white);
            margin: 0 auto 15px;
            box-shadow: var(--shadow-md);
        }

        .profile-header h2 {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .profile-header p {
            color: rgba(255,255,255,0.9);
            font-size: 1rem;
        }

        .edit-profile-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: var(--white);
            color: var(--primary-green);
            border: none;
            border-radius: 20px;
            padding: 8px 16px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: var(--transition);
        }

        .edit-profile-btn:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
        }

        .profile-body {
            padding: 30px;
            
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-text);
        }

        .input-field {
            position: relative;
        }

        input, select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            transition: var(--transition);
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-green);
            box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.2);
        }

        .phone-input {
            display: flex;
            align-items: center;
        }

        .flag {
            width: 30px;
            margin-right: 10px;
            border-radius: 4px;
        }

        .country-select {
            width: 120px;
            margin-right: 10px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-save {
            background-color: var(--primary-green);
            color: var(--white);
        }

        .btn-change-password {
            background-color: var(--accent-orange);
            color: var(--white);
        }

        .btn-logout {
            background-color: var(--danger-red);
            color: var(--white);
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: var(--shadow-sm);
        }

        .profile-stats {
            display: flex;
            justify-content: space-around;
            background-color: var(--light-green);
            padding: 20px;
            border-radius: 0 0 16px 16px;
            text-align: center;
        }

        .stat-item {
            padding: 0 15px;
        }

        .stat-number {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-green);
        }

        .stat-label {
            font-size: 0.9rem;
            color: var(--light-text);
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .action-buttons {
                flex-direction: column;
            }

            .profile-stats {
                flex-direction: column;
                gap: 15px;
            }
        }

        @media (max-width: 480px) {
            .profile-header {
                padding: 20px;
            }

            .profile-header h2 {
                font-size: 1.5rem;
            }

            .profile-avatar {
                width: 100px;
                height: 100px;
            }
        }
         /* Header Space */
        .header-space {
            height: 50px;
        }
        
    </style>
</head>
<body>
    <div class="header-space"></div>

<div class="container">
    <div class="profile-card">
        <div class="profile-header">
            <img src="resources/images/system/newuser.png" alt="Profile Picture" class="profile-avatar">
            <h2>Jeshmin Shrestha</h2>
            
            <button class="edit-profile-btn">
                <i class="fas fa-pencil-alt"></i> Edit Profile
            </button>
        </div>

        <div class="profile-body">
            <form id="profileForm">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <div class="input-field">
                            <input type="text" id="fullName"  readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="input-field">
                            <input type="email" id="email"  readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="username">Username</label>
                        <div class="input-field">
                            <input type="text" id="username" readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="address">Address</label>
                        <div class="input-field">
                            <input type="text" id="address"  readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Phone Number</label>
                        <div class="phone-input">
                            <img class="flag" src="https://flagcdn.com/w40/np.png" alt="Nepal Flag">
                            <input type="tel"  readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="birthdate">Date of Birth</label>
                        <div class="input-field">
                            <input type="date" id="birthdate"  readonly>
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <button type="button" class="btn btn-save">
                        <i class="fas fa-save"></i> Save Changes
                    </button>
                    <button type="button" class="btn btn-change-password">
                        <i class="fas fa-key"></i> Change Password
                    </button>
                    <button type="button" class="btn btn-logout">
                        <i class="fas fa-sign-out-alt"></i> Log out
                    </button>
                </div>
            </form>
        </div>

        
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>