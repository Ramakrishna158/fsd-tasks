<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background: #0f172a; color: #e2e8f0; padding: 40px; }
        h1   { color: #38bdf8; margin-bottom: 8px; font-size: 1.8rem; }
        .sub { color: #64748b; margin-bottom: 28px; }
        table {
            width: 100%; border-collapse: collapse;
            background: #1e293b;
            border-radius: 12px; overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        th {
            background: #0ea5e9;
            color: #0f172a;
            padding: 14px 20px;
            text-align: left;
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        td { padding: 14px 20px; border-bottom: 1px solid #334155; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #263348; }
        a.btn {
            background: #38bdf8; color: #0f172a;
            padding: 6px 16px; border-radius: 6px;
            text-decoration: none; font-weight: 600; font-size: 0.85rem;
        }
        a.btn:hover { background: #7dd3fc; }
        .back { display: inline-block; margin-bottom: 20px; color: #38bdf8; text-decoration: none; }
        .back:hover { text-decoration: underline; }
        .badge {
            display: inline-block; padding: 3px 10px;
            border-radius: 99px; font-size: 0.78rem; font-weight: 600;
        }
        .eng  { background: #1d4ed8; color: #bfdbfe; }
        .mkt  { background: #065f46; color: #a7f3d0; }
        .hr   { background: #7c3aed; color: #ddd6fe; }
        .fin  { background: #92400e; color: #fde68a; }
    </style>
</head>
<body>
    <a class="back" href="./">← Back to Home</a>
    <h1>📋 Employee Directory</h1>
    <p class="sub">Total Employees: <strong>${employees.size()}</strong></p>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Email</th>
                <th>Salary</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="emp" items="${employees}">
                <tr>
                    <td>#${emp.id}</td>
                    <td><strong>${emp.name}</strong></td>
                    <td>
                        <span class="badge
                            <c:choose>
                                <c:when test="${emp.department == 'Engineering'}">eng</c:when>
                                <c:when test="${emp.department == 'Marketing'}">mkt</c:when>
                                <c:when test="${emp.department == 'HR'}">hr</c:when>
                                <c:otherwise>fin</c:otherwise>
                            </c:choose>">
                            ${emp.department}
                        </span>
                    </td>
                    <td>${emp.email}</td>
                    <td>$<fmt:formatNumber value="${emp.salary}" pattern="#,##0"/></td>
                    <td><a class="btn" href="employee/${emp.id}">View</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>