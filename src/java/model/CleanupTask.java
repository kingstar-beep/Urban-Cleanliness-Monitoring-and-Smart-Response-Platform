package model;

public class CleanupTask {

    private int id;

    private int streetId;

    private String assignedTeam;

    private String taskStatus;

    private String assignedDate;

    private String completedDate;

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

    public String getAssignedTeam() {
        return assignedTeam;
    }

    public void setAssignedTeam(
            String assignedTeam) {

        this.assignedTeam =
                assignedTeam;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(
            String taskStatus) {

        this.taskStatus =
                taskStatus;
    }

    public String getAssignedDate() {
        return assignedDate;
    }

    public void setAssignedDate(
            String assignedDate) {

        this.assignedDate =
                assignedDate;
    }

    public String getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(
            String completedDate) {

        this.completedDate =
                completedDate;
    }
}