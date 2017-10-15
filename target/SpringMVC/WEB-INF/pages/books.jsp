<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>

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

        ul.paging {
            display: inline-block;
            margin: 10px auto;
            padding: 0;

        }

        ul.paging li {
            display: inline;
            border: 1px solid #ddd;
            border-radius: 10%;
            color: black;
            background: aliceblue;
            float: left;
            font-size: 18px;
            padding: 8px 16px;
            text-decoration: none;
        }

        ul.paging li a {
            text-decoration: none;
        }

        ul.paging li:hover {

            background-color: darkgrey;
        }

    </style>
</head>
<body>

<br/>
<br/>

<div>
    <h1>Book List</h1>
    <form>
        <a href="/addbook" class="btn">Add Book</a> <a href="../../index.jsp" class="btn">Back to main menu</a>

    </form>

    <c:url var="searchbook" value="/searchbook"/>
    <form:form action="${searchbook}" commandName="searchbook">
        <table>
            <tr>
                <td><spring:message text="Search by Title"/><form:input path="bookTitle"/></td>
                <td><input class="btn" type="submit" name="action" value="<spring:message text="Search"/>"/></td>
            </tr>
        </table>
    </form:form>

    <div id="pagination" style="align-content: center">
        <c:if test="${!empty books}">
            <table class="tg">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Print Year</th>
                    <th>Book Read</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${books}" var="book">
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
        </c:if>
        <ul class="paging">
            <c:url value="/books" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>

            <c:if test="${page > 1}">
                <li><a href="<c:out value="${prev}" />" class="pn prev">Prev</a></li>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <li><span>${i.index}</span></li>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/books" var="url">
                            <c:param name="page" value="${i.index}"/>
                        </c:url>
                        <li><a href='<c:out value="${url}" />'>${i.index}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/books" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= maxPages}">
                <li><a href='<c:out value="${next}" />' class="pn next">Next</a></li>
            </c:if>
        </ul>
    </div>

</div>

</body>
</html>