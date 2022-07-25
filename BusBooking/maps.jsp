<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<html>
<head>
 <script src="https://code.highcharts.com/maps/highmaps.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="https://code.highcharts.com/maps/modules/offline-exporting.js"></script>
<script src="https://code.highcharts.com/maps/modules/accessibility.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<title>History Map</title>
</head>
<body>
<% String username=request.getParameter("username");
   int i=0;
   String charttype=request.getParameter("type");
    int[] count=new int[10];
	String[] from_loc=new String[10];
	int k=0;
	double[] lat=new double[10];
	double[] lon=new double[10];
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
	
	for(i=0;i<k;i++)
	{
		ResultSet a=stmt.executeQuery("select * from cities where city = '"+from_loc[i]+"';");
		a.next();
		lat[i]=Double.parseDouble(a.getString(3));
		lon[i]=Double.parseDouble(a.getString(4));
		
	}
	
   }
 
	 catch(Exception e)
 { out.println(e);}  
	%>
<br><br><h2 align=center>User History map... Welcome <%=username%>..!</h2>
<div id="container" width=100% height=100%>
</div>
<p align=center>*Zoom in to view clearly*</p>
<form action=history.jsp align="center">
    <input type="hidden" name="username" value="<%=username%>">
   <input type="submit" value="Go to History page">
</form>
<p align=center><a href ="homepage.jsp" align=center>Go to Homepage</a></p>
<script>
(async () => {

    const topology = await fetch(
        'https://code.highcharts.com/mapdata/countries/in/in-all.topo.json'
    ).then(response => response.json());

    // Initialize the chart
    Highcharts.mapChart('container', {

        chart: {
            map: topology
        },

        title:{text: 'Bus Ticket Booking'},
		 subtitle: {
          text: 'Frequency of travel from a city'
      },

        credits:{
		   enabled:false
		   },

        mapNavigation: {
            enabled: true
        },

        tooltip: {
            headerFormat: '',
            pointFormat: '<b>{point.name}</b><br>Frequency: {point.y}'
        },

        series: [{
            // Use the gb-all map with no data as a basemap
            name: 'India',
            borderColor: '#000000',
            nullColor: '#FFFFE0',
            showInLegend: false
        }, {
            name: 'Separators',
            type: 'mapline',
            nullColor: '#707070',
            showInLegend: false,
            enableMouseTracking: false,
            accessibility: {
                enabled: false
            }
        }, {
            type: 'mappoint',
            name: 'From Location',
            accessibility: {
                point: {
                    valueDescriptionFormat: '{xDescription}. Lat: {point.lat:.2f}, lon: {point.lon:.2f}.'
                }
            },
            color: Highcharts.getOptions().colors[1],
            data:[<%for(i=0;i<k;i++){%>{ 
			    name: '<%=from_loc[i]%>',
                lat: <%=lat[i]%>,
                lon: <%=lon[i]%>,
				y:<%=count[i]%>
    } ,<%}%>]
        }]
    });

})();

</script>

</body>
</html>