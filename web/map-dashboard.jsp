<%-- 
    Document   : map-dashboard
    Created on : May 7, 2026, 7:07:58 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="dao.StreetDAO" %>
<%@ page import="model.Score" %>
<%@ page import="model.Street" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ReportDAO" %>
<%@ page import="model.Report" %>

<!DOCTYPE html>
<html>
    <head>

        <title>Urban Cleanliness Map Dashboard</title>

        <style>

            #map{
                height: 90vh;
                width: 100%;
            }

        </style>

    </head>
    <body>
        <%            if (session.getAttribute(
                    "admin") == null) {

                response.sendRedirect(
                        "login.jsp");

                return;
            }

        %>
        <jsp:include page="sidebar.jsp"/>

<div class="main-content">

        <h2>Urban Cleanliness Map Dashboard</h2>

        <div id="map"></div>

        <script>

            function initMap() {

                var heatmapData = [];

                var map = new google.maps.Map(
                        document.getElementById('map'),
                        {
                            zoom: 12,
                            center: {
                                lat: 51.5074,
                                lng: -0.1278
                            }
                        }
                );

            <%

                StreetDAO streetDAO = new StreetDAO();
                ScoreDAO scoreDAO = new ScoreDAO();

                ReportDAO reportDAO
                        = new ReportDAO();

                List<Report> reports
                        = reportDAO.getAllReports();

                List<Street> streets
                        = streetDAO.getAllStreets();

                List<Score> scores
                        = scoreDAO.getAllScores();

                for (Street street : streets) {

                    String status = "Clean";

                    String imagePath = "";

                    String aiPrediction = "Unknown";

                    for (Score score : scores) {

                        if (score.getStreetId()
                                == street.getId()) {

                            status = score.getStatus();
                        }
                    }

                    for (Report report : reports) {

                        if (report.getStreetId()
                                == street.getId()) {

                            imagePath
                                    = report.getImagePath();

                            if (report.getAiPrediction() != null) {

                                aiPrediction
                                        = report.getAiPrediction();

                            } else {

                                aiPrediction
                                        = status;
                            }
                        }
                    }

                    String color = "green";

                    if (status.equalsIgnoreCase("Moderate")) {
                        color = "yellow";
                    } else if (status.equalsIgnoreCase("Dirty")) {
                        color = "red";
                    }

            %>

                var marker = new google.maps.Marker({

                    position: {
                        lat: <%= street.getLatitude()%>,
                        lng: <%= street.getLongitude()%>
                    },

                    map: map,

                    title: "<%= street.getName()%>",

                    icon: {
                        path: google.maps.SymbolPath.CIRCLE,
                        scale: 12,
                        fillColor: "<%= color%>",
                        fillOpacity: 1,
                        strokeWeight: 2,
                        strokeColor: "#000"
                    }

                });
                heatmapData.push(
                        new google.maps.LatLng(
            <%= street.getLatitude()%>,
            <%= street.getLongitude()%>
                        )

                        );

                (function (marker) {

                    var infoWindow = new google.maps.InfoWindow({

                        content:
                                "<div style='width:220px;'>"

                                + "<h3><%= street.getName()%></h3>"

                                + "<p>Status: <%= status%></p>"

                                + "<p>AI Prediction: <%= aiPrediction%></p>"

                                + "<img src='<%= imagePath%>' "

                                + "width='200' height='120' "

                                + "style='border-radius:8px;'/>"

                                + "</div>"

                    });

                    marker.addListener('click', function () {

                        infoWindow.open(map, marker);

                    });

                })(marker);

            <%
                }
            %>
                var heatmap = new google.maps.visualization.HeatmapLayer({

                    data: heatmapData

                });

                heatmap.setMap(map);

            }

        </script>

        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeW8buA9VvIm8vUVuGLMpZH7IFYsxc4MI&libraries=visualization&callback=initMap">
        </script>
</div>
    </body>
</html>