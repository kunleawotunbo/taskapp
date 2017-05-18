<%-- 
    Document   : form
    Created on : May 18, 2017, 2:56:46 PM
    Author     : olakunle
--%>

<%@ include file="includes2/header.jsp" %>  
<%-- Includ header --%>

<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                Registration
            </h3>
        </div>
        <div class="panel-body">
           
            <form:form method="POST" modelAttribute="user" enctype="multipart/form-data" class="form-horizontal">
                <form:input type="hidden" path="id" id="id"/>

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
                        <form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="firstName" class="help-inline"/>
                        </div>
                    </div>
                </div>
                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="lastName" >Last Name</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="lastName" id="lastName" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="lastName" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="address" >Address</form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="address" id="address" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="address" class="help-inline"/>
                        </div>
                    </div>
                </div>


                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="phoneNumber" >Phone Number </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="text" path="phoneNumber" id="phoneNumber" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="phoneNumber" class="help-inline"/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">                        
                    <div class="control-label col-xs-3"> <form:label path="file" >Upload a Passport Photograph </form:label> </div>
                        <div class="col-md-6">
                        <form:input type="file" path="file" id="file" onchange="readURL(this)" class="form-control input-sm"/>
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
                                <input type="submit" id="saveUser" class="btn btn-primary" value="Save" onclick="return submitEmployeeForm();"/>
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
    function submitEmployeeForm() {

        // getting the employee form values
        var name = $('#name').val().trim();
        var age = $('#age').val();
        var salary = $('#salary').val();
        if (name.length == 0) {
            alert('Please enter name');
            $('#name').focus();
            return false;
        }

        if (age <= 0) {
            alert('Please enter proper age');
            $('#age').focus();
            return false;
        }

        if (salary <= 0) {
            alert('Please enter proper salary');
            $('#salary').focus();
            return false;
        }
        return true;
    }
    ;
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