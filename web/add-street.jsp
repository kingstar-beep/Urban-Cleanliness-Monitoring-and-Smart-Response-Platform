<%-- 
    Document   : add-street
    Created on : May 6, 2026, 5:56:08 PM
    Author     : KINGSTAR
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Street</title>
</head>
<body>

    <h2>Add Street</h2>

    <form action="add-street" method="post">

        <label>Street Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>City:</label><br>
        <input type="text" name="city" required><br><br>

        <label>Latitude:</label><br>
        <input type="text" name="latitude" required><br><br>

        <label>Longitude:</label><br>
        <input type="text" name="longitude" required><br><br>

        <button type="submit">Add Street</button>

    </form>

</body>
</html>