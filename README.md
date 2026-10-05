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
It displays:
•	Streets
•	Coordinates
•	Cleanliness status
•	Colour-coded markers
•	Report information
•	AI prediction information where available
•	Uploaded report images

