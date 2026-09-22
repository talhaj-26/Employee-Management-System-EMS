<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Details - EMS</title>
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
                --glass-bg: rgba(255, 255, 255, 0.12);
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

            .profile-card {
                background: var(--glass-bg);
                backdrop-filter: blur(15px);
                border: 1px solid var(--glass-border);
                border-radius: 25px;
                overflow: hidden;
                box-shadow: 0 15px 40px rgba(0,0,0,0.3);
                max-width: 700px;
                margin: 50px auto;
                animation: fadeIn 0.7s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: scale(0.95);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }

            .profile-header {
                background: linear-gradient(135deg, #6c5ce7, #fd79a8);
                padding: 30px;
                text-align: center;
            }

            .profile-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                background: rgba(255,255,255,0.2);
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 15px;
                font-size: 3rem;
                color: #fff;
                border: 3px solid rgba(255,255,255,0.5);
            }

            .profile-header h2 {
                font-weight: 600;
                margin-bottom: 5px;
            }

            .profile-header p {
                color: rgba(255,255,255,0.8);
                margin-bottom: 0;
            }

            .profile-body {
                padding: 30px;
            }

            .detail-item {
                display: flex;
                align-items: center;
                padding: 12px 0;
                border-bottom: 1px solid rgba(255,255,255,0.1);
            }

            .detail-item:last-child {
                border-bottom: none;
            }

            .detail-icon {
                width: 40px;
                height: 40px;
                background: rgba(255,255,255,0.1);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
                color: var(--accent);
                font-size: 1.2rem;
            }

            .detail-label {
                font-weight: 600;
                width: 120px;
                color: #dfe6e9;
            }

            .detail-value {
                flex: 1;
            }

            .badge-active {
                background: linear-gradient(45deg, #00b894, #55efc4);
                color: #fff;
                padding: 8px 20px;
                border-radius: 50px;
                font-weight: 500;
            }

            .badge-inactive {
                background: linear-gradient(45deg, #d63031, #ff7675);
                color: #fff;
                padding: 8px 20px;
                border-radius: 50px;
                font-weight: 500;
            }

            .btn-action-group {
                display: flex;
                gap: 10px;
                margin-top: 25px;
            }

            .btn-back {
                background: rgba(255,255,255,0.1);
                border: 1px solid rgba(255,255,255,0.3);
                color: #fff;
                font-weight: 500;
                padding: 10px 20px;
                border-radius: 50px;
                transition: all 0.3s;
                flex: 1;
            }

            .btn-back:hover {
                background: rgba(255,255,255,0.2);
            }

            .btn-edit {
                background: linear-gradient(45deg, #fdcb6e, #f39c12);
                border: none;
                color: #fff;
                font-weight: 600;
                padding: 10px 20px;
                border-radius: 50px;
                transition: all 0.3s;
                flex: 1;
            }

            .btn-edit:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(243,156,18,0.4);
            }

            .btn-delete {
                background: linear-gradient(45deg, #d63031, #ff7675);
                border: none;
                color: #fff;
                font-weight: 600;
                padding: 10px 20px;
                border-radius: 50px;
                transition: all 0.3s;
                flex: 1;
            }

            .btn-delete:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(214,48,49,0.4);
            }

            .footer {
                background: rgba(20, 20, 30, 0.8);
                backdrop-filter: blur(10px);
                padding: 20px 0;
                text-align: center;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                margin-top: auto;
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
                            <a class="nav-link" href="EmpServlet?action=list">Employee List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="EmpServlet?action=new">Add Employee</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container">
            <c:if test="${not empty employee}">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar">
                            <i class="bi bi-person"></i>
                        </div>
                        <h2>${employee.name}</h2>
                        <p>${employee.department}</p>
                    </div>
                    <div class="profile-body">
                        <div class="detail-item">
                            <div class="detail-icon"><i class="bi bi-hash"></i></div>
                            <div class="detail-label">ID</div>
                            <div class="detail-value">${employee.id}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon"><i class="bi bi-envelope"></i></div>
                            <div class="detail-label">Email</div>
                            <div class="detail-value">${employee.email}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon"><i class="bi bi-gender-ambiguous"></i></div>
                            <div class="detail-label">Gender</div>
                            <div class="detail-value">${employee.gender}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon"><i class="bi bi-building"></i></div>
                            <div class="detail-label">Department</div>
                            <div class="detail-value">${employee.department}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon"><i class="bi bi-toggle-on"></i></div>
                            <div class="detail-label">Status</div>
                            <div class="detail-value">
                                <c:choose>
                                    <c:when test="${employee.active}">
                                        <span class="badge-active">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge-inactive">Inactive</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-icon"><i class="bi bi-file-text"></i></div>
                            <div class="detail-label">Description</div>
                            <div class="detail-value">${employee.description}</div>
                        </div>

                        <div class="btn-action-group">
                            <a href="EmpServlet?action=list" class="btn btn-back">
                                <i class="bi bi-arrow-left me-2"></i>Back
                            </a>
                            <a href="EmpServlet?action=edit&id=${employee.id}" class="btn btn-edit">
                                <i class="bi bi-pencil me-2"></i>Edit
                            </a>
                            <a href="EmpServlet?action=delete&id=${employee.id}" 
                               class="btn btn-delete"
                               onclick="return confirm('Are you sure you want to delete this employee?');">
                                <i class="bi bi-trash me-2"></i>Delete
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty employee}">
                <div class="alert alert-warning mt-5 text-center">
                    Employee not found.
                </div>
            </c:if>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <span>&copy; 2025 EMS. All rights reserved.</span>
            </div>
        </footer>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>