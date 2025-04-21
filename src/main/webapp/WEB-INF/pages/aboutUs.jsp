<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us | Bagaicha</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary-green: #2c6e49;
            --secondary-green: #4c956c;
            --light-green: #c3cdb2;
            --dark-green: #1f4f1f;
            --light-gray: #f5f5f5;
            --medium-gray: #dcdcdc;
            --dark-gray: #333333;
        }
        
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-gray);
            color: var(--dark-gray);
            line-height: 1.6;
        }

        /* Header Section */
        .about-header {
            text-align: center;
            padding: 80px 20px 40px;
            position: relative;
            overflow: hidden;
            background:url('resources/images/system/aboutus.png');
            height:950px;
        }
        .about-header h1 {
            margin: 0;
            font-size: 2.8rem;
            color: var(--dark-green);
            font-weight: 600;
            position: relative;
            display: inline-block;
        }

        .about-header h1::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--dark-green);
            border-radius: 2px;
        }

        /* Main Content Container */
        .about-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Mission Section */
        .mission-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-bottom: 60px;
        }

        .mission-card {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .mission-card h2 {
            color: var(--primary-green);
            margin-top: 0;
            position: relative;
            padding-bottom: 15px;
        }

        .mission-card h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background: var(--primary-green);
        }

        .mission-card p {
            font-size: 1.1rem;
            color: var(--dark-gray);
        }

        /* Story Section */
        .story-section {
            background-color: #767676;
            padding: 60px;
               height:400px;
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
            width:100%;
            
        }

        .story-section::before {
            content: '🌿';
            position: absolute;
            font-size: 200px;
            opacity: 0.1;
            right: 20px;
            top: 20px;
            height:600px;
        }

        .story-section h2 {
            color: white;
            margin-top: 0;
            text-align: center;
        }

        .story-section p {
    color: white;
    font-size: 1.1rem;
    max-width: 800px;
    margin: 0 auto;
    text-align: center;
}


        /* Mission Icons Section */
        .mission-icons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            margin: 60px 0;
            
        }

        .mission-icon {
            background-color: #C3CDB2;
            padding: 30px 20px;
            border-radius:80px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .mission-icon:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .mission-icon img {
            width: 120px;
            height: 120px;
            object-fit: contain;
            margin-bottom: 20px;
            filter: brightness(0) saturate(100%) invert(25%) sepia(50%) saturate(800%) hue-rotate(100deg) brightness(90%) contrast(90%);
        }

        .mission-icon h3 {
            color: var(--dark-green);
            margin: 0 0 10px 0;
            font-size: 1.2rem;
        }

        .mission-icon p {
            font-size: 0.9rem;
            color: var(--dark-gray);
            margin: 0;
        }

        /* Reviews Section */
        .reviews-section {
            text-align: center;
            margin: 80px 0;
            position: relative;
            min-height: 600px;
        }

       .reviews-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
    max-width: 1000px;
    margin: 40px auto 0;
}

.review-card {
    background-color: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    width: 280px;
    transition: all 0.3s ease;
}
        .review-card:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        

        .review-card p {
            font-style: italic;
            margin-bottom: 15px;
            font-size: 0.95rem;
        }

        .reviewer {
            font-weight: bold;
            color: var(--primary-green);
        }

        .rating {
            font-size: 1.5rem;
            color: #ffc107;
            margin-bottom: 30px;
        }

        /* Responsive adjustments */
        @media (max-width: 1800px) {
            .about-header {
                background-size: cover;
                background-position: center;
                height: 300px;
                padding: 60px 15px 30px;
            }
        }

        @media (max-width: 900px) {
            .reviews-container {
                height: 700px;
            }
            
            .review-card {
                width: 240px;
            }
            
            .review-card:nth-child(2) {
                left: 5%;
            }
            
            .review-card:nth-child(3) {
                right: 5%;
            }
        }

        @media (max-width: 768px) {
            .mission-icons {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
            
            .about-header h1 {
                font-size: 2.2rem;
            }
            
            .mission-card, .story-section {
                padding: 30px;
            }
            
            .story-section::before {
                font-size: 100px;
            }
        }

        @media (max-width: 650px) {
            .reviews-container {
                height: auto;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 30px;
            }
            
            .review-card {
                position: static;
                transform: none !important;
                width: 80%;
                margin-bottom: 20px;
            }
        }

        @media (max-width: 480px) {
            .mission-icons {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- About Header -->
    <section class="about-header">
    </section>

    <!-- Main Content -->
    <div class="about-container">
        <!-- Mission Icons Section -->
        <section class="mission-icons">
<div class="mission-icon">
    <img src="resources/images/system/trackplant.png" alt="Track Plants Icon">
    <h3>Track Plants</h3>
    <p>Follow your plant’s growth and health easily.</p>
</div>
<div class="mission-icon">
    <img src="resources/images/system/manageplants.png" alt="Manage Plants Icon">
    <h3>Manage Plants</h3>
    <p>Organize care routines and reminders.</p>
</div>
<div class="mission-icon">
    <img src="resources/images/system/searchplant.png" alt="Search Icon">
    <h3>Search</h3>
    <p>Look up plants and care details fast.</p>
</div>
<div class="mission-icon">
    <img src="resources/images/system/icon10.png" alt="Sustainability Icon">
    <h3>Sustainability</h3>
    <p>Grow green with eco-friendly practices.</p>
</div>
<div class="mission-icon">
    <img src="resources/images/system/icon11.png" alt="Update Data Icon">
    <h3>Update Data</h3>
    <p>Edit and sync your plant info anytime.</p>
</div>

        </section>
</div>
        <!-- Story Section -->
        <section class="story-section">
            <h2>This Feeling Is Mutual</h2>
            <p>"The name “Baigaicha” comes from the Nepali word for “garden.”
A name that echoed the morning sun, the dew on leaves, and the quiet joy of watching life bloom."</p>
<br><br>
<p>


To bridge the gap between people and plants — using smart tools, local knowledge, and a whole lot of love.  Because we believe when plants thrive, people do too.</p>
        </section>
<div class="about-container">
        <!-- Reviews Section -->
        <section class="reviews-section">
            <h2>What Our Customers Say</h2>
            <div class="rating">★★★★★</div>
            <p>4.9 average star review from hundreds of happy customers</p>
            
            <div class="reviews-container">
                <div class="review-card">
                    <p>"Bagaicha's plants transformed my apartment balcony into a green paradise. Their Kathmandu-specific advice was invaluable!"</p>
                    <div class="reviewer">— Asha, Kathmandu</div>
                </div>
                <div class="review-card">
                    <p>"The quality exceeds anything I've found elsewhere. My fiddle leaf fig from Bagaicha is thriving after 2 years!"</p>
                    <div class="reviewer">— Raj, Pokhara</div>
                </div>
                <div class="review-card">
                    <p>"Their workshop taught me everything about monsoon plant care. Now my garden flourishes year-round!"</p>
                    <div class="reviewer">— Sunita, Lalitpur</div>
                </div>
                <div class="review-card">
                    <p>"The monthly plant subscription brings me so much joy. Each delivery feels like a personal gift."</p>
                    <div class="reviewer">— Anil, Bhaktapur</div>
                </div>
                <div class="review-card">
                    <p>"Customer service went above and beyond when my plant arrived damaged. They truly care!"</p>
                    <div class="reviewer">— Priya, Dharan</div>
                </div>
            </div>
        </section>
    </div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>