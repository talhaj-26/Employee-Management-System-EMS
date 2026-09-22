<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EMS - Employee Management System</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #6c5ce7;
                --secondary: #a29bfe;
                --accent: #fd79a8;
                --dark: #2d3436;
                --light: #f5f6fa;
                --glass-bg: rgba(255, 255, 255, 0.15);
                --glass-border: rgba(255, 255, 255, 0.3);
                --shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
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

            /* Navbar */
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

            .navbar-nav .nav-link:hover {
                color: #fff !important;
            }

            /* Hero Section */
            .hero-section {
                padding: 100px 0;
                text-align: center;
                position: relative;
                overflow: hidden;
                flex: 1;
            }

            .hero-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: radial-gradient(circle at 20% 50%, rgba(108, 92, 231, 0.6) 0%, transparent 50%),
                    radial-gradient(circle at 80% 20%, rgba(253, 121, 168, 0.4) 0%, transparent 50%);
                z-index: 0;
            }

            .hero-content {
                position: relative;
                z-index: 1;
            }

            .hero-content h1 {
                font-size: 3.5rem;
                font-weight: 700;
                margin-bottom: 20px;
                text-shadow: 0 0 20px rgba(255, 255, 255, 0.3);
            }

            .hero-content p {
                font-size: 1.3rem;
                margin-bottom: 40px;
                color: #dfe6e9;
            }

            .btn-glow {
                padding: 12px 35px;
                border-radius: 50px;
                font-weight: 600;
                letter-spacing: 1px;
                transition: all 0.3s;
                position: relative;
                overflow: hidden;
                z-index: 1;
            }

            .btn-glow:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            }

            .btn-primary-glow {
                background: linear-gradient(45deg, #6c5ce7, #a29bfe);
                border: none;
                color: #fff;
            }

            .btn-primary-glow:hover {
                background: linear-gradient(45deg, #5b4bc4, #8f87f5);
            }

            .btn-success-glow {
                background: linear-gradient(45deg, #00b894, #55efc4);
                border: none;
                color: #fff;
            }

            .btn-success-glow:hover {
                background: linear-gradient(45deg, #00a381, #48d6a5);
            }

            /* Feature Cards */
            .feature-card {
                background: var(--glass-bg);
                backdrop-filter: blur(12px);
                border: 1px solid var(--glass-border);
                border-radius: 20px;
                padding: 35px 25px;
                text-align: center;
                transition: all 0.4s;
                height: 100%;
            }

            .feature-card:hover {
                transform: translateY(-10px);
                background: rgba(255, 255, 255, 0.25);
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            }

            .feature-icon {
                font-size: 3rem;
                margin-bottom: 20px;
                color: var(--accent);
            }

            .feature-card h3 {
                font-weight: 600;
                margin-bottom: 15px;
            }

            /* Footer */
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
                            <a class="nav-link active" href="index.jsp">Home</a>
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

        <!-- Hero Section -->
        <section class="hero-section d-flex align-items-center">
            <div class="container hero-content">
                <h1>Employee Management System</h1>
                <p class="lead">Manage your workforce with elegance and efficiency.</p>
                <div>
                    <a href="EmpServlet?action=list" class="btn btn-primary-glow btn-glow me-3">
                        <i class="bi bi-people-fill"></i> View Employee List
                    </a>
                    <a href="EmpServlet?action=new" class="btn btn-success-glow btn-glow">
                        <i class="bi bi-person-plus-fill"></i> Add New Employee
                    </a>
                </div>
            </div>
        </section>

        <!-- Feature Cards -->
        <div class="container pb-5">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="bi bi-eye feature-icon"></i>
                        <h3>View</h3>
                        <p>See all employee details at a glance.</p>
                        <a href="EmpServlet?action=list" class="btn btn-outline-light rounded-pill px-4">Go to List</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="bi bi-plus-circle feature-icon"></i>
                        <h3>Add</h3>
                        <p>Register new employees quickly.</p>
                        <a href="EmpServlet?action=new" class="btn btn-outline-light rounded-pill px-4">Add Employee</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="bi bi-pencil-square feature-icon"></i>
                        <h3>Edit / Delete</h3>
                        <p>Update or remove employee records.</p>
                        <a href="EmpServlet?action=list" class="btn btn-outline-light rounded-pill px-4">Manage</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <span>&copy; 2025 EMS. All rights reserved.</span>
                <div class="mt-2">
                    <a href="#"><i class="bi bi-facebook mx-2"></i></a>
                    <a href="#"><i class="bi bi-twitter mx-2"></i></a>
                    <a href="#"><i class="bi bi-linkedin mx-2"></i></a>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>