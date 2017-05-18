<%-- 
    Document   : test
    Created on : May 18, 2017, 8:52:33 AM
    Author     : olakunle
--%>


<%@ include file="includes/header.jsp" %>
<div class="media-body">
    <div style="float:left">

        <ul class="breadcrumb">
            <li><a href="#"><i class="glyphicon glyphicon-home"></i></a></li>
            <li><a href="#">Home</a></li>
            <li>List Users</li>
        </ul>
        <h4>List Users</h4>
    </div>   
    <%@include file="includes/topright.jsp" %>
</div>
</div><!-- media -->
</div><!-- pageheader -->
<script lanuage="Javascript">
    function doSubmit(frm) {
        if (frm.countryId.value == "" || frm.countryId.value == "0") {
            alert("please specify country");
            frm.countryId.focus();
            return;
        }

        if (frm.bankCode.value == "") {
            alert("Bank Code is required");
            frm.bankCode.focus();
            return;
        }
        if (frm.bankName.value == "") {
            alert("Bank Name is required");
            frm.bankName.focus();
            return;
        }
        frm.submit();
    }
</script>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-8">
            <!-- CONTENT GOES HERE -->  
            <div class="col-md-12">
                <div class="panel-body">
                    <c:set var="now" value="<%=new java.util.Date()%>" />
                    
                    Path :: ${pageContext.request.contextPath}
                    <%--
                    <form:form method="post" action="saveBank" modelAttribute="bank">		  
                        <form:hidden path="bankId"/>                   


                        <div class="form-group">  
                            <label data-toggle="tooltip" id="select-templating" title="Select Country" class="col-sm-3 tooltips control-label">Country <span class="asterisk">*</span></label>

                            <div class="col-sm-7">
                                <form:select  cssClass="width300" id="select-search-hide" path="countryId" required ="required">
                                    <form:option value="0">--Choose Country--</form:option>
                                    <c:forEach items="${countries}" var="item">  
                                        <form:option value="${item.id}">${item.countryName}</form:option>                                     
                                    </c:forEach>                                 
                                </form:select>
                            </div>  
                        </div> 	   

                        <div class="form-group">
                            <label data-toggle="tooltip" title="Enter Bank Code here " class="col-sm-3 tooltips control-label">Bank Code <span class="asterisk">*</span></label>
                            <div class="col-sm-7">                                           
                                <form:input path="bankCode" id="bankCode" cssClass="form-control" placeholder="Type Bank Code here" required ="required"/>                                                                 
                            </div>
                        </div><!-- form-group -->  

                        <div class="form-group">
                            <label data-toggle="tooltip" title="Enter Bank Name here " class="col-sm-3 tooltips control-label">Bank Name <span class="asterisk">*</span></label>
                            <div class="col-sm-7">                                           
                                <form:input path="bankName" id="bankName" cssClass="form-control" placeholder="Type Bank name here" required ="required"/>                                                                 
                            </div>
                        </div><!-- form-group -->                    

                        <form:hidden path="delFlg" value="N"/>  

                        <div class="form-group">
                            <button class="btn btn-danger mr5" type="button" onclick="Javascript:doSubmit(this.form);">SUBMIT</button>
                            <button type="reset" class="btn btn-default">RESET</button>
                        </div><!-- panel-footer -->


                    </form:form>  
                        --%>
                </div>
                <c:if test="${!empty users}">  
                    <div class="media-body">
                        <h4>LIST ALL USERS</h4>
                    </div>
                    <table id="bank-list" class="table table-striped table-bordered responsive">  
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
                </c:if>  
            </div><!-- col-md-6 -->
        </div>
    </div>
</div><!-- contentpanel -->

<%@ include file="includes/footer.jsp" %>  
<script>
    $(document).ready(function () {
        jQuery('select').select2({
            minimumResultsForSearch: -1
        });
        jQuery('#bank-list').DataTable({
            responsive: true
        });

        jQuery('#select-search-hide').select2({
            minimumResultsForSearch: 15
        });
    })
</script>
