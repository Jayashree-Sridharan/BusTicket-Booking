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

<title> Map</title>
</head>
<body>
<% String username=request.getParameter("username");
   int i=0;
   String charttype=request.getParameter("type");
    int[] count=new int[30];
	String[] from_loc=new String[30];
	int k=0;
	double[] lat=new double[30];
	double[] lon=new double[30];
	%><!--from_loc[0]="chennai";
	from_loc[1]="madurai";
	from_loc[2]="trichy";
	from_loc[3]="salem";
	from_loc[4]="pondy";--><%
   try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();
	ResultSet a=stmt.executeQuery("select * from cities ;");
     while(a.next())	
	{		
		from_loc[k]=a.getString(2);
		lat[k]=Double.parseDouble(a.getString(3));
		lon[k]=Double.parseDouble(a.getString(4));
		k++;
	}
	
   }
 
	 catch(Exception e)
 { out.println(e);}  
	%>
<br><br><h2 align=center> Map... Welcome..!</h2>
<div id="container" width=100% height=100%>
</div>
<p align=center>*Zoom in to view clearly*</p>
<p align=center><a href ="userLogin.html" align=center>Go to Sign-in page</a></p>
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
				
    } ,<%}%>]
        }]
    });

})();

</script>

</body>
</html>