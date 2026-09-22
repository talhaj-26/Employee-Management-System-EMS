\# Employee Management System (EMS)



A Java-based Employee Management System developed using Jakarta EE, JSP, PostgreSQL, and Maven. The project demonstrates a structured web application for managing employee information with CRUD-oriented operations.



\## Overview



The Employee Management System (EMS) is a web application developed as a Java enterprise project.



The application uses:



\- JSP for the web interface

\- Jakarta Servlet for request handling

\- PostgreSQL for database management

\- JDBC for database connectivity

\- Maven for dependency and build management

\- Apache Tomcat as the application server

\- Jakarta EE 10 for enterprise web development



The project follows a simple layered structure separating the employee model, repository/database operations, servlet/controller logic, and database connection utilities.



\---



\## Features



\- Add employee information

\- View employee details

\- Display employee list

\- Update employee information

\- Delete employee information

\- PostgreSQL database integration

\- JSP-based web interface

\- Servlet-based request processing

\- JDBC database connectivity

\- Maven-based project configuration

\- WAR packaging for deployment



\---



\## Technologies Used



| Technology | Version / Details |

|---|---|

| Java | JDK 17 |

| Jakarta EE | 10.0.0 |

| Jakarta Servlet | Jakarta EE 10 |

| JSP | Jakarta Server Pages |

| JSTL | 3.0.x |

| Apache Tomcat | Servlet/JSP Application Server |

| PostgreSQL | Database |

| PostgreSQL JDBC Driver | 42.7.7 |

| Maven | Build \& Dependency Management |

| NetBeans | Development Environment |

| Packaging | WAR |



\---



\## Project Structure



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

