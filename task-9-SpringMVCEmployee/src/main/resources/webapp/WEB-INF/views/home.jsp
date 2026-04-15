<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #0f172a;
            color: #e2e8f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 16px;
            padding: 60px;
            text-align: center;
            max-width: 500px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }
        h1 { font-size: 2rem; color: #38bdf8; margin-bottom: 12px; }
        p  { color: #94a3b8; margin-bottom: 32px; font-size: 1.05rem; }
        a  {
            display: inline-block;
            background: #38bdf8;
            color: #0f172a;
            padding: 14px 36px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1rem;
            transition: background 0.2s;
        }
        a:hover { background: #7dd3fc; }
        .error { color: #f87171; margin-top: 16px; }
    </style>
</head>
<body>
    <div class="card">
        <h1>👔 EMS Portal</h1>
        <p>${message}</p>
        <a href="employees">View All Employees</a>
        <c:if test="${not empty error}">
            <p class="error">⚠️ ${error}</p>
        </c:if>
    </div>
</body>
</html>