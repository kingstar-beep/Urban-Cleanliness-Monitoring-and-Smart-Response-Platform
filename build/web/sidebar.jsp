<%-- 
    Document   : sidebar
    Created on : May 13, 2026, 4:36:36 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html"
        pageEncoding="UTF-8"%>

<style>

    .sidebar{

        position:fixed;

        left:0;

        top:0;

        width:240px;

        height:100%;

        background:#1f2937;

        padding-top:20px;

        overflow:auto;
    }

    .sidebar h2{

        color:white;

        text-align:center;

        margin-bottom:30px;
    }

    .sidebar a{

        display:block;

        color:white;

        padding:15px 20px;

        text-decoration:none;

        transition:0.3s;
    }

    .sidebar a:hover{

        background:#374151;
    }

    .main-content{

        margin-left:250px;

        padding:20px;
    }

</style>

<div class="sidebar">

    <h2>
        UrbanClean
    </h2>

    <a href="admin-dashboard.jsp">
        🏠 Dashboard
    </a>

    <a href="map-dashboard.jsp">
        🗺️ Live Map
    </a>

    <a href="top-dirty-streets.jsp">
        📊 Analytics
    </a>

    <a href="hotspot-analytics.jsp">
        🔥 Hotspots
    </a>

    <a href="trend-prediction.jsp">
        📈 Trends
    </a>

    <a href="risk-alerts.jsp">
        🚨 Risk Alerts
    </a>

    <a href="smart-recommendations.jsp">
        🤖 AI Recommendations
    </a>

    <a href="assign-task.jsp">
        🧹 Assign Cleanup
    </a>

    <a href="cleanup-dashboard.jsp">
        ✅ Cleanup Tasks
    </a>

    <a href="public-tracker.jsp">
        🌍 Public Tracker
    </a>

    <a href="logout">
        🚪 Logout
    </a>

</div>