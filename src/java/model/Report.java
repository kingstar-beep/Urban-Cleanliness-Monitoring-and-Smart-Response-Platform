package model;

import java.sql.Timestamp;

public class Report {

    private int id;
    private int streetId;
    private String type;
    private String source;
    private Timestamp createdAt;
    private String imagePath;
    private String reportText;
    private String status;
    private String aiPrediction;

    public Report() {
    }

    public Report(int streetId, String type, String source) {
        this.streetId = streetId;
        this.type = type;
        this.source = source;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStreetId() {
        return streetId;
    }

    public void setStreetId(int streetId) {
        this.streetId = streetId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getReportText() {
        return reportText;
    }

    public void setReportText(String reportText) {
        this.reportText = reportText;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAiPrediction() {
        return aiPrediction;
    }

    public void setAiPrediction(
            String aiPrediction) {

        this.aiPrediction = aiPrediction;
    }
}
