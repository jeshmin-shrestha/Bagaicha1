<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard</title>

    <style>

        * {

            margin: 0;

            padding: 0;

            box-sizing: border-box;

            font-family: 'Poppins', sans-serif;

        }

        

        body {

            background-color: #D9D9D9;

            padding-top: 120px; /* Space for fixed header */

        }



        /* Welcome message */

        .welcome-message {

            text-align: left;

            margin: 40px 0;

            font-size: 24px;

            color: #333;

            background-color:#C3CDB2;

            border-radius:70px;

            height:200px;

            padding:75px;

             position: relative;

        }



        .welcome-message h2 {

            font-size: 36px;

            color: #2c6e49;

        }



        .welcome-message p {

            font-size: 18px;

            color: #777;

        }

  /* Floating Bot Animation */

        .bot-icon {

    position: absolute;

    top: 15px;

    right: 60px; /* Adjusted the value to make it less to the right */

    width: 200px;

    height: 200px;

    animation: wave 3s ease-in-out infinite; /* Animation name and timing */

}





        /* Waving animation */

        @keyframes wave {

            0% {

                transform: translateX(0) rotate(0deg);

            }

            25% {

                transform: translateX(10px) rotate(5deg);

            }

            50% {

                transform: translateX(0) rotate(0deg);

            }

            75% {

                transform: translateX(-10px) rotate(-5deg);

            }

            100% {

                transform: translateX(0) rotate(0deg);

            }

        }

        /* Stats Cards */

        .stats-cards {

            display: flex;

            justify-content: space-around;

            margin: 40px 0;

        }



        .card {

    background-color: #C3CDB2;

    border-radius: 10px;

    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);

    padding: 30px;

    width: 30%;

    display: flex;

    align-items: center;

    gap: 20px;

    height: 150px;

}

        

        



        .card h3 {

            font-size: 22px;

            color: #444;

        }

.card-icon {

    width: 150px;

    height: 150px;

    object-fit: contain;

}



.card-content {

    display: flex;

    flex-direction: column;

    align-items: flex-start;

}

        .card .value {

            font-size: 32px;

            font-weight: bold;

            color: #2c6e49;

        }



        /* Categories Section */

        .categories {

            display: flex;

            justify-content: space-around;

            margin: 40px 0;

        }



        .category-item {

            background-color: #ffffff;

            border-radius: 10px;

            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);

            padding: 20px;

            width: 30%;

            text-align: center;

            transition: transform 0.3s ease;

        }



        .category-item:hover {

            transform: scale(1.05);

        }



        .category-item i {

            font-size: 40px;

            color: #6c593d;

            margin-bottom: 10px;

        }



        .category-item h3 {

            font-size: 20px;

            color: #333;

        }

        

        /* Footer (Assuming footer.jsp has some basic footer structure) */

        footer {

            background-color: #2c6e49;

            padding: 20px;

            text-align: center;

            color: white;

        }

    </style>

</head>

<body>



    <!-- Include header.jsp -->

    <jsp:include page="header.jsp" />



    <div class="dashboard-content">

        <div class="welcome-message">

            <h2>Hello Admin!</h2>

            <p>Let's grow and thrive today!</p>

            <!-- Floating Bot Icon -->

            <img src="resources/images/system/robot_icon.png" alt="Bot Icon" class="bot-icon"> <!-- Add your bot image here -->

        </div>

        </div>



       <!-- Stats Cards -->

<div class="stats-cards">

    <div class="card">

        <img src="resources/images/system/plant_icon.png" alt="Total Plants Icon" class="card-icon">

        <div class="card-content">

            <h3>Total Plants</h3>

            <div class="value">24,000</div>

        </div>

    </div>

    <div class="card">

        <img src="resources/images/system/newuser.png" alt="Total Users Icon" class="card-icon">

        <div class="card-content">

            <h3>Total Users</h3>

            <div class="value">200+</div>

        </div>

    </div>

    <div class="card">

        <img src="resources/images/system/total_icon.png" alt="Monthly New Plants Icon" class="card-icon">

        <div class="card-content">

            <h3>Monthly New Plants</h3>

            <div class="value">20</div>

        </div>

    </div>

</div>



<!-- Second Row -->

<div class="stats-cards">

    <div class="card" style="height: 200px;">

        <img src="resources/images/system/plant_category.png" alt="Plant Category Icon" class="card-icon">

        <div class="card-content">

            <h3>Plant Category</h3>

            <div class="value">24,000</div>

        </div>

    </div>

    <div class="card" style="height: 200px;">

        <img src="resources/images/system/newplant.png" alt="Recently Added Plants Icon" class="card-icon">

        <div class="card-content">

            <h3>Recently added plants</h3>

            <div class="value">200+</div>

        </div>

    </div>

</div>





     

    



    <!-- Include footer.jsp -->

    <jsp:include page="footer.jsp" />

</body>

</html>

