<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${empty employee ? 'Add Employee' : 'Edit Employee'} - EMS</title>
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

            .form-card {
                background: var(--glass-bg);
                backdrop-filter: blur(15px);
                border: 1px solid var(--glass-border);
                border-radius: 25px;
                padding: 40px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.3);
                animation: fadeInUp 0.7s;
                max-width: 700px;
                margin: 50px auto;
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

            .form-card h3 {
                text-align: center;
                font-weight: 600;
                margin-bottom: 30px;
                color: #fff;
                text-shadow: 0 0 15px rgba(255,255,255,0.2);
            }

            .form-control, .form-select {
                background: rgba(255, 255, 255, 0.1);
                border: 1px solid rgba(255, 255, 255, 0.2);
                color: #fff;
                border-radius: 10px;
                padding: 12px 15px;
                transition: all 0.3s;
            }

            .form-control:focus, .form-select:focus {
                background: rgba(255, 255, 255, 0.2);
                border-color: var(--accent);
                box-shadow: 0 0 0 0.2rem rgba(253, 121, 168, 0.3);
                color: #fff;
            }

            .form-control::placeholder {
                color: rgba(255,255,255,0.6);
            }

            .form-check-input:checked {
                background-color: var(--primary);
                border-color: var(--primary);
            }

            .btn-submit {
                background: linear-gradient(45deg, #6c5ce7, #a29bfe);
                border: none;
                color: #fff;
                font-weight: 600;
                padding: 12px;
                border-radius: 50px;
                letter-spacing: 1px;
                transition: all 0.3s;
                width: 100%;
            }

            .btn-submit:hover {
                background: linear-gradient(45deg, #5b4bc4, #8f87f5);
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(108, 92, 231, 0.4);
            }

            .btn-cancel {
                background: rgba(255,255,255,0.1);
                border: 1px solid rgba(255,255,255,0.3);
                color: #fff;
                font-weight: 500;
                padding: 12px;
                border-radius: 50px;
                transition: all 0.3s;
                width: 100%;
            }

            .btn-cancel:hover {
                background: rgba(255,255,255,0.2);
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
                            <a class="nav-link active" href="EmpServlet?action=new">Add Employee</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container">
            <div class="form-card">
                <h3>${empty employee ? 'Add New Employee' : 'Edit Employee'}</h3>

                <c:choose>
                    <c:when test="${empty employee}">
                        <c:set var="formAction" value="EmpServlet?action=save" />
                        <c:set var="submitLabel" value="Save Employee" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="formAction" value="EmpServlet?action=update" />
                        <c:set var="submitLabel" value="Update Employee" />
                    </c:otherwise>
                </c:choose>

                <form action="${formAction}" method="post">
                    <c:if test="${not empty employee}">
                        <input type="hidden" name="id" value="${employee.id}" />
                    </c:if>

                    <div class="mb-4">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" 
                               value="${employee.name}" required placeholder="Enter full name">
                    </div>

                    <div class="mb-4">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" 
                               value="${employee.email}" required placeholder="name@example.com">
                    </div>

                    <div class="mb-4">
                        <label class="form-label d-block">Gender</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="Male" 
                                   <c:if test="${employee.gender == 'Male'}">checked</c:if> required>
                                   <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female" 
                                <c:if test="${employee.gender == 'Female'}">checked</c:if>>
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="other" value="Other" 
                                <c:if test="${employee.gender == 'Other'}">checked</c:if>>
                                <label class="form-check-label" for="other">Other</label>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="department" class="form-label">Department</label>
                            <select class="form-select" id="department" name="department" required>
                                <option value="" disabled>Select department</option>
                                <option value="HR" ${employee.department == 'HR' ? 'selected' : ''}>HR</option>
                            <option value="IT" ${employee.department == 'IT' ? 'selected' : ''}>IT</option>
                            <option value="Finance" ${employee.department == 'Finance' ? 'selected' : ''}>Finance</option>
                            <option value="Marketing" ${employee.department == 'Marketing' ? 'selected' : ''}>Marketing</option>
                            <option value="Sales" ${employee.department == 'Sales' ? 'selected' : ''}>Sales</option>
                            <option value="Other" ${employee.department == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>

                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="active" name="active" 
                               <c:if test="${employee.active}">checked</c:if>>
                               <label class="form-check-label" for="active">Active Employee</label>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="4" 
                                      placeholder="Short description about employee">${employee.description}</textarea>
                    </div>

                    <div class="d-grid gap-3">
                        <button type="submit" class="btn btn-submit">
                            <i class="bi bi-check-circle me-2"></i>${submitLabel}
                        </button>
                        <a href="EmpServlet?action=list" class="btn btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>
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