<%-- 
    Document   : backup
    Created on : May 18, 2017, 12:24:57 PM
    Author     : olakunle
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>TaskApp</title>
        <spring:url  value="/resources" var="resourceUrl" htmlEscape="false"/>
        <%--
                <link rel="icon" href="resources/images/dicon.ico" type="image/x-icon" />
                <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/dicon.ico" type="image/x-icon" />

        <link href="<%=request.getContextPath()%>/resources/css/style.default.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/css/jquery.tagsinput.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/toggles.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/bootstrap-timepicker.min.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/select2.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/resources/css/style.datatables.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/css/jquery.gritter.css" rel="stylesheet">
        --%>


        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
                      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-tagsinput/1.3.6/jquery.tagsinput.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-toggle/2.2.2/css/bootstrap-toggle.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/jquery.gritter/1.7.4/css/jquery.gritter.css" rel="stylesheet">
        <%--       
                   <link rel="icon" href="<c:url value="/resources/images/dicon.ico" />" type="image/x-icon">
                  <link href="<c:url value="/resources/images/dicon.ico" />" rel="shortcut icon" type="image/x-icon">
              
                  <link href="<c:url value="/resources/css/style.default.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/jquery.tagsinput.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/toggles.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/bootstrap-timepicker.min.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/select2.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/style.datatables.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/jquery.dataTables.min.css" />" rel="stylesheet">
                  <link href="<c:url value="/resources/css/jquery.gritter.css" />" rel="stylesheet">
        --%>

        <style>
            .error {
                color: #ff0000;
                font-weight: bold;
            }
        </style>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <header>
            <div class="headerwrapper">
                <div class="header-left">
                    <a href="index.htm" class="logo">
                        <img src="${resourceUrl}/images/logo.png" alt="" /> 
                    </a>
                    <div class="pull-right">
                        <a href="#" class="menu-collapse">
                            <i class="fa fa-bars"></i>
                        </a>
                    </div>
                </div><!-- header-left -->

                <div class="header-right">

                    <div class="pull-right">



                        <div class="btn-group btn-group-option">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right" role="menu">
                                <li class="divider"></li>
                            </ul>
                        </div><!-- btn-group -->

                    </div><!-- pull-right -->

                </div><!-- header-right -->

            </div><!-- headerwrapper -->
        </header>

        <section>
            <div class="mainwrapper">
                <div class="leftpanel" style="margin-top:4px">
                    <!-- media -->
                    <!-- Navigation Starts-->

                    <%@ include file="navigation.jsp" %>  
                    <!-- Navigation Ends -->
                </div><!-- leftpanel -->


                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-home"></i>
                            </div>

