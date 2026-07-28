<%-- 
    Document   : report-form.jsp
    Created on : May 9, 2026, 6:06:26 AM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Dirt Report</title>
</head>
<body>

<h2>Submit Dirt Report</h2>

<form action="submit-report"
      method="post"
      enctype="multipart/form-data">

    Street ID:
    <input type="number"
           name="streetId">
    <br><br>

    <label>Report Type:</label><br>
    <select name="reportText">
        <option value="litter">Litter</option>
        <option value="fly_tipping">Fly Tipping</option>
        <option value="bin_overflow">Bin Overflow</option>
    </select>

    <br><br>

    Upload Image:
    <input type="file"
           name="image">

    <br><br>

    <button type="submit">
        Submit Report
    </button>

</form>

</body>
</html>
