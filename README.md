# QuizApp - Java JDBC & Servlet Quiz Web Application

This project is a complete Java Web Application demonstrating:
- Database connectivity and persistence using **JDBC** (`PreparedStatement`, `ResultSet`, connection lifecycle).
- Dynamic server-side rendering using **JSP** and **JSTL**.
- MVC Controller architecture using **Jakarta Servlets**.
- Complete assessment dataset populated with the **Java Packages MCQ Bank** (25 questions).

## Quick Start Instructions

### 1. Database Setup
1. Open your MySQL Workbench or command line client.
2. Execute the included SQL file:
   ```bash
   mysql -u root -p < schema_and_data.sql
   ```
3. Update `src/main/java/com/quiz/util/DBConnection.java` with your MySQL root password if different from `password`.

### 2. Build the Application
Ensure Maven 3.x and JDK 17+ are installed. In the root directory:
```bash
mvn clean package
```
This generates the deployable artifact `target/quizapp.war`.

### 3. Deploy and Run
- Copy `target/quizapp.war` into the `webapps/` folder of your Apache Tomcat 10+ server.
- Start Tomcat:
  - Linux/macOS: `./bin/startup.sh`
  - Windows: `bin\startup.bat`
- Navigate to:
  `http://localhost:8080/quizapp/quiz`
