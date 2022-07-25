<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<html>
<head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<title>History Chart</title>
</head>
<body>
<% String username=request.getParameter("username");
   int i=0;
   String charttype=request.getParameter("type");
   if(charttype==null){charttype="column";}
    int[] count=new int[10];
	String[] from_loc=new String[10];
	int k=0;
	%><!--from_loc[0]="chennai";
	from_loc[1]="madurai";
	from_loc[2]="trichy";
	from_loc[3]="salem";
	from_loc[4]="pondy";--><%
   try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();
	ResultSet loc=stmt.executeQuery("Select distinct from_loc from `user history` where user_name= '"+username+"';");
	while(loc.next())
	{from_loc[k++]=loc.getString(1);}
	for(int j=0;j<k;j++){
	String r="select count(*) from `user history` where user_name = '"+ username +"' and from_loc = '"+ from_loc[i] +"' ;";
    ResultSet rs=stmt.executeQuery(r);
	rs.next();
	count[i++]=rs.getInt(1);
	}
	}
 
	 catch(Exception e)
 { out.println(e);}  
	%>
	<br><br><p align=center> <h2 align=center>Welcome <%=username%> </h2>
	          <h4 align=center> View your User History Chart</h4></p>
	
	<br><br>
<div id="container"></div>
<form action=history.jsp align="center">
    <input type="hidden" name="username" value="<%=username%>">
   <input type="submit" value="Go to History page">
</form>


<script >
document.addEventListener('DOMContentLoaded', () =>   {
	Highcharts.chart('container',{
		chart:{
			type: '<%=charttype%>'	
		},
		title:{
			text : 'History chart'
		},
		yAxis: {
			tickInterval: 1,
            min: 0,
			title:{
				text : 'No. of times travelled'
			}
		},
		 plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: false
            },
            showInLegend: true
        }
    },

		credits:{//enabled: false},
		   text: 'Go to Login page',
		   href : 'userLogin.html',
		   position: {align: 'right'},
	 	   style: {fontSize : "15px",
		    color:"blue"}
		   },
		xAxis:{
			//categories: ['Chennai','Madurai','Trichy','Salem','Pondy']
			categories: [<%for(i=0;i<k;i++){%>'<%=from_loc[i]%>',<%}%>]
		},
		series:[ {name: '<%=username%>' , 
		data: [<%for(i=0;i<k;i++){%>{ 
			    name: '<%=from_loc[i]%>',
				y:<%=count[i]%>
    } ,<%}%>]}
		]
	});
});
</script>
</body>
</html>
<!--lat and long
chennai- 13.0827° N, 80.2707° E
madurai- 9.9252° N, 78.1198° E
trichy- 10.7905° N, 78.7047° E
salem-  11.6643° N, 78.1460° E
pondy- 11.9416° N, 79.8083° E
-->