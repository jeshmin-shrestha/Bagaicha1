<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f0f0f0;
            color: #2e4f34;
        }

        .reset-container {
            padding: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }

        .back-btn {
            position: absolute;
            left: 50px;
            top: 50px;
            font-size: 30px;
            color: white;
            background-color: #3e8134;
            border-radius: 50%;
            padding: 10px 16px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #2e6b28;
        }

        .welcome-box {
            background-color: #C3CDB2;
            padding: 20px 30px;
            width: 100%;
            max-width: 600px;
            border-radius: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-box h2 {
            font-size: 22px;
            font-weight: 600;
        }

        .user-icon {
            width: 60px;
            height: 60px;
        }

        .reset-box {
            margin-top: 30px;
            background-color: #C3CDB2;
            padding: 30px;
            width: 100%;
            max-width: 600px;
            border-radius: 15px;
        }

        .reset-box h3 {
            margin-top: 0;
            font-size: 20px;
            color: #3e5b2d;
        }

        .reset-box label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
        }

        .reset-box input {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border-radius: 25px;
            border: none;
            outline: none;
        }

        .reset-box button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #3e8134;
            color: white;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .reset-box button:hover {
            background-color: #2e6b28;
        }

        @media (max-width: 600px) {
            .reset-container {
                padding: 20px;
            }

            .back-btn {
                left: 20px;
                top: 20px;
                font-size: 24px;
            }

            .welcome-box,
            .reset-box {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<main class="reset-container">
    <a href="user_profile.jsp" class="back-btn">&#8592;</a>
    
    <section class="welcome-box">
        <h2>Hello ${user.fullName}!</h2> <!-- Dynamic user name -->
        <img src="${pageContext.request.contextPath}/resources/images/system/user/${user.image}" 
             onerror="this.src='${pageContext.request.contextPath}/resources/images/system/user_icon.png'" 
             class="user-icon">
    </section>

    <section class="reset-box">
        <h3>Reset Password</h3>
        <p>Enter the email address you used when you joined.</p>

<form action="change-password" method="post">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="currentPassword">Current Password</label>
            <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter your current password" required>

            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Enter your new password" required>

            <button type="submit">Reset Password</button>
        </form>
    </section>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>