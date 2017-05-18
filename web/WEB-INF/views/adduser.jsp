<%-- 
    Document   : adduser
    Created on : May 18, 2017, 3:36:10 PM
    Author     : olakunle
--%>


<%@ include file="includes2/header.jsp" %>  
<%-- Includ header --%>
<%@ include file="includes2/navigation.jsp" %> 


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

<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                Registration
            </h3>
        </div>
        <div class="panel-body">
            <form:form method="POST" modelAttribute="user" enctype="multipart/form-data" class="form-horizontal">


                <div>
                    <div class="form-group ">

                        <div class="control-label col-xs-6">
                            <img src="data:image/jpeg;base64,${image}" alt="..."floatRight width="200" height="200">

                        </div>
                    </div>                        
                </div>


                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="firstName" >First Name</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="firstName" id="firstName" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="firstName" class="help-inline"/>
                        </div>
                    </div>
                </div>
                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="lastName" >Last Name</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="lastName" id="lastName" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="lastName" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="address" >Address</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="address" id="address" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="address" class="help-inline"/>
                        </div>
                    </div>
                </div>


                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="phoneNumber" >Phone Number </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="phoneNumber" id="phoneNumber" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="phoneNumber" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="file" >Upload a Passport Photograph </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="file" path="file" id="file" onchange="readURL(this)" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="file" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3">  </div>
                    <div class="col-md-6">
                        <img id="myImg" src="#" alt="your image" /> 
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                        </div>
                        <div class="col-xs-4">
                            <input type="submit" id="saveUser" class="btn btn-primary" value="Save" onclick="return submitUserForm();"/>
                        </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                           
                            </div>
                            <div class="col-xs-4">
                                <c:choose>
                                    <c:when test="${edit}">
                                        <input type="submit" value="Update" class="btn btn-primary "/> or <a href="<c:url value='/list' />" class="btn btn-danger ">Cancel</a>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" value="Register" class="btn btn-primary "/> or <a href="<c:url value='/list' />">Cancel</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-xs-4">
                           </div>
                       
                    </div>  
                </div>


            </form:form>
        </div>
    </div>
</div>


<script type="text/javascript">
    function submitUserForm() {

        // getting the user form values
        var firstName = $('#firstName').val().trim();
        var lastName = $('#lastName').val().trim();
        var address = $('#address').val().trim();
        var phoneNumber = $('#phoneNumber').val();
        var file = $('#file').val();
        if (firstName.length == 0) {
            alert('Please enter First Name');
            $('#firstName').focus();
            return false;
        }
        if (lastName.length == 0) {
            alert('Please enter Last name');
            $('#lastName').focus();
            return false;
        }
        if (address.length == 0) {
            alert('Please enter address');
            $('#address').focus();
            return false;
        }
        if (phoneNumber.length == 0) {
            alert('Please enter Phone Number');
            $('#phoneNumber').focus();
            return false;
        }
//        var phoneno = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
//        if(!phoneNumber.value.match(phoneno)){
//            return false;
//            return false;
        //   }


        if (file.length == 0) {
            alert('Please upload a passport');
            $('#file').focus();
            return false;
        }

        var r = confirm("Do you want to Submit?");
        if (r == true) {
            frm.submit();
        } else {
            return false;
        }


        return true;
    }
    ;

    function phonenumber(inputtxt) {
        var phoneno = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
        if (inputtxt.value.match(phoneno)) {
            return true;
        } else {
            c
            return false;
        }
    }
</script>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                        .attr('src', e.target.result)
                        .width(580)
                        .height(450);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<%@ include file="includes2/footer.jsp" %>  