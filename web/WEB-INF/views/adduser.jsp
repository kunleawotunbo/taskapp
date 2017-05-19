<%-- 
    Document   : adduser
    Created on : May 18, 2017, 3:36:10 PM
    Author     : olakunle
--%>


<%@ include file="includes2/header.jsp" %>  
<%-- Includ header --%>
<%@ include file="includes2/navigation.jsp" %> 


<div class="container myrow-container">



    <div class="row"> 

        <div class="col-md-6">
            <div class="panel panel-default"> 
                <div class="panel-heading">
                    <div class="panel-btns">
                    </div><!-- panel-btns -->
                    <h5 class="panel-title">NOTICE</h5>
                    <!--<p>Notice . </p>-->
                </div><!-- panel-heading -->
                <div class="panel-body "> 

                    <p>Notice shows here. </p>
                </div>
            </div>

        </div>





        <!-- Search panel start -->

        <div class="col-md-6">
            <div class="panel panel-default"> 
                <div class="panel-heading">
                    <div class="panel-btns">
                    </div><!-- panel-btns -->
                    <h5 class="panel-title">Query User</h5>
                    <p>Query using phone number. </p>
                </div><!-- panel-heading -->
                <div class="panel-body "> 

                    <form action="searchUser">
                        <div class="row">
                            <div class="col-md-6">

                                <div class="col-md-6"> 
                                    <input type="text" name="searchPhone" id="searchPhone" placeholder="Search using phone number" required="required"/>
                                </div>

                            </div>

                            <div class="col-md-4"><input class="btn btn-success" type="submit" value="Search" /></div>
                        </div>                 

                    </form> 


                </div>
            </div>

        </div>

    </div>

    <!--search panel ends-->



    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                Registration
            </h3>
        </div>

        <br><br>

        <!--Registration form start-->

        <c:if test="${saved}">          
            <div class="alert alert-success lead">
                ${success}
            </div>
        </c:if>   

        <div class="panel-body">
            <center>
                <strong> <p><font size="3" color="red"> Please fill the form below. All fields are mandatory.</font></p> </strong>
            </center>
            
            <form:form method="POST" modelAttribute="user" enctype="multipart/form-data" class="form-horizontal">

                <form:hidden path="id" />
                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="firstName" >First Name</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="firstName" id="firstName" class="form-control input-sm" maxlength="50" required="required"/>
                        <div class="has-error">
                            <form:errors path="firstName" class="help-inline"/>
                        </div>
                    </div>
                </div>
                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="lastName" >Last Name</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="lastName" id="lastName" class="form-control input-sm" maxlength="50" required="required"/>
                        <div class="has-error">
                            <form:errors path="lastName" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="address" >Address</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="address" id="address" class="form-control input-sm" maxlength="100" required="required"/>
                        <div class="has-error">
                            <form:errors path="address" class="help-inline"/>
                        </div>
                    </div>
                </div>




                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="phoneNumber" >Phone Number </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="number" path="phoneNumber" id="phoneNumber" class="form-control input-sm" maxlength="11" required="required"/>
                        <div class="has-error">
                            <form:errors path="phoneNumber" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="files" >Passport Photograph </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="file" path="files" id="file" onchange="readURL(this)" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="files" class="help-inline"/>
                        </div>
                    </div>

                </div>

                <!--                <div class="form-group ">                        
                                    <div class="control-label col-xs-3">  </div>
                                    <div class="col-md-6">
                                        <img id="myImg" src="#" alt="your image" /> 
                                    </div>
                                </div>-->

                <c:if test="${edit}">          
                    <div>
                        <div class="form-group ">

                            <div class="control-label col-xs-6">
                                <img src="data:image/jpeg;base64,${passportImage}" alt="..."floatRight width="200" height="200">

                            </div>
                        </div>                        
                    </div>
                </c:if>   

                <%--  
                    <div>
                        <div class="form-group ">

                        <div class="control-label col-xs-6">
                            <img src="data:image/jpeg;base64,${passportImage}" alt="..."floatRight width="200" height="200">

                        </div>
                    </div>                        
                </div>
                --%>


                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="files" >Item View </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="file" path="files" id="file2" onchange="readURL(this)" class="form-control input-sm" required="required"/>
                        <div class="has-error">
                            <form:errors path="files" class="help-inline"/>
                        </div>
                    </div>
                </div>           

            <%--
                <div>
                    <div class="form-group ">

                        <div class="control-label col-xs-6">
                            <img src="data:image/jpeg;base64,${itemViewImage}" alt="..."floatRight width="200" height="200">
                        </div>
                    </div>                        
                </div>
                --%>


                <c:if test="${edit}">          
                    <div>
                        <div class="form-group ">

                            <div class="control-label col-xs-6">
                                <img src="data:image/jpeg;base64,${itemViewImage}" alt="..."floatRight width="200" height="200">

                            </div>
                        </div>                        
                    </div>
                </c:if>        



                <!--                <div class="form-group">
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
                -->

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">

                        </div>
                        <div class="col-xs-4">
                            <c:choose>
                                <c:when test="${edit}">
                                    <input type="submit" value="Update" class="btn btn-primary "/> or <a href="<c:url value='/register' />" >Cancel</a>
                                </c:when>
                                <c:otherwise>
                                    <%--          <input type="submit" value="Register" class="btn btn-primary "/> or <a href="<c:url value='/list' />">Cancel</a>--%>
                                    <input type="submit" id="saveUser" class="btn btn-primary" value="Submit" onclick="return submitUserForm();"/> or <a href="<c:url value='/register' />">Cancel</a>
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
<!--Registration form ends--> 

<script type="text/javascript">
    function confirmDelete() {

        var r = confirm("Do you want to Delete this user?");
        if (r == true) {
            frm.submit();
        } else {
            return false;
        }
        return true;
    }
    ;
</script>


<script type="text/javascript">
    function submitUserForm() {

        // getting the user form values
        var firstName = $('#firstName').val().trim();
        var lastName = $('#lastName').val().trim();
        var address = $('#address').val().trim();
        var phoneNumber = $('#phoneNumber').val().trim();
        var image = $('#file').val().trim();
        //var image = document.getElementById("image").value;
        var file = $('#file').val();
        var file2 = $('#file2').val();
        if (firstName.length === 0) {
            alert('Please enter First Name');
            $('#firstName').focus();
            return false;
        }
        if (lastName.length === 0) {
            alert('Please enter Last name');
            $('#lastName').focus();
            return false;
        }
        if (address.length === 0) {
            alert('Please enter address');
            $('#address').focus();
            return false;
        }
        if (phoneNumber.length < 11) {
            alert('Phone Number not up to 11 digits');
            $('#phoneNumber').focus();
            return false;
        } 
        if (phoneNumber.length === '') {
            alert('Please enter Phone Number');
            $('#phoneNumber').focus();
            return false;
        } else {
            console.log("Phone number is not 0");
            /*
             if (!phoneNumber.match(/^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/)) {
             console.log("Invalid phone number");
             alert("Invalid phone number");                
             $('#phoneNumber').focus();
             return false;
             }
             console.log("Outside  phone number");
             
             */

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
        } else {

            var checkimg = image.toLowerCase();
            if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
                console.log("I am insie checking");
                alert("Please upload Image File Extensions .jpg,.png,.jpeg");
                $('#file').focus();
                return false;
            }
            console.log("Outside checking");

        }
        
        if (file2.length == 0) {
            alert('Please upload an item');
            $('#file2').focus();

            return false;
        } else {

            var checkimg = image.toLowerCase();
            if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
                console.log("I am insie checking");
                alert("Please upload Image File Extensions .jpg,.png,.jpeg");
                $('#file2').focus();
                return false;
            }
            console.log("Outside checking");

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