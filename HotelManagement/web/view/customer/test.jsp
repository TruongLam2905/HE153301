<%-- 
    Document   : test
    Created on : Oct 18, 2021, 2:12:29 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <c:forEach items="${requestScope.customers}" var="c">
                <tr>
                    <td>${c.customerID}</td>
                    <td>${c.name}</td>
                    <td>${c.phone}</td>
                    <td>${c.address}</td>
                    <td>${c.email}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
