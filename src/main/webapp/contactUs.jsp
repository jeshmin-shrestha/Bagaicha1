<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | Bagaicha</title>
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
        .contact-header {
            background-color: var(--light-green);
            text-align: center;
            padding: 80px 20px 40px;
            position: relative;
            overflow: hidden;
        }

        .contact-header h1 {
            margin: 0;
            font-size: 2.8rem;
            color: var(--dark-green);
            font-weight: 600;
            position: relative;
            display: inline-block;
        }

        .contact-header h1::after {
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
        .contact-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Form Section */
        .form-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 40px;
            margin-bottom: 50px;
        }

        .contact-card {
            background: linear-gradient(to right, #bcd9a7, #d9e8c0);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .contact-card h3 {
            color: var(--primary-green);
            font-size: 1.7rem; margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-green);
        }
input-wrapper {
            position: relative;
            max-width: 100%;
        }
        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .submit-btn {
            background-color: var(--primary-green);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: var(--dark-green);
        }

        /* Contact Info Section */
        .contact-info {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 50px;
        }

        .info-item {
                          background: linear-gradient(to right, #bcd9a7, #d9e8c0);

    padding: 20px 30px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    gap: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.05);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer; }
.info-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    background-color: var(--light-green);
}
        .info-icon {
            font-size: 1.5rem;
            color: var(--primary-green);
        }

        /* Map Section */
        .map-container {
            margin-bottom: 50px;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .map-container iframe {
            width: 100%;
            height: 400px;
            border: none;
            display: block;
        }
.subscribe-form input[type="email"] {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 1rem;
    background-color: white; /* 👈 This makes it white */
    transition: border-color 0.3s ease;
}

.subscribe-form input[type="email"]:focus {
    outline: none;
    border-color: var(--primary-green);
}

        /* Responsive Design */
        @media (max-width: 768px) {
            .contact-header h1 {
                font-size: 2.2rem;
            }
            
            .contact-card {
                padding: 30px;
            }
            
            .form-section {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- Contact Header -->
    <section class="contact-header">
        <h1>CONTACT US</h1>
    </section>

    <!-- Main Content -->
    <div class="contact-container">
        <!-- Form Section -->
        <section class="form-section">
            <!-- Contact Form -->
            <div class="contact-card">
                <h3>🌿 Send Us a Message</h3>
                <form method="post" action="ContactServlet">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    </div>
                    <div class="form-group">
                        <input type="tel" name="phone" class="form-control" placeholder="Phone Number">
                    </div>
                    <div class="form-group">
                        <textarea name="message" class="form-control" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="submit-btn">Send Message</button>
                </form>
            </div>

            <!-- Newsletter Form -->
<div class="contact-card" >
    <h3 style="font-size: 1.7rem; margin-bottom: 10px;">🌿 Join Our Green Letter</h3>
    <p style="margin-bottom: 25px; color: #2c6e49; font-weight: 500;">
        One email. Once a month. Everything you need to grow better.
    </p>
     <form action="subscribe.jsp" method="post" class="subscribe-form">
                    <div class="input-wrapper">
                        <input type="email" name="email" placeholder="Your email address" required>
                        <button type="submit">Subscribe</button>
                    </div>
                </form>
    <p style="font-size: 0.8rem; margin-top: 15px; color: #333;">
        We hate spam. Unsubscribe anytime.
    </p>
</div>
    </section>

        <!-- Contact Info -->
        <section class="contact-info">
            <div class="info-item">
                <span class="info-icon">📞</span>
                <span>+977 9812345678</span>
            </div>
            <div class="info-item">
                <span class="info-icon">✉️</span>
                <span>Bagaicha@gmail.com</span>
            </div>
            <div class="info-item">
                <span class="info-icon">📍</span>
                <span>Kathmandu, Nepal</span>
            </div>
        </section>

        <!-- Map Section -->
        <section class="map-container">
            <iframe src="https://maps.google.com/maps?q=kathmandu&t=&z=13&ie=UTF8&iwloc=&output=embed" ></iframe>
        </section>
    </div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>