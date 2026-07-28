<%-- 
    Document   : citizen-report
    Created on : May 12, 2026, 8:35:57 AM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="dao.StreetDAO" %>
<%@ page import="model.Street" %>
<%@ page import="java.util.List" %>


<html>

    <head>

        <title>
            Report Dirty Street
        </title>

        <style>

            body{

                font-family:Arial;

                background:#f4f4f4;

                padding:30px;
            }

            .container{

                width:500px;

                margin:auto;

                background:white;

                padding:30px;

                border-radius:12px;

                box-shadow:0 0 10px rgba(0,0,0,0.2);
            }

            input, textarea, select{

                width:100%;

                padding:12px;

                margin-top:10px;

                border-radius:6px;

                border:1px solid #ccc;
            }

            button{

                width:100%;

                padding:12px;

                margin-top:20px;

                background:#28a745;

                color:white;

                border:none;

                border-radius:6px;

                cursor:pointer;
            }

        </style>

        <style>

            body{

                margin:0;

                font-family:Arial;

                background:#f4f4f4;
            }

            .container{

                width:90%;

                max-width:650px;

                margin:40px auto;

                background:white;

                padding:40px;

                border-radius:15px;

                box-shadow:0 0 20px
                    rgba(0,0,0,0.1);
            }

            h1{

                text-align:center;

                margin-bottom:10px;

                color:#111827;
            }

            .subtitle{

                text-align:center;

                color:gray;

                margin-bottom:30px;
            }

            .form-group{

                margin-bottom:20px;
            }

            label{

                display:block;

                margin-bottom:8px;

                font-weight:bold;
            }

            select,
            textarea,
            input[type=file]{

                width:100%;

                padding:14px;

                border:1px solid #ccc;

                border-radius:10px;

                font-size:16px;
            }

            textarea{

                height:120px;

                resize:none;
            }

            button{

                width:100%;

                padding:16px;

                background:#16a34a;

                color:white;

                border:none;

                border-radius:10px;

                font-size:18px;

                cursor:pointer;

                transition:0.3s;
            }

            button:hover{

                background:#15803d;
            }

            .preview-container{

                text-align:center;

                margin-top:20px;

                margin-bottom:20px;
            }

            #preview{

                width:250px;

                border-radius:12px;

                box-shadow:0 0 10px
                    rgba(0,0,0,0.2);
            }

            @media(max-width:768px){

                .container{

                    padding:20px;
                }

                h1{

                    font-size:28px;
                }
            }

            .success-message{

                background:#dcfce7;

                color:#166534;

                padding:15px;

                border-radius:10px;

                margin-bottom:20px;

                text-align:center;

                font-weight:bold;
            }

            .error-message{

                background:#fee2e2;

                color:#991b1b;

                padding:15px;

                border-radius:10px;

                margin-bottom:20px;

                text-align:center;

                font-weight:bold;
            }

            .location-btn{

                width:100%;

                padding:14px;

                margin-bottom:15px;

                background:#2563eb;

                color:white;

                border:none;

                border-radius:10px;

                font-size:16px;

                cursor:pointer;
            }

            .location-btn:hover{

                background:#1d4ed8;
            }
        </style>

    </head>

    <body>

        <div class="container">
            <a href="public-map.jsp">View Public Map</a>
            <h1>
                🌍 Citizen Environmental Reporting
            </h1>
            <%

                String success
                        = request.getParameter(
                                "success");

                String error
                        = request.getParameter(
                                "error");

                if (success != null) {
            %>

            <div class="success-message">

                ✅ Report submitted successfully.

                Your local council has been notified.

            </div>

            <%
                }

                if (error != null) {
            %>

            <div class="error-message">

                ❌ Failed to submit report.

                Please try again.

            </div>

            <%
                }
            %>
            <p class="subtitle">

                Help your local council maintain
                a cleaner and healthier environment.

            </p>

            <form
                action="submit-report"
                method="post"
                enctype="multipart/form-data">

                <div class="form-group">

                    <label>
                        Select Street
                    </label>
                    <button
                        type="button"
                        onclick="detectLocation()"
                        class="location-btn">

                        📍 Use My Current Location

                    </button>
                    <select name="streetId" required>

                        <option value="">
                            Choose Street
                        </option>

                        <%
                            StreetDAO dao
                                    = new StreetDAO();

                            List<Street> streets
                                    = dao.getAllStreets();

                            for (Street street : streets) {

                        %>

                        <option
                            value="<%= street.getId()%>"

                            data-lat="<%= street.getLatitude()%>"

                            data-lng="<%= street.getLongitude()%>">

                            <%= street.getName()%>

                        </option>

                        <%
                            }
                        %>

                    </select>

                </div>

                <div class="form-group">

                    <label>
                        Describe Environmental Issue
                    </label>

                    <textarea
                        name="reportText"
                        placeholder=
                        "Describe the issue..."
                        required>
                    </textarea>

                </div>

                <div class="form-group">

                    <label>
                        Upload Evidence Image
                    </label>

                    <input
                        type="file"
                        name="image"
                        accept="image/*"
                        onchange="previewImage(event)"
                        required/>

                </div>

                <div class="preview-container">

                    <img
                        id="preview"
                        src=""
                        style="display:none;"/>

                </div>

                <button type="submit">

                    Submit Report

                </button>

            </form>

        </div>

        <script>

            function previewImage(event) {

                const preview =
                        document.getElementById(
                                'preview');

                preview.src =
                        URL.createObjectURL(
                                event.target.files[0]);

                preview.style.display =
                        'block';
            }

        </script>
        <script>

            function detectLocation() {

                if (navigator.geolocation) {

                    navigator.geolocation.getCurrentPosition(
                            function (position) {

                                const userLat =
                                        position.coords.latitude;

                                const userLng =
                                        position.coords.longitude;

                                const select =
                                        document.getElementById(
                                                "streetSelect");

                                let closestOption = null;

                                let shortestDistance =
                                        Number.MAX_VALUE;

                                for (let i = 0;
                                        i < select.options.length;
                                        i++) {

                                    const option =
                                            select.options[i];

                                    const latAttr =
                                            option.getAttribute(
                                                    "data-lat");

                                    const lngAttr =
                                            option.getAttribute(
                                                    "data-lng");

                                    if (!latAttr || !lngAttr) {

                                        continue;
                                    }

                                    const streetLat =
                                            parseFloat(latAttr);

                                    const streetLng =
                                            parseFloat(lngAttr);

                                    const distance =
                                            Math.sqrt(
                                                    Math.pow(
                                                            userLat - streetLat,
                                                            2)

                                                    +
                                                    Math.pow(
                                                            userLng - streetLng,
                                                            2)
                                                    );

                                    if (distance
                                            <
                                            shortestDistance) {

                                        shortestDistance =
                                                distance;

                                        closestOption =
                                                option;
                                    }
                                }

                                if (closestOption) {

                                    select.value =
                                            closestOption.value;

                                    alert(
                                            "Nearest street selected: "
                                            + closestOption.text
                                            );
                                }

                            },
                            function () {

                                alert(
                                        "Unable to detect location.");
                            });

                } else {

                    alert(
                            "Geolocation not supported.");
                }
            }

        </script>
    </body>
</html>