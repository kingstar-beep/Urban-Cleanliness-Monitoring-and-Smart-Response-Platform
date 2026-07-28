<%-- 
    Document   : add-report
    Created on : May 6, 2026, 6:06:10 PM
    Author     : KINGSTAR
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Report</title>
</head>
<body>

<h2>Add Cleanliness Report</h2>

<form action="add-report" method="post">

    <label>Street ID:</label><br>
    <input type="number" name="street_id" required><br><br>

    <label>Report Type:</label><br>
    <select name="type">
        <option value="litter">Litter</option>
        <option value="fly_tipping">Fly Tipping</option>
        <option value="bin_overflow">Bin Overflow</option>
    </select><br><br>

    <label>Source:</label><br>
    <input type="text" name="source" required><br><br>

    <button type="submit">Submit Report</button>

</form>

</body>
</html>
