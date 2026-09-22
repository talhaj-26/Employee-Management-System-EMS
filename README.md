# Employee Management System (EMS)

A Java-based Employee Management System developed using **Jakarta EE, JSP, PostgreSQL, JDBC, and Maven**.
This project demonstrates a structured web application for managing employee information through CRUD operations.

---

## Overview

The **Employee Management System (EMS)** is a Java enterprise web application designed to manage employee records efficiently.

The application uses **JSP** for the user interface, **Jakarta Servlet** for request processing, **JDBC** for database connectivity, and **PostgreSQL** for persistent data storage.

The project follows a simple layered architecture that separates:

* Employee data model
* Repository and database operations
* Servlet/controller logic
* Database connection management
* JSP-based presentation layer

This structure makes the application easier to understand, maintain, and extend.

---

## Features

* Add new employee
* View employee details
* Display employee list
* Update employee information
* Delete employee records
* PostgreSQL database integration
* JSP-based user interface
* Jakarta Servlet request handling
* JDBC database connectivity
* Maven dependency management
* WAR packaging for deployment

---

## Technologies Used

| Technology             | Version / Details             |
| ---------------------- | ----------------------------- |
| Java                   | JDK 17                        |
| Jakarta EE             | 10.0.0                        |
| Jakarta Servlet        | Jakarta EE 10                 |
| JSP                    | Jakarta Server Pages          |
| JSTL                   | 3.0.2                         |
| PostgreSQL             | Database                      |
| PostgreSQL JDBC Driver | 42.7.7                        |
| Maven                  | Build & Dependency Management |
| Apache Tomcat          | Application Server            |
| NetBeans               | Development Environment       |
| Packaging              | WAR                           |

---

## Project Structure

```text
EMS/
│
├── src/
│   └── main/
│       ├── java/
│       │   ├── ems/
│       │   │   ├── DBConnection.java
│       │   │   ├── EmpRepository.java
│       │   │   ├── Empservlet.java
│       │   │   ├── Employee.java
│       │   │   └── JakartaRestConfigaration.java
│       │   │
│       │   └── resources/
│       │       └── JakartaEE10Resource.java
│       │
│       └── webapp/
│           ├── form.jsp
│           ├── index.jsp
│           ├── list.jsp
│           └── view.jsp
│
├── pom.xml
└── README.md
```

---

## Architecture

The application follows a simple layered flow:

```text
JSP Pages
    ↓
Empservlet
    ↓
EmpRepository
    ↓
DBConnection
    ↓
PostgreSQL Database
```

### Main Components

**Employee.java**
Represents the employee entity and stores employee-related data.

**EmpRepository.java**
Handles employee-related database operations such as creating, retrieving, updating, and deleting records.

**Empservlet.java**
Works as the controller layer and processes requests between the JSP pages and repository layer.

**DBConnection.java**
Manages the JDBC connection with the PostgreSQL database.

**JakartaRestConfigaration.java**
Provides the Jakarta REST configuration used by the application.

**JakartaEE10Resource.java**
Contains the Jakarta EE resource configuration.

---

## JSP Pages

| File        | Purpose                                  |
| ----------- | ---------------------------------------- |
| `index.jsp` | Main entry page                          |
| `form.jsp`  | Employee data input form                 |
| `list.jsp`  | Displays employee records                |
| `view.jsp`  | Displays individual employee information |

---

## Database

The application uses **PostgreSQL** as its database and connects through the **PostgreSQL JDBC Driver**.

The database layer is handled through:

```text
DBConnection.java
        ↓
EmpRepository.java
        ↓
PostgreSQL Database
```

The PostgreSQL JDBC Driver version used in the project is:

```text
42.7.7
```

---

## Maven Configuration

The project uses **Maven** for dependency management and WAR packaging.

Main dependencies include:

* Jakarta EE 10.0.0
* JSTL API 3.0.2
* GlassFish JSTL Implementation 3.0.1
* PostgreSQL JDBC Driver 42.7.7

The project is packaged as:

```text
WAR
```

---

## Prerequisites

Before running the project, make sure the following are installed:

* JDK 17
* Apache NetBeans
* Apache Tomcat
* PostgreSQL
* Maven

---

## How to Run

### 1. Clone the Repository

Clone the project from GitHub and open it in NetBeans.

### 2. Configure PostgreSQL

Create the required PostgreSQL database and update the database connection details in:

```text
DBConnection.java
```

### 3. Configure Tomcat

Add Apache Tomcat to NetBeans and configure it as the application server.

### 4. Build the Project

Run:

```bash
mvn clean package
```

This generates the WAR file inside:

```text
target/
```

### 5. Run the Application

Deploy the generated WAR file to Apache Tomcat or run the project directly from NetBeans.

---

## Learning Objectives

This project was developed to practice and understand:

* Java web application development
* Jakarta EE
* Servlet-based request handling
* JSP
* JDBC
* PostgreSQL database integration
* CRUD operations
* Repository pattern
* Maven project management
* WAR-based deployment
* Layered application structure

---

## Future Improvements

Possible improvements for future versions include:

* User authentication and authorization
* Employee search and filtering
* Pagination
* Form validation
* Improved UI/UX
* REST API integration
* Spring Boot migration
* Advanced exception handling
* Better security implementation

---

## Author

**Talha Jubayer**

GitHub: **[@talhaj-26](https://github.com/talhaj-26)**

---

## License

This project is created for **educational and learning purposes**.
