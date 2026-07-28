package controller;

import dao.ReportDAO;
import dao.ScoreDAO;
import dao.StreetDAO;

import model.Report;
import model.Score;
import model.Street;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/export-pdf")
public class ExportPDFServlet
extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType(
                "application/pdf");

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=urban_report.pdf");

        try{

            Document document =
                    new Document();

            PdfWriter.getInstance(
                    document,
                    response.getOutputStream());

            document.open();

            Font titleFont =
                    new Font(
                            Font.FontFamily.HELVETICA,
                            20,
                            Font.BOLD);

            Paragraph title =
                    new Paragraph(
                    "Urban Cleanliness Report UK",
                    titleFont);

            title.setAlignment(
                    Element.ALIGN_CENTER);

            document.add(title);

            document.add(
                    new Paragraph(" "));

            StreetDAO streetDAO =
                    new StreetDAO();

            ScoreDAO scoreDAO =
                    new ScoreDAO();

            List<Street> streets =
                    streetDAO.getAllStreets();

            List<Score> scores =
                    scoreDAO.getAllScores();

            PdfPTable table =
                    new PdfPTable(3);

            table.setWidthPercentage(100);

            table.addCell("Street");
            table.addCell("Status");
            table.addCell("Score");

            for(Street street : streets){

                String status = "Clean";

                int finalScore = 0;

                for(Score score : scores){

                    if(score.getStreetId()
                            == street.getId()){

                        status =
                                score.getStatus();

                        finalScore =
                                score.getFinalScore();
                    }
                }

                table.addCell(
                        street.getName());

                table.addCell(status);

                table.addCell(
                        String.valueOf(
                                finalScore));
            }

            document.add(table);

            document.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}