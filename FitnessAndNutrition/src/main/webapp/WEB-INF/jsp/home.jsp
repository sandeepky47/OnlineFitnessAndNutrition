<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style type="text/css">

body{
background-color: #dcdcdc45;
}
.container{
	margin: 10px;

}
.formStyle{
    background-color: #c7c7c7;
    box-shadow: 4px 7px 14px grey;
    padding: 20px;
}
#fitfit{
color:red;
  font-family: "Times New Roman";
 
}
#quote{
color:darkblue;
font-family: "Lucida Console";
font-size:15px;
}
.mb-4{
color:red;
}
img{
margin: 10px;
}
</style>
</head>
<body>


<header class="header" style="background-color:#FFFFE0 ;box-shadow: 1px 2px 10px grey;">

		<nav class="navbar navbar-style">
			<div class="container">
				<div class="navbar-header">
					<h2 id="fitfit" class=" display-3">Fitfit</h2>
					<h4 id="quote" class=" display-3">Online Fitness & Nutrition portal</h4>
				</div>
				<ul class="nav navbar-nav  navbar-right"	>
				<li><a href="/home"> Home</a></li>
				<c:if test="${sessionScope.userEmail.equals('no')}">
						<li>	<a  style="cursor: pointer" data-toggle="modal" data-target="#myModal">Login/Singup</a></li>
					</c:if>
				<c:if test="${!sessionScope.userEmail.equals('no')}">
						<li><p style="color: #4285c0;margin: 15px;"> Welcome , ${sessionScope.userName}</p></li>
						<li>	<a  href="/userProfile">Profile</a></li>
						<li>	<a  href="/bmicalculate">BMI Calculator</a></li>
						<li>	<a  href="/logout">Logout</a></li>
					</c:if>
				</ul>

			</div>

		</nav>
		
	</header>
	
	<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
         <form action="login" method="post">
 		<div class="form-group">
 		<label for="emailId">Email</label>
   		 <input class="form-control"type="text" id="emailId" name="emailId" placeholder="Email" required="required">
 		</div>
     	<div class="form-group">
     	<label for="password">Password</label>
    	<input class="form-control" type="password" id="password" name="password" placeholder=" Password" required="required">
     	</div>
     	    	
   		 <input type="submit" class="btn btn-primary btn-block" value="Submit">
  		</form>
  		<br>
  		<a class="btn btn-primary btn-block" href="/register">Register</a>
 
</div>

      </div>
     
    </div>

  </div>
  
 <!-- Headder end -->
 
<img src = "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" style="width:100%;" class="img-responsive ">
	
<jsp:include page="footer.jsp"></jsp:include>
	

<c:if test="${error ==1}">
<script type="text/javascript">
		window.alert("User/Password May be in correct");
</script>
</c:if>
</body>
</html>