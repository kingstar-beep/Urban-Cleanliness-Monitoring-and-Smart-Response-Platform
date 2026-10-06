**Urban Cleanliness Monitoring and Smart Response Platform**
**Purpose of the system**
The system is a web-based urban cleanliness monitoring and response platform developed to allow citizens to report street cleanliness problems and enable council/admin users to monitor reports, assess street cleanliness, assign cleanup tasks and track operational status.
The platform combines:
•	Citizen reporting
•	Street/location management
•	Environmental cleanliness scoring
•	GIS mapping
•	Report/image evidence
•	Analytics
•	Cleanup task management
•	Public transparency
•	Administrative dashboards

**Problem it solves**
The project addresses the difficulty of:
•	Reporting street cleanliness problems
•	Identifying recurring dirty streets
•	Connecting reports to specific streets
•	Visualising environmental conditions geographically
•	Prioritising streets according to report activity
•	Coordinating cleanup activities
•	Tracking cleanup task status
•	Providing public visibility of environmental conditions

**Target users**
Based on the implemented system:
Citizens/Public
Can:
•	Submit cleanliness reports
•	Select streets
•	Provide report information
•	Upload image evidence
•	View the public cleanliness map
**Council/Admin users Can:**
•	View reports
•	Monitor street cleanliness
•	View analytics
•	Resolve reports
•	Assign cleanup tasks
•	Monitor cleanup operations
**Cleanup staff/teams**
The system supports their workflow through assigned cleanup tasks and status updates.
**Supervisory/operational users**
The application contains role-based routing for roles including Admin, Staff and Supervisor, with different dashboards/pages discussed in the project.

**B. Technology Stack**
**Programming languages**
**Java**
Primary backend/application language.
Used for:
•	Servlets
•	DAOs
•	Models
•	Business logic
•	Database operations
•	Authentication
•	Cleanup task processing
**JavaScript Used for:**
•	Google Maps interaction
•	Map markers
•	Search functionality
•	Chart.js dashboards
•	Frontend interactions
**HTML/CSS**
Used extensively in JSP pages for the web interface.
**JSP**
Used for the application's server-side web pages and dashboard interfaces.
**SQL**
Used for MySQL database queries and persistence.

**Framework/platform**
**Java EE / Java Servlet technology**
The application uses:
•	Java Servlets
•	JSP
•	Servlet annotations such as @WebServlet
•	@MultipartConfig

**Frontend technologies**
•	JSP
•	HTML
•	CSS
•	JavaScript
•	Google Maps JavaScript API
•	Chart.js

**Backend technologies**
•	Java EE Servlets
•	Java business/service classes
•	DAO pattern
•	JDBC/database connectivity

**Database**
**MySQL**
The database stores information relating to:
•	Streets
•	Reports
•	Scores
•	Cleanup tasks
•	Users/admin authentication

**Application server**
**GlassFish**
GlassFish was used during development for running the Java EE web application.

**APIs/integrations**
**Google Maps API**
Used for:
•	Public map
•	Administrative map dashboard
•	Street markers
•	Geographic coordinates
•	Status-based marker colours
•	Street search/navigation
**Chart.js**
Used for dashboard visualisations including cleanliness analytics and dirt-report trends.
**Email/JavaMail**
An email alert mechanism using EmailUtil was attempted, but the email functionality encountered the sun.security.ssl.SSLSessionImpl NoSuchMethodError and was not successfully completed.

**Development tools/IDE**
NetBeans IDE was used for the Java EE development work.
**The project also used:**
•	MySQL
•	GlassFish
•	Browser developer/inspection tools
•	Git/GitHub was discussed as part of project development and portfolio preparation.

**C. System Architecture**
The implemented architecture follows a layered Java EE web application structure:
JSP / Web Interface
        ↓
Servlet Controllers
        ↓
Business / Service Layer
        ↓
DAO Layer
        ↓
MySQL Database
**External integration:**
Google Maps API
        ↓
Map-based visualisation

**Main packages/folders**
The project structure discussed in development includes:
controller/
dao/
model/
service/
util/
web/JSP pages

**Controllers/Servlets**
Controllers/Servlets actually include:
**LoginServlet**
Handles login processing and session creation.
**UploadReportServlet**
Handles citizen report submission and image upload.
Endpoint:
/submit-report
with:
@WebServlet("/submit-report")
@MultipartConfig
**UpdateTaskStatusServlet**
Handles cleanup task status updates.
Endpoint:
/update-task-status
**AddReportServlet**
Used during the earlier report-management implementation.
**GetReportsServlet**
Used for retrieving reports in the earlier report module.
/add-street
**Used for street creation**
/streets
**Used for retrieving streets**
/calculate-scores
Used for invoking the score calculation process.
/scores
Used for score retrieval.

**Services**
ScoringService
This is one of the key business-logic classes.
It:
1.	Retrieves reports grouped by street_id.
2.	Counts reports for each street.
3.	Uses the report count as the final score.
4.	Determines the cleanliness status.
5.	Saves or updates the score through ScoreDAO.

**DAOs**
The following DAO classes were actually used/discussed:
**StreetDAO**
Handles street database operations.
**ReportDAO**
Handles report database operations.
**ScoreDAO**
Handles cleanliness score operations.
**CleanupTaskDAO**
Handles cleanup task operations.
**AdminDAO**
Handles administrator login.
**UserDAO**
Used in the role-based login implementation.

**Models/Entities**
The following model classes were discussed:
•	Street
•	Report
•	Score
•	CleanupTask
•	Admin
•	User

**Utilities**
**DBConnection
**Used to establish database connections.
**EmailUtil**
Used/attempted for email alert functionality, although the email functionality was not successfully completed.

**D. Main Modules**
**1. Street Management**
Implemented.
The Street module supports storing street information including:
•	Street name
•	City
•	Latitude
•	Longitude
The database was subsequently populated with 200+ streets and coordinates.
The street information is used by the citizen reporting system and GIS maps.

**2. Report Management**
Implemented.
Citizens can submit:
•	Street
•	Report information/text
•	Image evidence
Reports are linked to streets through street_id.
The report module also supports report status, including:
•	Pending
•	Resolved

**3. Scoring Engine**
ScoringService calculates street cleanliness based on the number of reports associated with each street.
The score is stored through ScoreDAO.

**4. Map Dashboard**
Implemented.
map-dashboard.jsp provides a Google Maps-based administrative map.
**It displays:**
•	Streets
•	Coordinates
•	Cleanliness status
•	Colour-coded markers
•	Report information
•	AI prediction information where available
•	Uploaded report images

**5. Public Map**
Implemented and subsequently enhanced.
public-map.jsp provides:
•	Public street map
•	Cleanliness markers
•	Street search
•	Report button
•	Status legend
•	Public environmental visibility
•	Report information in marker popups
The map was specifically updated to support searching the 200+ populated streets.

**6. Admin Dashboard**
**Implemented.**
admin-dashboard.jsp includes:
•	Total streets
•	Total reports
•	Clean streets
•	Moderate streets
•	Dirty streets
•	Priority information
•	Cleanliness analytics
•	Dirt Report Trends
•	Recent dirt reports
•	Report resolution functionality
The dashboard is protected by session authentication.

**7. Dirt Report Trends**
Implemented.
The admin dashboard contains a Chart.js line chart showing report trends using daily report counts/dates obtained through:
ReportDAO.getDailyReportCounts()
ReportDAO.getDailyReportDates()

**8. Recurring Dirty Hotspots**
Implemented.
The hotspot analytics page provides a table containing:
Street
Total Reports
Risk Level
This identifies streets receiving repeated reports.

**9. Cleanup Task Management**
Implemented.
The system supports:
•	Assigning cleanup tasks
•	Assigning a team
•	Pending status
•	In Progress status
•	Completed status
•	Assigned date
•	Completed date
The cleanup dashboard allows operational staff to update task status.

**10. Report Resolution**
Implemented.
When a cleanup task is completed, the system was designed/updated to resolve the related reports for that street so the operational workflow can reflect that the reported issue has been addressed.

**11. PDF Reporting**
Implemented.

**E. Database**
The main database entities/tables are:
**streets**
Known fields:
id
name
city
latitude
longitude
Relationship:
streets.id
      ↓
reports.street_id
scores.street_id
cleanup_tasks.street_id

**reports**
Known/discussed information includes:
id
street_id
type
source
report text
image path
AI prediction
status

**scores**
The score entity contains information represented by:
street_id
complaint_count
final_score
status
The score is associated with a street.

**cleanup_tasks**
Known fields represented in the application include:
id
street_id
assigned_team
task_status
assigned_date
completed_date
The street_id links the cleanup task to the relevant street.

**Users/Admin**
Authentication also uses:
Admin
User
with AdminDAO and UserDAO.

**F. Business Logic**
The original implemented scoring model was:
Number of reports = final score
The thresholds were:
Report count / Score	Status
0–2	Clean
3–5	Moderate
6+	Dirty
The relevant logic was:
if (finalScore <= 2) {
    status = "Clean";
} else if (finalScore <= 5) {
    status = "Moderate";
} else {
    status = "Dirty";
}

**G. Google Maps Integration**
Google Maps is one of the strongest demonstrable parts of the project.
The system uses the Google Maps JavaScript API to create interactive maps.
Each street is represented using its stored:
latitude
longitude

**Markers**
A Google Maps marker is created for each street.
The marker contains:
•	Street position
•	Street name
•	Cleanliness status
•	Marker colour
The marker colour is based on status:
Status	Marker
Clean	Green
Moderate	Yellow
Dirty	Red

**Marker information**
Clicking a marker displays an information window containing information such as:
•	Street name
•	Status
•	AI prediction information where available
•	Report status
•	Uploaded report image

**Street search**
The public map was enhanced with a search box.
Users can search for a street, and the system:
1.	Searches the loaded street markers.
2.	Matches the street name.
3.	Centres the map on the street.
4.	Zooms in.
5.	Opens an information window.

**H. Reporting and Evidence**
Citizen report submission
The citizen-report.jsp page is connected to the street database.
The user selects a street from the available street records.
The street options are populated using database information, including the street name and coordinates.
A submitted report can contain:
•	Selected street
•	Report description/text
•	Image evidence

**Image upload**
The application uses UploadReportServlet with:
@MultipartConfig
Uploaded images are stored and their paths are recorded with the report.
The image can subsequently be displayed:
•	In map information windows
•	In the admin dashboard
•	In report-related views
We specifically encountered and resolved an image-upload path problem involving a FileNotFoundException.

**I. Alerts**
Email alerts: Email notification functionality was explored through JavaMail but remains a known limitation due to an unresolved SSL/library compatibility issue.

**J. Security and Authentication**
The following security/authentication features were actually implemented:
Admin authentication
LoginServlet handles authentication using:
AdminDAO
UserDAO

**HTTP session management**
Successful login creates session attributes including:
admin
user
role

**Role-based routing**
The login implementation includes role-based handling for:
•	Admin
•	Staff
•	Supervisor
•	Other/public user
Different roles are redirected to appropriate dashboards/pages.

**Admin dashboard protection**
Implemented session checks such as:
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp");
    return;
}
This prevents unauthenticated users from directly accessing protected administrative pages.

**K. Problems Encountered and Solutions**

**HTTP 404**
Encountered during report submission.
The issue was traced to servlet/page routing and the /submit-report endpoint.
The servlet was confirmed with:
@WebServlet("/submit-report")
The report submission was subsequently confirmed working with:
"Report saved to database successfully!"

**HTTP 405**
Encountered during the application development.
This was related to incorrect HTTP method/servlet routing.
The affected servlet workflow was corrected.

**HTTP 500**
Multiple 500 errors were encountered while developing the application.
They included:
•	Database/report processing problems
•	Task assignment problems
•	Email/SSL compatibility
•	Java runtime/library compatibility

**NumberFormatException**
During cleanup task assignment, the system initially produced:
java.lang.NumberFormatException
including an issue where the submitted value contained:
<option value=""
The form/option handling was corrected and cleanup task assignment subsequently worked.
The system successfully displayed:
Cleanup task assigned successfully!

**Image upload FileNotFoundException**
An uploaded image could not initially be written to the expected path.
The upload path handling was corrected.
Image uploads subsequently worked and images appeared in map popups/admin views.

**Incorrect street name in marker popup**
The map initially displayed the wrong street information.
The marker/report lookup logic was corrected so that the popup uses the correct street associated with the marker.

**AI Prediction null/unknown values**
The map initially displayed:
•	Unknown
•	null
for some AI prediction fields.
The system was adjusted to handle missing prediction values more gracefully.

Blank public map
When the street-search functionality was first introduced, the public map stopped displaying.
The cause was JavaScript syntax/variable placement.
Specifically, markers.push(marker) had accidentally been inserted inside the new google.maps.Marker({...}) object.
The map/global map variable also needed correction.
After correcting these issues:
✅ Map loaded
✅ Markers appeared
✅ Search worked

**LoginServlet redline/role issue**
During role-based login development, the code initially referenced user without correctly establishing the User object.
This was identified and corrected during the authentication work.

**Email SSL error**
The application repeatedly produced:
java.lang.NoSuchMethodError:
sun.security.ssl.SSLSessionImpl.<init>(...)
This was traced to Java/SSL/library compatibility around the email implementation.
The email functionality was therefore not treated as completed.

**L. Testing**
The project was tested extensively during development through:

**Browser testing**
Testing was performed across:
•	Chrome
•	Firefox
•	Microsoft Edge
This was particularly relevant to the citizen reporting/public map workflows and JavaScript behaviour.

**Functional testing**
The following workflows were tested:
**Street management** Street information successfully persisted in MySQL.

**Report submission** Successfully reached:
Report saved to database successfully!

**Image upload** Successfully uploaded and displayed images.

**Google Maps** Successfully displayed street markers.

**Street search** Successfully searched the populated street database and navigated to the matching map marker.

**Admin dashboard** Successfully displayed analytics and report information.

**Cleanup task assignment** Successfully created cleanup tasks.

**Cleanup task status** Successfully supported:
Pending
In Progress
Completed

**Authentication** Admin login and session protection were tested successfully.

**PDF report** The Urban Cleanliness Report PDF was confirmed working.

**M. Current Status**
Completed features

•	Street management
•	Street database with 200+ populated streets
•	Latitude/longitude storage
•	Citizen report submission
•	Report database persistence
•	Image upload
•	Report image display
•	Cleanliness scoring
•	Clean / Moderate / Dirty classification
•	Google Maps integration
•	Administrative map
•	Public map
•	Street search on public map
•	Map markers
•	Marker information windows
•	Admin dashboard
•	Cleanliness analytics
•	Dirt Report Trends
•	Recurring Dirty Hotspots
•	Cleanup task assignment
•	Cleanup task status management
•	Report resolution workflow
•	Admin login
•	Session protection
•	Role-based login routing
•	PDF reporting
•	Sidebar/navigation improvements


**Working features**
The following were explicitly confirmed working during our development:
•	Public map
•	Google Maps markers
•	Street search
•	Citizen reporting
•	Image upload
•	Admin dashboard
•	Cleanup dashboard
•	Cleanup task assignment
•	Cleanup status updates
•	Login/session protection
•	PDF report

**Features still being improved**
**Email notification** Attempted but not successfully completed because of the SSL/library compatibility error.
**AI prediction** The application contains and displays an aiPrediction value associated with reports.
**Critical classification** Implemented

**N. My Contribution**
My personal contribution to this project includes substantial hands-on development across the full application.
•	Java EE web application development
•	JSP interfaces
•	Java Servlets
•	MySQL database integration
•	Street management
•	Report management
•	Image upload
•	Cleanliness scoring
•	Google Maps integration
•	Map marker visualisation
•	Public map
•	Street search
•	Admin dashboard
•	Analytics
•	Hotspot analysis
•	Cleanup task management
•	Task status workflow
•	Report resolution
•	Authentication
•	Session protection
•	Role-based routing
•	PDF reporting
•	UI improvements
•	Debugging and browser testing

**O. Demonstrable Skills**
This project demonstrates the following skills:

**Software Engineering**
•	Java EE development
•	MVC-style/layered application design
•	Servlet development
•	JSP development
•	DAO pattern
•	Separation of models, controllers, services and persistence

**Backend Development**
•	Java
•	JDBC
•	MySQL
•	Database CRUD operations
•	Business logic implementation
•	Session management

**Frontend Development**
•	HTML
•	CSS
•	JavaScript
•	JSP
•	Responsive dashboard layouts
•	Interactive interfaces

**GIS**
•	Google Maps API
•	Latitude/longitude data
•	Geospatial marker visualisation
•	Interactive map information windows
•	Street search

**Data/Analytics**
•	Report aggregation
•	Cleanliness scoring
•	Status classification
•	Trend analysis
•	Hotspot identification
•	Chart.js visualisation

**File Handling**
•	Multipart file uploads
•	Image storage
•	Image retrieval/display
•	PDF reporting

**Debugging**
You demonstrated practical debugging of:
•	HTTP 404
•	HTTP 405
•	HTTP 500
•	NumberFormatException
•	FileNotFoundException
•	JavaScript errors
•	Java/SSL library compatibility issues
•	Database/report persistence issues

**Security**
•	Authentication
•	HTTP sessions
•	Role-based routing
•	Protected administrative pages

**Stakeholder/Systems Thinking**
The project also demonstrates the ability to move beyond coding into:
•	Requirements thinking
•	Operational workflow design
•	Council stakeholder engagement
•	Technical proposal writing
•	System architecture documentation
•	Prototype demonstration
•	Academic/technical review

**P. Portfolio Evidence**

1. Citizen Reporting Page
   •	Street selection
   •	Report form
   •	Image upload
2. 

