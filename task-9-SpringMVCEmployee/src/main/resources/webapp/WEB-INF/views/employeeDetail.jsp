<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Detail</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #0f172a; color: #e2e8f0;
            display: flex; justify-content: center;
            align-items: center; min-height: 100vh; padding: 40px;
        }
        .card {
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 16px; padding: 48px;
            width: 100%; max-width: 480px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }
        .avatar {
            width: 80px; height: 80px; border-radius: 50%;
            background: linear-gradient(135deg, #0ea5e9, #6366f1);
            display: flex; align-items: center; justify-content: center;
            font-size: 2rem; margin-bottom: 20px;
        }
        h2   { font-size: 1.6rem; color: #f1f5f9; margin-bottom: 4px; }
        .dept { color: #38bdf8; font-size: 0.95rem; margin-bottom: 28px; }
        .row {
            display: flex; justify-content: space-between;
            padding: 14px 0; border-bottom: 1px solid #334155;
        }
        .row:last-of-type { border-bottom: none; }
        .label { color: #64748b; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.05em; }
        .value { color: #f1f5f9; font-weight: 600; }
        .back {
            display: inline-block; margin-top: 28px;
            color: #38bdf8; text-decoration: none;
            font-size: 0.9rem;
        }
        .back:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="card">
        <div class="avatar">👤</div>
        <h2>${employee.name}</h2>
        <p class="dept">${employee.department} Department</p>

        <div class="row">
            <span class="label">Employee ID</span>
            <span class="value">#${employee.id}</span>
        </div>
        <div class="row">
            <span class="label">Email</span>
            <span class="value">${employee.email}</span>
        </div>
        <div class="row">
            <span class="label">Department</span>
            <span class="value">${employee.department}</span>
        </div>
        <div class="row">
            <span class="label">Salary</span>
            <span class="value">$<fmt:formatNumber value="${employee.salary}" pattern="#,##0"/></span>
        </div>

        <a class="back" href="../employees">← Back to Employee List</a>
    </div>
</body>
</html>