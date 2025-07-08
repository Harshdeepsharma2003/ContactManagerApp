catch all unhandled exceptions and display a user-friendly error message.

<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f2f2f2; }
        .error-container { margin: 100px auto; max-width: 600px; background: #fff; padding: 40px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);}
        h1 { color: #c00; }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Something went wrong</h1>
        <p>
            <strong>Error Details:</strong><br>
            <%= exception != null ? exception.getMessage() : "Unknown error" %>
        </p>
        <p>
            <a href="signin.jsp">Back to Home</a>
        </p>
    </div>
</body>
</html>
