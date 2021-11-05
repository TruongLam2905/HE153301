<%-- 
    Document   : insert
    Created on : Oct 19, 2021, 4:37:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insert" method="POST">
            Name: <input type="text" name="name"/> <br/>
            Phone: <input type="text" name="phone"/> <br/>
            Address: <input type="text" name="address"/> <br/>
            Email: <input type="text" name="email"/> <br/>
            <input type="submit" value="Booking">
        </form>
    </body>
</html>
