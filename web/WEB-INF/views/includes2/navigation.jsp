<!--
<div class="well">
    <h4>
        <a href="<c:url value='/search' />">Search User</a>
        <a href="<c:url value='/register' />">Add New User</a>
        <a href="<c:url value='/allusers' />">Users</a>
        <a href="<c:url value='/query' />">Query</a>
        <a href="<c:url value='/newuser' />">Add New User 2</a>
    </h4>
</div>
-->

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" <a href="<c:url value='/register' />">Task App</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="<c:url value='/register' />">Home</a></li>
            <li> <a href="<c:url value='/findUser' />">Search User</a></li>
             <li><a href="<c:url value='/register' />">Add New User</a></li>
             <li><a href="<c:url value='/allusers' />">Users</a></li>
             <li><a href="<c:url value='/query' />">Query</a></li>
             <li><a href="<c:url value='/newuser' />">Add New User 2</a> </li>
        </ul>
    </div>
</nav>