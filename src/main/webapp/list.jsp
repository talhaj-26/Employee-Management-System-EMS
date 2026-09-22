<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee List - EMS</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            :root {
                --primary: #6c5ce7;
                --secondary: #a29bfe;
                --accent: #fd79a8;
                --dark: #2d3436;
                --light: #f5f6fa;
                --glass-bg: rgba(255, 255, 255, 0.1);
                --glass-border: rgba(255, 255, 255, 0.2);
            }

            * {
                font-family: 'Poppins', sans-serif;
            }

            body {
                background: linear-gradient(135deg, #1e1e2f, #2d3436);
                color: #fff;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .navbar {
                background: rgba(20, 20, 30, 0.8) !important;
                backdrop-filter: blur(10px);
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }

            .navbar-brand {
                font-weight: 700;
                font-size: 1.6rem;
                color: var(--secondary) !important;
                letter-spacing: 1px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .navbar-brand i {
                font-size: 2rem;
                color: var(--accent);
            }

            .navbar-nav .nav-link {
                color: #dfe6e9 !important;
                font-weight: 500;
                transition: all 0.3s;
                margin: 0 10px;
                position: relative;
            }

            .navbar-nav .nav-link::after {
                content: '';
                position: absolute;
                bottom: -5px;
                left: 50%;
                transform: translateX(-50%);
                width: 0;
                height: 2px;
                background: var(--accent);
                transition: width 0.3s;
            }

            .navbar-nav .nav-link:hover::after,
            .navbar-nav .nav-link.active::after {
                width: 100%;
            }

            .container-main {
                flex: 1;
                padding: 40px 15px;
            }

            .table-card {
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(12px);
                border: 1px solid var(--glass-border);
                border-radius: 20px;
                padding: 20px;
                box-shadow: 0 8px 32px rgba(0,0,0,0.2);
                animation: fadeInUp 0.6s;
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .table {
                --bs-table-bg: transparent;
                --bs-table-color: #fff;
                --bs-table-border-color: rgba(255,255,255,0.1);
                margin-bottom: 0;
            }

            .table thead th {
                background: rgba(108, 92, 231, 0.5);
                border-bottom: none;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .table tbody tr {
                transition: all 0.3s;
            }

            .table tbody tr:hover {
                background: rgba(255,255,255,0.05);
                transform: scale(1.005);
            }

            .btn-action {
                border-radius: 50%;
                width: 35px;
                height: 35px;
                padding: 0;
                line-height: 35px;
                text-align: center;
                transition: all 0.3s;
            }

            .btn-action:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            }

            .badge-active {
                background: linear-gradient(45deg, #00b894, #55efc4);
                color: #fff;
                padding: 8px 15px;
                border-radius: 50px;
                font-weight: 500;
            }

            .badge-inactive {
                background: linear-gradient(45deg, #d63031, #ff7675);
                color: #fff;
                padding: 8px 15px;
                border-radius: 50px;
                font-weight: 500;
            }

            .footer {
                background: rgba(20, 20, 30, 0.8);
                backdrop-filter: blur(10px);
                padding: 20px 0;
                text-align: center;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
            }

            .footer a {
                color: #a29bfe;
                text-decoration: none;
                transition: color 0.3s;
            }

            .footer a:hover {
                color: #fd79a8;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <i class="bi bi-people-fill"></i> EMS
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="EmpServlet?action=list">Employee List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="EmpServlet?action=new">Add Employee</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container container-main">
            <div class="table-card">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="mb-0"><i class="bi bi-list-ul me-2"></i>Employee List</h2>
                    <a href="EmpServlet?action=new" class="btn btn-success rounded-pill px-4">
                        <i class="bi bi-plus-lg"></i> Add New
                    </a>
                </div>

                <c:if test="${empty employees}">
                    <div class="alert alert-info">
                        No employees found. <a href="EmpServlet?action=new" class="alert-link">Add one now</a>.
                    </div>
                </c:if>

                <c:if test="${not empty employees}">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Gender</th>
                                    <th>Department</th>
                                    <th>Status</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="emp" items="${employees}">
                                    <tr>
                                        <td>${emp.id}</td>
                                        <td>${emp.name}</td>
                                        <td>${emp.email}</td>
                                        <td>${emp.gender}</td>
                                        <td>${emp.department}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${emp.active}">
                                                    <span class="badge-active">Active</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge-inactive">Inactive</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <a href="EmpServlet?action=view&id=${emp.id}" class="btn btn-info btn-action me-1" title="View">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <a href="EmpServlet?action=edit&id=${emp.id}" class="btn btn-warning btn-action me-1" title="Edit">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="EmpServlet?action=delete&id=${emp.id}" 
                                               class="btn btn-danger btn-action" 
                                               title="Delete"
                                               onclick="return confirm('Are you sure you want to delete employee ${emp.name}?');">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer mt-auto">
            <div class="container">
                <span>&copy; 2025 EMS. All rights reserved.</span>
            </div>
        </footer>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>