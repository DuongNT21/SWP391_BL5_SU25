<%-- 
    Document   : contact
    Created on : 13 Aug 2025, 22:28:45
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - G3PC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .header-bg {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        .logo {
            font-weight: bold;
            color: #dc3545;
            font-size: 1.5rem;
        }
        .search-container {
            max-width: 400px;
        }
        .contact-container {
            background-color: #e9ecef;
            min-height: 60vh;
            padding: 40px 0;
        }
        .contact-form {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: 0 auto;
        }
        .form-control {
            background-color: #6c757d;
            border: none;
            color: white;
            margin-bottom: 15px;
        }
        .form-control::placeholder {
            color: #adb5bd;
        }
        .form-control:focus {
            background-color: #5a6268;
            border-color: #dc3545;
            box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
            color: white;
        }
        .btn-send {
            background-color: #dc3545;
            border: none;
            padding: 8px 25px;
            border-radius: 4px;
        }
        .btn-send:hover {
            background-color: #c82333;
        }
        .footer-bg {
            background-color: #495057;
            color: white;
            padding: 20px 0;
            margin-top: auto;
        }
        .nav-icon {
            color: #6c757d;
            margin: 0 10px;
            font-size: 1.2rem;
        }
        .nav-icon:hover {
            color: #495057;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <!-- Header -->
    <header class="header-bg py-3">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-2">
                    <div class="logo">G3PC</div>
                </div>
                <div class="col-md-6">
                    <div class="search-container mx-auto">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" style="background-color: white; color: #495057;">
                            <button class="btn btn-danger" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-end">
                    <a href="#" class="nav-icon"><i class="fas fa-phone"></i> Contact</a>
                    <a href="#" class="nav-icon"><i class="fas fa-link"></i> Links</a>
                    <a href="#" class="nav-icon"><i class="fas fa-user"></i> Login</a>
                    <a href="#" class="nav-icon"><i class="fas fa-shopping-cart"></i> Cart</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Contact Section -->
    <main class="contact-container flex-grow-1">
        <div class="container">
            <h2 class="text-center mb-4">Contact</h2>
            <div class="contact-form">
                <form action="ContactServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label text-muted">Name:</label>
                        <input type="text" class="form-control" name="name" value="Nguyen Van A" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label text-muted">Email:</label>
                        <input type="email" class="form-control" name="email" value="yourmail@hot.com" required>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label text-muted">Reason:</label>
                        <textarea class="form-control" name="reason" rows="6" placeholder="Reason..." required></textarea>
                    </div>
                    
                    <div class="text-center">
                        <button type="submit" class="btn btn-send text-white">Send</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer-bg">
        <div class="container">
            <div class="text-center">
                <p class="mb-0">Footer</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
