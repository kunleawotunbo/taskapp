<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Users List</title>
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet"></link>
        <link href="${pageContext.request.contextPath}/static/css/app.css " rel="stylesheet"></link>
	<%--<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>--%>
        <%--
       <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
       <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        --%>
        <%--
          <link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">
            <link href="<%=request.getContextPath()%>/static/css/app.css" rel="stylesheet" />
        --%> 

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
             <link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
                  <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">

    </head>

    <body>
        <div class="generic-container">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading"><span class="lead">List of Users </span></div>
                <div class="tablecontainer">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th> ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Passport</th>
                                <th width="100"></th>
                                <th width="100"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.address}</td>
                                    <td>${user.phoneNumber}</td>
                                    <td>
                                      <%-- <img src="data:image/jpeg;base64,${image}" alt="..."float:right width="200" height="200"> --%>
                                    </td>
                                    <td><a href="<c:url value='/edit-user-${user.id}' />" class="btn btn-success custom-width">edit</a></td>
                                    <td><a href="<c:url value='/delete-user-${user.id}' />" class="btn btn-danger custom-width">delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="well">
                <a href="<c:url value='/newuser' />">Add New User</a>
            </div>
        </div>
    </body>
</html>