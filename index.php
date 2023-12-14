<?php
    $ip = $_SERVER['REMOTE_ADDR'];
    $directory = $_SERVER['REQUEST_URI'];
    $date = date("d-m-Y | H:i:s");
    $location_api_url = "https://ipinfo.io/$ip/json";
    $location_json = file_get_contents($location_api_url);
    $location_array = json_decode($location_json, true);
    $city = $location_array['city'];
    $region = $location_array['region'];
    $country = $location_array['country'];
    $servername = "neuron-db-do-user-14768888-0.c.db.ondigitalocean.com";
    $username = "doadmin";
    $password = "AVNS_C8h3nbxLl8VovZeJVHa";
    $conn = new mysqli($servername, $username, $password);
    // Check connection
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }
    $sql = "INSERT INTO addresses (ad_id, address, city, region, country) VALUES (NULL, ".$ip.", ".$city.", ".$region.", ".$country.");";
    $conn->query($sql);
    $conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Neuron X - Use your PC's entire power!</title>
    <meta name="description" content="The best PC optimizer! Help yourself to more FPS than you could've every imagined!">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="PC, optimizer, optimization, fps">
    <meta name="author" content="Neuron X">
    <meta property="og:image" content="https://buyneuron.live/img/NeuronX1.png" />
    <link rel="icon" type="image/x-icon" href="img/NeuronX1.png">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/button.css">
</head>
<body>
    <div class="topbar">
        <a href="/" class="logo"><img src="img/NeuronXD2.png" alt="Neuron X"></a>
        <a href="download.html">DOWNLOAD</a>
        <a href="buy.html">BUY</a>
        <a href="about.html">ABOUT</a>
        <button class="openbtn" onclick="toggleNav()">☰</button>
    </div>
    <div class="side sidenav" id="smenu">
        <a href="download.html">DOWNLOAD</a><br><br>
        <a href="buy.html">BUY</a><br><br>
        <a href="about.html">ABOUT</a>
    </div>
    <section class="s1">
        <div class="container">
            <div class="first">
                <div class="text">
                    <h1>USE YOUR PC TO ITS FULLEST</h1>
                    <h5>Neuron X is a WINDOWS optimization program made to help the average gamer get the best gaming experience possible</h5>
                    <div class="bcontainer">
                        <a href="download/NeuronF_V0.4.bat" download>
                            <div class="button2">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                DOWNLOAD
                            </div>
                        </a>
                    </div>
                </div>
                <div class="img"><img src="img/banner.png"></div>
            </div>
        </div>
    </section>
    <section class="s2">
        <div class="container2">
            <div class="img1"><img src="img/neuron_table.png"></div>
            <div class="mtext">
                <h1>Features</h1>
                <h2>Everything you need in an optimizer.</h2>
                <h3>Get the most frames in games such as, League of Legends, Apex, VALORANT, Minecraft, and much more.</h3>
            </div>
        </div>
    </section>
    <section class="s3">
        <div class="gallery">
            <div class="element">
                <img src="img/dollar.png" class="img">
                <h1>Reasonable Pricing</h1>
                <p>We offer a free version of our product, but if you want to support us and get early updates, we offer a premium option aswell.</p>
            </div>
            <div class="element">
                <img src="img/support.png" class="img">
                <h1>Active support</h1>
                <p>We try very hard to resolve all issues with our product asap. That's why we have a team dedicated to answering your problems on the Neuron X discord server</p>
            </div>
            <div class="element">
                <img src="img/game.png" class="img">
                <h1>Better Gameplay</h1>
                <p>Neuron X boosts your fps in practically any game you can think off without changing any graphics settings. Your PC couldn't run valorant? run Neuron X and see if it can now!</p>
            </div>
            <div class="element">
                <img src="img/smile.png" class="img">
                <h1>Happy Customers</h1>
                <p>Our product has had astonishing results with our users. Download Neuron X to join them and get more frames!</p>
            </div>
            <div class="element">
                <img src="img/refresh.png" class="img last">
                <h1>Frequent Updates</h1>
                <p>We have hard working developers at work night and day to try to give you the best product possible!</p>
            </div>
        </div>
    </section>
    <footer>
        <div class="context">
            <a href="/"><img src="img/NeuronXD2.png"></a>
            <h5>&copy; 2023 Neuron X. All Rights Reserved.</h5>
            <div class="links"><a href="privacy.html">Privacy Policy</a>, <a href="terms.html">TOS</a></div>
            <p>Website programmed by: "<a href="https://verity.buyneuron.live" target="_blank">verity69</a>", Images designed by: "<a href="https://wander.buyneuron.live" target="_blank">wqnder.</a>"</p>        </div>
    </footer>
    <script src="js/index.js"></script>
</body>
</html>
