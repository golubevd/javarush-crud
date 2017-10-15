<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>


<html>
<head>
    <title>Search Result</title>

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
    <h1>Search Details</h1>
    <c:if test="${!empty listBooks}">

    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Description</th>
            <th width="120">Author</th>
            <th width="120">ISBN</th>
            <th width="120">Print Year</th>
            <th width="120">Book Read</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" target="_self">${book.bookTitle}</a></td>
                <td>${book.bookDescription}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookIsbn}</td>
                <td>${book.printYear}</td>
                <td><c:if test="${book.readAlready}">Прочитано</c:if>
                    <c:if test="${!book.readAlready}">Не прочитано</c:if>
                </td>
                <td class="alignment">
                    <c:if test="${book.readAlready}">
                    <a class="btn" href="<c:url value='/edit/${book.id}'/>">Edit</c:if>
                        <c:if test="${!book.readAlready}"><span>Edit</span></c:if>
                </td>
                <td class="alignment"><a class="btn" href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>

    <br/>
    <a class="btn" href="<c:url value="/books"/>" target="_self">Back</a>
</div>
</c:if>
</body>
</html>