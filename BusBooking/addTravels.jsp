<html>
<head><title>Add Travels</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.addTravels{  
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
   
    <div class="addTravels" align=center >   
    <h2 align=center>Add Travels Details</h2><br> 	
    <form action="addTrav.jsp" id="addTravels" method="post" autocomplete="off">    
        <!--<label><b>Trav_id  </b>    
        </label>    
        <input type="text" name="Trav_id" id="Trav_id" placeholder="Travels id">    
        <br><br>    -->
        <label><b>Trav_Name     
        </b>    
        </label>    
        <input type="text" name="Trav_Name" id="Trav_Name" placeholder="Travels Name">    
        <br><br>  
        <label><b>Seats </b>    
        </label>    
        <input type="text" name="Seats" id="Seats" placeholder="Available Seats">    
        <br><br>	
        <label><b>Price  </b>    
        </label>    
        <input type="text" name="Price" id="Price" placeholder="Price">    
        <br><br>	
         <label><b>From_Loc  </b>    
        </label>    
        <input type="text" name="From_Loc" id="From_Loc" placeholder="From Location">    
        <br><br>
        <label><b>To_Loc  </b>    
        </label>    
        <input type="text" name="To_Loc" id="To_Loc" placeholder="To Location">    
        <br><br>		
        <input type="submit" name="log" id="log" value="Add Details">       
           
    </form> 	
    <a href = "admin.jsp" >Go to admin page</a>	
</div>    
</body>    
</html>  