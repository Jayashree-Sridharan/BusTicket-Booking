<html>
<head><title align=center>Admin Access</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.admin{  
        width: 382px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 80px;  
        background:  #ffb136;
        border-radius: 15px ;  
          
}  
h4{  
    text-align: center;  
    color: black;  
    padding: 20px;  
}  
label{  
    color: #0047b3;  
    font-size: 17px;  
}  
#Uname{  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
}   
  
a:hover, a:active , a:link {
    background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}   
</style>
</head>
<body>
<div class="admin" align=center >
   <h1 color=blue > Welcome Admin </h1>
    <h4 style="color = blue">To add Travels details</h4>
      <a href=addTravels.jsp>Click Here</a>
	  
    <h4 style="color=blue">To Delete a Travels</h4>
       <a href=delTrav.jsp>Click Here</a>
	   
    <h4 style="color=blue">To Update Travels details</h4>
        <a href=updateTrav.jsp>Click Here</a>
		
    <h4 style="color=blue">To View Travels Table</h4>
         <a href=viewTrav.jsp>Click Here</a>
		 
    <h4 style="color=blue">To View Customer table</h4>
        <a href=viewCustomer.jsp>Click Here</a>
<br><br>
<a href=homepage.jsp>Go to Homepage</a>
</div>
</body>
</html>