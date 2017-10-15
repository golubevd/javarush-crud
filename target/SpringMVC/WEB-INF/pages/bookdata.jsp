<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>


<html>
<head>
    <title>BookData</title>

    <style type="text/css">

        body {
            text-align: center;
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

        .alignment {
            text-align: center;

        }

        .btn:hover {

            background-color: darkgrey;
        }

        .tg {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .readbooks {
            text-align: center;
        }

    </style>

</head>
<body>
<br/>
<br/>

<div>
    <h1>Book Details</h1>

    <table class="tg">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Print Year</th>
            <th>Book Read</th>
        </tr>

        <tr>
            <td>${book.id}</td>
            <td>${book.bookTitle}</td>
            <td>${book.bookDescription}</td>
            <td>${book.bookAuthor}</td>
            <td>${book.bookIsbn}</td>
            <td>${book.printYear}</td>
            <td><c:if test="${book.readAlready}">Прочитано</c:if>
                <c:if test="${!book.readAlready}">Не прочитано</c:if>
            </td>
        </tr>

    </table>

    <br/>
    <a class="btn" href="<c:url value="/books"/>" target="_self">Back</a>
</div>

</body>
</html>