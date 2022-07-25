<html>
<head><title>Delete Travels</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.delTravels{  
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
   <div class="delTravels">
   <h4 align=center>Admin Access - Delete Travels</h4>
     <form action=delete.jsp method="post" autocomplete="off">
	  <label>Enter Trav_Id to delete</label>
	  <input type="text" name="Trav_Id" id="Trav_Id" placeholder="Travels id">
	  <br><br>
	  <input type="submit" name=log id=log value= "Delete Travels">
	 </form>
	 <a href = "admin.jsp" >Go to admin page</a>	
   </div>
</body>