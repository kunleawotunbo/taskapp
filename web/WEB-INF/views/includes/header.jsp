<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

        <spring:url value="" var="crunchifyCSS" />
        <spring:url value="" var="crunchifyJS" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <link href="${crunchifyCSS}" rel="stylesheet" />
        <script src="${crunchifyJS}"></script>
        
        <link rel="icon" href="<c:url value="/resources/images/dicon.ico" />" type="image/x-icon">
        <link href="<c:url value="/resources/images/dicon.ico" />" rel="shortcut icon" type="image/x-icon">

        <link href="${crunchifyJS}/resources/css/style.default.css" rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/jquery.tagsinput.css"  rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/toggles.css"  rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/bootstrap-timepicker.min.css" rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/select2.css"  rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/style.datatables.css" rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="${crunchifyJS}/resources/css/jquery.gritter.css"  rel="stylesheet">

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

