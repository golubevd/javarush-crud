<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Book Manager</title>

    <style>
        body {
            text-align: center;
            padding-top: 20%;
            background-color: #f0f0f0;
        }

        .btn {
            display: inline-block;
            width: auto;
            padding: 10px;
            text-decoration: none;
            background-color: aliceblue;
            border: 1px solid #cccccc;
            border-radius: 5px;

        }

        .btn:hover {

            background-color: darkgrey;
        }
    </style>
</head>
<body>
<h2>Book Manager</h2>
<br/>
<h3><a href="<c:url value="/books"/>" class="btn" target="_blank">Books list</a></h3>
<br/>
</body>
</html>