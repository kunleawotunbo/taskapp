<%-- 
    Document   : errorPage
    Created on : May 20, 2017, 11:05:24 AM
    Author     : olakunle
--%>


<%@ include file="includes2/header.jsp" %>  
<%-- Includ header --%>
<%@ include file="includes2/navigation.jsp" %> 

<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                Something went wrong
            </h3>
        </div>
        <div class="panel-body">
         
             <h1>${errorMsg}</h1>
             <p>Please contact the administrator.</p>
                 
        </div>
    </div>
</div>

<%@ include file="includes2/footer.jsp" %>  