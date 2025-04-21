<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Bagaicha</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        
        .welcome-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        
        header {
            background-color: #4CAF50;
            color: white;
            padding: 40px 0;
            border-radius: 8px 8px 0 0;
            margin-bottom: 30px;
        }
        
        h1 {
            font-size: 3em;
            margin-bottom: 10px;
        }
        
        .tagline {
            font-size: 1.5em;
            margin-bottom: 20px;
            font-style: italic;
        }
        
        .main-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 30px 0;
        }
        
        .feature-box {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin: 15px;
            width: 250px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .feature-box:hover {
            transform: translateY(-5px);
        }
        
        .feature-icon {
            font-size: 3em;
            color: #4CAF50;
            margin-bottom: 15px;
        }
        
        .cta-button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            margin: 20px 0;
            transition: background-color 0.3s;
        }
        
        .cta-button:hover {
            background-color: #45a049;
        }
        
        footer {
            margin-top: 50px;
            padding: 20px;
            background-color: #333;
            color: white;
            border-radius: 0 0 8px 8px;
        }
        
        @media (max-width: 768px) {
            .feature-box {
                width: 100%;
                margin: 15px 0;
            }
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <header>
            <h1>Welcome to Bagaicha</h1>
            <div class="tagline">Your Gateway to Nature's Beauty</div>
        </header>
        
        <div class="main-content">
            <div class="feature-box">
                <div class="feature-icon">🌱</div>
                <h3>Fresh Produce</h3>
                <p>Discover the freshest fruits and vegetables grown with care and sustainable practices.</p>
            </div>
            
            <div class="feature-box">
                <div class="feature-icon">🌸</div>
                <h3>Beautiful Plants</h3>
                <p>Find the perfect plants to brighten your home or garden from our extensive collection.</p>
            </div>
            
            <div class="feature-box">
                <div class="feature-icon">🌿</div>
                <h3>Gardening Supplies</h3>
                <p>Everything you need to nurture your green space, from tools to organic fertilizers.</p>
            </div>
            
            <div class="feature-box">
                <div class="feature-icon">☕</div>
                <h3>Garden Café</h3>
                <p>Relax in our café surrounded by greenery and enjoy fresh, garden-to-table meals.</p>
            </div>
        </div>
        
        <a href="#" class="cta-button">Explore Bagaicha</a>
        
        <footer>
            <p>© 2023 Bagaicha. All rights reserved.</p>
            <p>Contact us: info@bagaicha.com | +123 456 7890</p>
        </footer>
    </div>
</body>
</html>