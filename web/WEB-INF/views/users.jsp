<%-- 
    Document   : users
    Created on : May 18, 2017, 4:03:43 PM
    Author     : olakunle
--%>

<%@ include file="includes2/header.jsp" %>  
<%-- Includ header --%>
<%@ include file="includes2/navigation.jsp" %> 

<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                Users
            </h3>
        </div>
        <div class="panel-body">
                    <c:if test="${!empty users}">  
                    <div class="media-body">
                        <h4> USERS LIST</h4>
                    </div>
                    <table id="user-list" class="table table-striped table-bordered responsive" cellspacing="0" width="100%">  
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
                            <c:forEach items="${users}" var="user" varStatus = "status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.address}</td>
                                    <td>${user.phoneNumber}</td>
                                    <td>
                                        <%--<img src="data:image/jpeg;base64,${image}" alt="..."float:right width="200" height="200">--%> 
                                       <%-- ${user.imgLocation}
                                      contextPath ::   ${pageContext.request.contextPath}
                                       --%>
                                          <img class="photo-icon" src="${pageContext.request.contextPath}${user.imgLocation}" >
                                    </td>
                                    <td><a href="<c:url value='/edit-user-${user.id}' />" class="btn btn-success custom-width">edit</a></td>
                                    <td><a href="<c:url value='/delete-user-${user.id}' />" class="btn btn-danger custom-width">delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>  
                </c:if>  
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

<script>
    $(document).ready(function(){
         jQuery('select').select2({
                    minimumResultsForSearch: -1
                });
	jQuery('#user-list').DataTable({
                    responsive: true
                });
                
        jQuery('#select-search-hide').select2({
                    minimumResultsForSearch: 15
                });        
    })
</script>
   