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
            background-color: var(--light-green);
            text-align: center;
            padding: 80px 20px 40px;
            position: relative;
            overflow: hidden;
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
            background-color: var(--light-green);
            padding: 60px;
            border-radius: 12px;
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
        }

        .story-section::before {
            content: '🌿';
            position: absolute;
            font-size: 200px;
            opacity: 0.1;
            right: 20px;
            top: 20px;
        }

        .story-section h2 {
            color: var(--dark-green);
            margin-top: 0;
        }

        .story-section p {
            font-size: 1.1rem;
            max-width: 800px;
        }

        /* Reviews Section */
        .reviews-section {
            text-align: center;
            margin-bottom: 60px;
        }

        .reviews-section h2 {
            color: var(--primary-green);
            margin-bottom: 10px;
        }

        .rating {
            font-size: 1.5rem;
            color: #ffc107;
            margin-bottom: 20px;
        }

        .review-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .review-card {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: left;
        }

        .review-card p {
            font-style: italic;
            margin-bottom: 20px;
        }

        .reviewer {
            font-weight: bold;
            color: var(--primary-green);
        }
/* Mission Icons Section */
        .mission-icons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            margin: 60px 0;
        }

        .mission-icon {
            background-color: white;
            padding: 30px 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .mission-icon:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .mission-icon i {
            font-size: 2.5rem;
            color: var(--primary-green);
            margin-bottom: 15px;
            display: block;
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

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .mission-icons {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
        }

        @media (max-width: 480px) {
            .mission-icons {
                grid-template-columns: 1fr;
            }
            }
        /* Responsive Design */
        @media (max-width: 768px) {
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
        /* Cascading Reviews Section */
        .reviews-section {
            text-align: center;
            margin: 80px 0;
            position: relative;
            min-height: 600px;
        }

        .reviews-container {
            position: relative;
            max-width: 1000px;
            margin: 0 auto;
            height: 500px;
        }

        .review-card {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            position: absolute;
            width: 280px;
            transition: all 0.3s ease;
        }

        .review-card:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        /* Positioning the 5 review cards in staircase pattern */
        .review-card:nth-child(1) {  /* Bottom center */
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1;
        }

        .review-card:nth-child(2), 
        .review-card:nth-child(3) {  /* Middle level */
            bottom: 120px;
            z-index: 2;
        }

        .review-card:nth-child(2) {  /* Middle left */
            left: 15%;
        }

        .review-card:nth-child(3) {  /* Middle right */
            right: 15%;
        }

        .review-card:nth-child(4),
        .review-card:nth-child(5) {  /* Top level */
            bottom: 240px;
            z-index: 3;
        }

        .review-card:nth-child(4) {  /* Top left */
            left: 5%;
        }

        .review-card:nth-child(5) {  /* Top right */
            right: 5%;
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
    </style>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- About Header -->
    <section class="about-header">
        <h1>ABOUT US</h1>
    </section>

    <!-- Main Content -->
    <div class="about-container">
        <!-- Mission Icons Section -->
        <section class="mission-icons">
            <div class="mission-icon">
                <i class="fas fa-seedling"></i>
                <h3>Quality Plants</h3>
                <p>Nurtured with care for your home and garden</p>
            </div>
            <div class="mission-icon">
                <i class="fas fa-hand-holding-heart"></i>
                <h3>Local Knowledge</h3>
                <p>Expertise tailored to Nepal's climate</p>
            </div>
            <div class="mission-icon">
                <i class="fas fa-users"></i>
                <h3>Community</h3>
                <p>Connecting plant lovers nationwide</p>
            </div>
            <div class="mission-icon">
                <i class="fas fa-leaf"></i>
                <h3>Sustainability</h3>
                <p>Eco-friendly practices in all we do</p>
            </div>
            <div class="mission-icon">
                <i class="fas fa-smile"></i>
                <h3>Customer Joy</h3>
                <p>Your satisfaction is our growth</p>
            </div>
        </section>

        <!-- Story Section -->
        <section class="story-section">
            <h2>This Feeling Is Mutual</h2>
            <p>We're more than just a plant shop - we're a community of plant lovers dedicated to helping you cultivate your own green space, no matter how big or small. Our team of gardening experts is always here to share their knowledge and passion.</p>
        </section>
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