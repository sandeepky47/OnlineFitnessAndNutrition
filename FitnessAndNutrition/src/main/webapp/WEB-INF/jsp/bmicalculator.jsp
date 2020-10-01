<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Body Mass Index</title>

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
.cssmargin{
margin:40px;
}

.right{ padding-left: 50px; }

#fitfit{
color:red;
  font-family: "Times New Roman";
 
}
#quote{
color:darkblue;
font-family: "Lucida Console";
font-size:15px;
}

        #headresult{
            background-color:forestgreen;
            color: white;
             padding-left: 20px;
        }
        #result{
            font-size: 28px;
            font-weight: bold;
           
        }
         #fact{
            font-size: 20px;
            font-weight: bold;
           
        }
        #bmi{
            color: #FF6347;
            text-align: center
        }

.formStyle{
    background-color: #c7c7c7;
    box-shadow: 4px 7px 14px grey;
    padding: 20px;
}
 #submit:hover {
    color: blue;
    background-color: white;
    font-weight: bold;
}
        
.mb-4{
color:red;
}
img{
margin: 10px;
}

</style>
<!--  
 <script>
function bmi () {
	var height = Number(document.getElementById("height").value);
	var weight = Number(document.getElementById("weight").value);
    var finalheight=height/100;
	var result = weight / (finalheight * finalheight);
    var category;
    if(result<18.5)
    {   category="Underweight";  
    }
    else if(result>=18.5 && result<=25)
         {category="Normal"; }
    else{
        category="Overweight";
    }
    
	document.getElementById("result").innerHTML = "> Your BMI score is : " + result.toFixed(3) +" kg/m2"+"            ( "+category+" )";
    
	}
</script>      -->

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
			<!--  		<c:if test="${sessionScope.admin ==1}">
				<li><a href="/home"> Home</a></li>
				</c:if>
			-->          <li><a href="/home"> Home</a></li>
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
	<div class=row>
		<div class="col-lg-6 formStyle">
            
			<form action="bmiresult" method="post">
                <h2 id="bmi">BMI CALCULATOR</h2>
			<div class="form-group">
					  <label for="age">Age</label>
					<input class="form-control" type="text" placeholder="Enter your age" required="required">
			</div>
                
                
                <div class="form-group">
	<label for="gender">Gender</label>
	<select class="form-control"name="gender"> 
	<option value="1">Male</option>
	<option value="2">Female</option>

	</select>
	</div>
	
		
	<div class="form-group">
	<label for="height">Height</label>
	 <input class="form-control" type="text" placeholder="cm" id="height" name="height" required="required">
	</div>
	
	
	
	<div class="form-group">
	<label for="weight">Weight</label>
	 <input class="form-control" type="text" placeholder="kg" id="weight" name="weight" required="required">
	</div>
                
	
  <input type="submit" id="submit" value="Calculate" class="btn btn-primary btn-block" />
  <input type="reset" id="submit" value="Clear" class="btn btn-primary btn-block"/>
               
			</form>  
			                      
           <!--                  -->
		</div>
		
		<div class="col-lg-6 ">
            <div class="right">
			<form >
                <h2 id="headresult">Result</h2>
                
			<div class="form-group">
                <p id="fact">Healthy BMI range: 18.5 kg/m2 - 25 kg/m2</p> 
					<p id="result">${fresult}</p>  
					
					<p class="cssmargin"></p>
					<c:if test = "${myresult > 25}">
                <p style="font-style: italic;font-size:17px;">Click below to get your diet and exercise tips- </p>
                <p><a style="background:red;font-size:22px;color:white;" href="/over">Overweight</a> </p>
               </c:if>
               
               	<c:if test = "${myresult < 18.5}">
                <p style="font-style: italic;font-size:17px;" >Click below to get your diet and exercise tips- </p>
                <p><a style="background:goldenrod; font-size:22px;color:white;" href="/under">Underweight</a> </p>
               </c:if>
               
               	<c:if test = "${myresult>= 18.5 && myresult<=25}">
                <p style="font-style: italic;font-size:17px;" >Click below to get your diet and exercise tips- </p>
                <p><a style="background:olive; font-size:22px;color:white;" href="/norm">Normal</a> </p>
               </c:if>
					     
					        
			</div>
                
             
			</form>    
                </div>
           
		</div>
		
	</div>
</div>

 
 
 



<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>