<%-- 
    Document   : public-map
    Created on : May 12, 2026, 1:54:46 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html"
        pageEncoding="UTF-8"%>

<%@ page import="dao.StreetDAO" %>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="dao.ReportDAO" %>
<%@ page import="dao.CleanupTaskDAO" %>

<%@ page import="model.Street" %>
<%@ page import="model.Score" %>
<%@ page import="model.Report" %>
<%@ page import="model.CleanupTask" %>

<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html>

    <head>

        <title>
            Public Urban Cleanliness Map
        </title>

        <style>

            body{

                margin:0;

                font-family:Arial;

                background:#f4f4f4;
            }

            .topbar{

                background:#111827;

                color:white;

                padding:15px 30px;

                display:flex;

                justify-content:space-between;

                align-items:center;
            }

            .logo{

                font-size:22px;

                font-weight:bold;
            }

            .report-btn{

                background:#16a34a;

                color:white;

                padding:12px 20px;

                border-radius:8px;

                text-decoration:none;

                font-weight:bold;
            }

            .report-btn:hover{

                background:#15803d;
            }

            .hero-section{

                text-align:center;

                padding:40px 20px;
            }

            .hero-section h1{

                margin-bottom:15px;

                color:#111827;
            }

            .hero-section p{

                max-width:800px;

                margin:auto;

                color:gray;

                line-height:1.6;
            }

            .map-card{

                width:90%;

                margin:20px auto;

                background:white;

                padding:20px;

                border-radius:15px;

                box-shadow:0 0 15px
                    rgba(0,0,0,0.1);
            }

            #map{

                width:100%;

                height:75vh;

                border-radius:12px;
            }

            .legend{

                display:flex;

                justify-content:center;

                gap:30px;

                margin:30px;
            }

            .legend div{

                display:flex;

                align-items:center;

                gap:10px;

                font-weight:bold;
            }

            .green-dot,
            .orange-dot,
            .red-dot{

                width:18px;

                height:18px;

                border-radius:50%;

                display:inline-block;
            }

            .green-dot{

                background:green;
            }

            .orange-dot{

                background:orange;
            }

            .red-dot{

                background:red;
            }

            @media(max-width:768px){

                .topbar{

                    flex-direction:column;

                    gap:15px;
                }

                .hero-section h1{

                    font-size:28px;
                }
            }
            .stats-grid{

                display:grid;

                grid-template-columns:
                    repeat(auto-fit,
                    minmax(220px,1fr));

                gap:20px;

                width:90%;

                margin:20px auto;
            }

            .stat-card{

                background:white;

                padding:25px;

                border-radius:15px;

                text-align:center;

                box-shadow:0 0 15px
                    rgba(0,0,0,0.1);
            }

            .stat-card h2{

                font-size:40px;

                margin-bottom:10px;
            }

            .green-card{

                border-top:8px solid green;
            }

            .orange-card{

                border-top:8px solid orange;
            }

            .red-card{

                border-top:8px solid red;
            }

            .floating-report-btn{

                position:fixed;

                bottom:30px;

                right:30px;

                background:#16a34a;

                color:white;

                padding:18px 24px;

                border-radius:50px;

                text-decoration:none;

                font-weight:bold;

                box-shadow:0 0 15px
                    rgba(0,0,0,0.3);

                z-index:999;
            }

            .floating-report-btn:hover{

                background:#15803d;
            }

            .search-container{

                width:90%;

                margin:20px auto;

                display:flex;

                gap:10px;
            }

            .search-container input{

                flex:1;

                padding:14px;

                border-radius:10px;

                border:1px solid #ccc;

                font-size:16px;
            }

            .search-container button{

                padding:14px 20px;

                background:#2563eb;

                color:white;

                border:none;

                border-radius:10px;

                cursor:pointer;

                font-weight:bold;
            }

            .search-container button:hover{

                background:#1d4ed8;
            }

            .critical-dot{

                background:#8b0000;
            }

        </style>

    </head>

    <body>
        <div class="topbar">

            <div class="logo">

                🌍 Urban Cleanliness Platform

            </div>

            <div>

                <a href="citizen-report.jsp"
                   class="report-btn">

                    📸 Submit Report

                </a>

            </div>

        </div>

        <div class="hero-section">

            <%@ page import="dao.ScoreDAO" %>
            <%@ page import="model.Score" %>

            <%

                ScoreDAO scoreDAO
                        = new ScoreDAO();

                List<Score> scores
                        = scoreDAO.getAllScores();

                int cleanCount = 0;
                int moderateCount = 0;
                int dirtyCount = 0;

                for (Score score : scores) {

                    if (score.getStatus()
                            .equalsIgnoreCase(
                                    "Clean")) {

                        cleanCount++;

                    } else if (score.getStatus()
                            .equalsIgnoreCase(
                                    "Moderate")) {

                        moderateCount++;

                    } else if (score.getStatus()
                            .equalsIgnoreCase(
                                    "Dirty")) {

                        dirtyCount++;
                    }
                }

            %>

            <div class="stats-grid">

                <div class="stat-card green-card">

                    <h2>
                        <%= cleanCount%>
                    </h2>

                    <p>
                        Clean Streets
                    </p>

                </div>

                <div class="stat-card orange-card">

                    <h2>
                        <%= moderateCount%>
                    </h2>

                    <p>
                        Moderate Streets
                    </p>

                </div>

                <div class="stat-card red-card">

                    <h2>
                        <%= dirtyCount%>
                    </h2>

                    <p>
                        Dirty Streets
                    </p>

                </div>

            </div>

            <h1>
                Public Environmental Monitoring Map
            </h1>

            <p>

                Track environmental cleanliness,
                view reported hotspots,
                and help improve your community
                through citizen reporting.

            </p>

        </div>

        <div class="map-card">
            <div class="search-container">

                <input type="text"
                       id="streetSearch"
                       placeholder="Search street...">

                <button onclick="searchStreet()">

                    Search

                </button>

            </div>

            <div id="map"></div>

        </div>

        <div class="legend">

            <div>
                <span class="critical-dot"></span>
                Critical
            </div>

            <div>
                <span class="green-dot"></span>
                Clean
            </div>

            <div>
                <span class="orange-dot"></span>
                Moderate
            </div>

            <div>
                <span class="red-dot"></span>
                Dirty
            </div>

        </div>

        <script>
            var map;
            var markers = [];
            function initMap() {


                map =
                        new google.maps.Map(
                                document.getElementById(
                                        'map'),
                                {
                                    zoom: 12,

                                    center: {
                                        lat: 51.5074,
                                        lng: -0.1278
                                    }
                                }
                        );

            <%

                StreetDAO streetDAO
                        = new StreetDAO();

                //  ScoreDAO scoreDAO
                //         = new ScoreDAO();
                ReportDAO reportDAO
                        = new ReportDAO();

                CleanupTaskDAO taskDAO
                        = new CleanupTaskDAO();

                List<Street> streets
                        = streetDAO.getAllStreets();

                // List<Score> scores
                //        = scoreDAO.getAllScores();
                List<Report> reports
                        = reportDAO.getAllReports();

                List<CleanupTask> tasks
                        = taskDAO.getAllTasks();

                for (Street street : streets) {

                    String status = "Clean";

                    String imagePath = "";

                    String aiPrediction
                            = "Moderate";

                    String reportStatus
                            = "Pending";

                    String taskStatus
                            = "No Active Task";

                    for (Score score : scores) {

                        if (score.getStreetId()
                                == street.getId()) {

                            status
                                    = score.getStatus();
                        }
                    }

                    for (Report report : reports) {

                        if (report.getStreetId()
                                == street.getId()) {

                            imagePath
                                    = report.getImagePath();

                            aiPrediction
                                    = report.getAiPrediction();

                            reportStatus
                                    = report.getStatus();
                        }
                    }

                    for (CleanupTask task : tasks) {

                        if (task.getStreetId()
                                == street.getId()) {

                            taskStatus
                                    = task.getTaskStatus();
                        }
                    }

                    String color = "green";

                    if (status.equalsIgnoreCase(
                            "Moderate")) {

                        color = "yellow";

                    } else if (status.equalsIgnoreCase(
                            "Dirty")) {

                        color = "orange";

                    } else if (status.equalsIgnoreCase(
                            "Critical")) {

                        color = "red";
                    }

            %>

                var marker =
                        new google.maps.Marker({

                            position: {
                                lat:<%= street.getLatitude()%>,
                                lng:<%= street.getLongitude()%>
                            },

                            map: map,

                            title: "<%= street.getName()%>",
                            streetName:
                                    "<%= street.getName()%>",

                            icon: {
                                path: google.maps.SymbolPath.CIRCLE,
                                scale: 12,
                                fillColor: "<%= color%>",
                                fillOpacity: 1,
                                strokeWeight: 2,
                                strokeColor: "#000"
                            }

                        });
                markers.push(marker);

                (function (marker) {

                    var infoWindow =
                            new google.maps.InfoWindow({

                                content:
                                        "<div style='width:240px;'>"

                                        + "<h2 style='margin-bottom:10px;'>"

                                        + "<%= street.getName()%>"

                                        + "</h2>"

                                        + "<p><b>Status:</b> <%= status%></p>"

                                        + "<p><b>AI Prediction:</b> <%= aiPrediction%></p>"

                                        + "<p><b>Report Status:</b> <%= reportStatus%></p>"

                                        + "<img src='<%= imagePath%>' "

                                        + "width='220' height='130' "

                                        + "style='border-radius:10px;"
                                        + "margin-top:10px;'/>"

                                        + "</div>"

                            });

                    marker.addListener(
                            'click',
                            function () {

                                infoWindow.open(
                                        map,
                                        marker);
                            });

                })(marker);

            <%
                }
            %>

            }

            function searchStreet() {

                var searchValue =
                        document.getElementById(
                                "streetSearch")
                        .value
                        .toLowerCase();

                for (var i = 0;
                        i < markers.length;
                        i++) {

                    var marker = markers[i];

                    if (marker.streetName
                            .toLowerCase()
                            .includes(searchValue)) {

                        map.setCenter(
                                marker.getPosition());

                        map.setZoom(16);

                        new google.maps.InfoWindow({

                            content:
                                    "<b>"
                                    + marker.streetName
                                    + "</b>"

                        }).open(map, marker);

                        return;
                    }
                }

                alert("Street not found!");
            }

        </script>

        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeW8buA9VvIm8vUVuGLMpZH7IFYsxc4MI&callback=initMap">
        </script>
        <a href="citizen-report.jsp"
           class="floating-report-btn">

            📸 Report Dirt

        </a>
    </body>

</html>
