<%-- 
    Document   : index
    Created on : May 14, 2026, 1:16:42 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html"
        pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <title>
            Urban Cleanliness Smart City Platform
        </title>

        <style>

            body{

                margin:0;

                font-family:Arial;

                background:#f4f4f4;
            }

            .hero{

                background:
                    linear-gradient(
                    rgba(0,0,0,0.7),
                    rgba(0,0,0,0.7)),

                    url('https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b');

                background-size:cover;

                background-position:center;

                height:100vh;

                color:white;

                display:flex;

                flex-direction:column;

                justify-content:center;

                align-items:center;

                text-align:center;

                padding:20px;
            }

            .hero h1{

                font-size:60px;

                margin-bottom:20px;
            }

            .hero p{

                font-size:22px;

                max-width:900px;

                line-height:1.6;
            }

            .buttons{

                margin-top:30px;
            }

            .buttons a{

                display:inline-block;

                margin:10px;

                padding:15px 30px;

                background:#16a34a;

                color:white;

                text-decoration:none;

                border-radius:8px;

                font-size:18px;

                transition:0.3s;
            }

            .buttons a:hover{

                background:#15803d;
            }

            .features{

                padding:60px 20px;

                background:white;

                text-align:center;
            }

            .feature-grid{

                display:grid;

                grid-template-columns:
                    repeat(auto-fit,
                    minmax(250px,1fr));

                gap:20px;

                margin-top:40px;
            }

            .feature-card{

                background:#f9f9f9;

                padding:30px;

                border-radius:12px;

                box-shadow:0 0 10px
                    rgba(0,0,0,0.1);
            }

            .feature-card h3{

                margin-bottom:15px;
            }

            .footer{

                background:#111827;

                color:white;

                text-align:center;

                padding:20px;
            }

        </style>

    </head>

    <body>

        <div class="hero">

            <h1>
                Urban Cleanliness Intelligence Platform
            </h1>

            <p>

                AI-powered smart-city platform
                for environmental monitoring,
                predictive cleanliness analytics,
                citizen reporting,
                and municipal operational intelligence.

            </p>

            <div class="buttons">

                <a href="login.jsp">
                    Admin Login
                </a>

                <a href="public-tracker.jsp">
                    Public Tracker
                </a>

                <a href="citizen-report.jsp">
                    Submit Report
                </a>

            </div>

        </div>

        <div class="features">

            <h2>
                Platform Features
            </h2>

            <div class="feature-grid">

                <div class="feature-card">

                    <h3>
                        🗺️ GIS Monitoring
                    </h3>

                    <p>
                        Interactive street cleanliness mapping
                        with live status tracking.
                    </p>

                </div>

                <div class="feature-card">

                    <h3>
                        🤖 AI Analytics
                    </h3>

                    <p>
                        Predictive hotspot intelligence
                        and operational risk analysis.
                    </p>

                </div>

                <div class="feature-card">

                    <h3>
                        📊 Executive Dashboard
                    </h3>

                    <p>
                        Real-time municipal performance
                        monitoring and KPI tracking.
                    </p>

                </div>

                <div class="feature-card">

                    <h3>
                        🧹 Cleanup Operations
                    </h3>

                    <p>
                        Task assignment,
                        workflow management,
                        and operational coordination.
                    </p>

                </div>

            </div>

        </div>

        <div class="footer">

            © 2026 Urban Cleanliness Smart City UK

        </div>

    </body>

</html>
