package controller;

import dao.ReportDAO;
import model.Report;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import service.ScoringService;

@WebServlet("/submit-report")
@MultipartConfig
public class UploadReportServlet
        extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int streetId
                = Integer.parseInt(
                        request.getParameter("streetId"));

        String reportText
                = request.getParameter("reportText");

        Part filePart
                = request.getPart("image");

        String fileName
                = System.currentTimeMillis()
                + "_"
                + filePart.getSubmittedFileName()
                        .replace(" ", "_");

        String uploadPath = "D:/NetBeansProjects/UrbanCleanlinessSystem/web/uploads";
        //    getServletContext()
        //    .getRealPath("")
        //    + File.separator
        //    + "uploads";

        File uploadDir
                = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        InputStream fileContent
                = filePart.getInputStream();

        Files.copy(
                fileContent,
                Paths.get(uploadPath
                        + File.separator
                        + fileName),
                StandardCopyOption.REPLACE_EXISTING
        );

        // filePart.write(
        //        uploadPath
        //        + File.separator
        //        + fileName);
        Report report = new Report();

        report.setStreetId(streetId);
        report.setReportText(reportText);
        report.setImagePath(
                "uploads/" + fileName);

        try {

            ReportDAO dao = new ReportDAO();
            String prediction = "Moderate";

            report.setAiPrediction(
                    prediction);

            boolean saved
                    = dao.addReport(report);

            if (saved) {

                ScoringService service
                        = new ScoringService();

                service.calculateScores();

                response.sendRedirect(
                        "citizen-report.jsp?success=1");

            } else {

                response.sendRedirect(
                        "citizen-report.jsp?error=1");
            }

        } catch (Exception e) {
            response.getWriter().println(
                    e.getMessage()
            );

            e.printStackTrace();
        }

        // response.getWriter().println(
        //         "Report submitted successfully!"
        //  );
    }
}
