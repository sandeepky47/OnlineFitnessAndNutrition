<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Exercises and Diets for underweight</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style type="text/css">
body{
background-color: #dcdcdc45;
}

.userStyle{
padding: 10px;
    margin: 10px;
}

.container{
	margin: 10px;

}

.right{
            padding-left: 50px;
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
#exercise{
color:darkslateblue;
text-decoration: underline;
}
#diet{
color:darkslateblue;
text-decoration: underline;
}
.formStyle{
    background-color: #c7c7c7;
    box-shadow: 4px 7px 14px grey;
    padding: 20px;
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
<header class="header" style="background-color: #FFFFE0;box-shadow: 1px 2px 10px grey;">

		<nav class="navbar navbar-style">
			<div class="container">
				<div class="navbar-header">
					<h2 id="fitfit" class=" display-3">Fitfit</h2>
					<h4 id="quote" class=" display-3">Online Fitness & Nutrition portal</h4>
				</div>
				<ul class="nav navbar-nav  navbar-right"	>
					<c:if test="${sessionScope.admin ==1}">
				<li><a href="/home"> Home</a></li>
				</c:if>
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
 
 
	<div class="container">
<div class="col-lg-6 ">
<h2 id="exercise" >Workout Plan</h2>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Types & Time</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Walking</th>
      <td>${walkresult}</td>
  
    </tr>
    <tr>
      <th scope="row">Running</th>
      <td>${runresult}</td>
     
    </tr>
    <tr>
      <th scope="row">Yoga</th>
      <td>${yogaresult}</td>
     
    </tr>
     <tr>
      <th scope="row">Weight Training</th>
      <td>${weightresult}</td>
     
    </tr>
     <tr>
      <th scope="row">Swimming</th>
      <td>${swimresult}</td>
     
    </tr>
     <tr>
      <th scope="row">Sports</th>
      <td>${sportresult}</td>
     
    </tr>
  </tbody>
</table>
</div>

<div class="col-lg-6">
<div class="right">
<h2 id="diet" >Diet & Recipe Plan</h2>
<table class="table table-dark">
  <thead >
    <tr>
      <th scope="col">#</th>
      <th scope="col">Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Breakfast</th>
      <td>${breakfastresult}</td>
    </tr>
    <tr>
      <th scope="row">Lunch</th>
      <td>${lunchresult}</td>
    
    </tr>
    <tr>
      <th scope="row">Dinner</th>
      <td>${dinnerresult}</td>
  
    </tr>
     <tr>
      <th scope="row">Special Recipe</th>
      <td>${specialresult}</td>
    
    </tr>
  </tbody>
</table>
</div>
</div>
</div>
		
		
		
	
 
 
 



<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>