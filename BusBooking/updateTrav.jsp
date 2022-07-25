<html>
<head><title>Update Travels</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.updateTravels{  
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
a{  
    float: center;  
    background-color=white      	
}
</style>
</head>
<body>
   <div class="updateTravels">
   <h4 align=center>Admin Access - Update Travels</h4>
     <form action="update.jsp" method="post" autocomplete="off">
	  <label>Enter Trav_Id to update</label>
	  <input type="text" name="Trav_Id" id="Trav_Id" placeholder="Travels id">
	  <br><br>
	  <label>Enter number of seats</label>
	  <input type="text" name="Seats" id="Seats" placeholder="Number of Seats">
	  <br><br>
	  <input type="submit" name=log id=log value= "Update Travels">
	 </form>
	 <a href = "admin.jsp" >Go to admin page</a>	
   </div>
</body>