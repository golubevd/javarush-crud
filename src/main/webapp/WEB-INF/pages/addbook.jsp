<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Add Book</title>

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

            margin: auto;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9

        }

        .addtab {
            align: center;
        }
    </style>
</head>
<body>

<br/>
<br/>

<div class="addtab">
    <h1>Add a Book</h1>
    <form>
        <a class="btn" href="../../index.jsp">Back to main menu</a>
    </form>
    <c:url var="addAction" value="/books/add"/>

    <form:form action="${addAction}" commandName="book">
        <table class="tg">
            <tr>
                <td class="tg-4eph">
                    <form:label path="bookTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookTitle"/>
                </td>
            </tr>
            <tr>
                <td class="tg-4eph">
                    <form:label path="bookDescription">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:textarea cols="16" rows="6" path="bookDescription"/>
                </td>
            </tr>
            <tr>
                <td class="tg-4eph">
                    <form:label path="bookAuthor">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookAuthor"/>
                </td>
            </tr>
            <tr>
                <td class="tg-4eph">
                    <form:label path="bookIsbn">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookIsbn"/>
                </td>
            </tr>

            <tr>
                <td class="tg-4eph">
                    <form:label path="printYear">
                        <spring:message text="Print Year"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input class="btn" type="submit"
                           value="<spring:message text="Add Book"/>"/>
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
