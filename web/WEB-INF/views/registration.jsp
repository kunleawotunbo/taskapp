<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>User Registration Form</title>
        <%--
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        --%>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>

    <body>

        <div class="generic-container">
            <div class="well lead">User Registration Form</div>
            <form:form method="POST" modelAttribute="user" enctype="multipart/form-data" class="form-horizontal">
                <form:input type="hidden" path="id" id="id"/>
                
                <div>
                    <div class="form-group col-md-12">
                      
                        <div class="col-md-7">
                            <img src="data:image/jpeg;base64,${image}" alt="..."floatRight width="200" height="200">
                           
                        </div>
                    </div>
                            <%-- <img src="data:image/jpeg;base64,${image}" alt="..." width="200" height="200"> --%>
                </div>
                
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="firstName">First Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="firstName" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="lastName">Last Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="lastName" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                            <%--
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="id"> ID</label>
                        <div class="col-md-7">
                            <c:choose>
                                <c:when test="${edit}">
                                    <form:input type="text" path="id" id="id" class="form-control input-sm" disabled="true"/>
                                </c:when>
                                <c:otherwise>
                                    <form:input type="text" path="id" id="id" class="form-control input-sm" />
                                    <div class="has-error">
                                        <form:errors path="id" class="help-inline"/>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                            --%>
                            
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="address">Address</label>
                        <div class="col-md-7">
                            <form:input type="text" path="address" id="address" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="address" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                            
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="phoneNumber">Phone Number</label>
                        <div class="col-md-7">
                            <form:input type="text" path="phoneNumber" id="phoneNumber" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="phoneNumber" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="passportPhotograph">Passport Photograph</label>
                        <div class="col-md-7">
                            <form:input type="text" path="passportPhotograph" id="passportPhotograph" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="passportPhotograph" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="file">Upload a Passport Photograph</label>
                        <div class="col-md-7">
                            <form:input type="file" path="file" id="file" onchange="readURL(this)" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="file" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-actions floatRight">
                        <c:choose>
                            <c:when test="${edit}">
                                <input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
                            </c:when>
                            <c:otherwise>
                                <input type="submit" value="Register" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <c:if test="${edit}">
                    <span class="well pull-left">
                        <a href="<c:url value='/add-document-${user.id}' />">Click here to upload/manage your documents</a>	
                    </span>
                </c:if>

            </form:form>
        </div>
  
    </body>
</html>

      <script>
            function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        </script>