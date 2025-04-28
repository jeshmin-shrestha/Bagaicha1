<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us | Bagaicha</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutUs.css" />
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