<%-- 
    Document   : search
    Created on : May 18, 2017, 4:18:53 PM
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
             <form action="searchUser">
                    <div class="row">
                      <div class="col-md-6"><div class="col-md-6">Search User</div><div class="col-md-6"> <input type="text" name="searchPhone" id="searchPhone"> </div></div>
                      <div class="col-md-4"><input class="btn btn-success" type='submit' value='Search'/></div>
                    </div>
                </form>             
                        
           <c:if test="${empty users}">  		       
    			     <div class="media-body error">
    				<h4>NO MATCHING RECORD FOUND</h4>
    			     </div>
    			     
		    </c:if> 
            
                    <c:if test="${!empty users}" >  
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
                                    </td>
                                    <td><a href="<c:url value='/edit-user-${user.id}' />" class="btn btn-success custom-width">edit</a></td>
                                    <td><a href="<c:url value='/delete-user-${user.id}' />" class="btn btn-danger custom-width" onclick="return confirmDelete();">delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>  
                </c:if>  
        </div>
    </div>
</div>


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
   