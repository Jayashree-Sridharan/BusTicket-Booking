<%@ page import=" java.io.* , java.util.* , java.sql.* , javax.mail.* "%>
<%@ page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ page import=" com.itextpdf.* "%>
<%@ page import=" com.itextpdf.text.*"%>
<%@ page import=" com.itextpdf.text.pdf.* "%>
<%@ page import=" com.itextpdf.text.pdf.PdfWriter "%>
<%@ page import=" com.itextpdf.text.pdf.PdfPTable "%>
<%@ page import=" com.itextpdf.text.pdf.PdfPCell "%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>

<html>
<head>
<title>Ticket</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.pdf{  
        width: 382px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 80px;  
        background:  #ffb136;
        border-radius: 15px ;  
} 
label{  
     
    font-size: 17px;  
}     
a{  
    float: center;   
    background-color=white      	
}
</style>
</head>
<body>
<div class="pdf">
<%
    String[] c_name=request.getParameterValues("name");
	String[] age = request.getParameterValues("age");
	int req_seats=Integer.parseInt(request.getParameter("req_seats"));
	String fromloc=request.getParameter("fromloc");
	String toloc=request.getParameter("toloc");
	int price=Integer.parseInt(request.getParameter("billprice"));
	String username=request.getParameter("username");
	String mailid=request.getParameter("mailid");
	String filename="D:\\"+username+"Ticket.pdf";
   try {    
	Document document = new Document();
	
	OutputStream outputStream = 
		new FileOutputStream(new File(filename)); 
        PdfWriter.getInstance(document, outputStream); 
        document.open();
		
        Paragraph para= new Paragraph("Bus Ticket Booking"+"\n"+"\n"+"Username : "+username+"\n"+
		                 "Mail id : "+ mailid+"\n"+
		                "Number of tickets : "+ req_seats+"\n"+
						"From Location: "+fromloc+"\n"+
						"To Location : "+toloc+"\n"+"\n"); 
	    para.setAlignment(Element.ALIGN_CENTER);
		document.add(para);
        PdfPTable table= new PdfPTable(3);
        table.addCell("S.No");
        table.addCell("Name");
        table.addCell("Age");
		
        for(int i=0;i<req_seats;i++)
		{
			table.addCell((i+1)+"");
			table.addCell(c_name[i]);
			table.addCell(age[i]);
		}
	    document.add(table);
        Paragraph p= new Paragraph("----Total Price :" + " "+ price +" rupees----"+"\n");
		p.setAlignment(Element.ALIGN_CENTER);
		document.add(p);
        document.add(new Paragraph("*Have a copy of this ticket during your travel."));		
        document.close();
        outputStream.close();
        %>
		<p align= center>Your Ticket has been generated<br></p>
		<%
} catch(Exception e)
 { out.println(e);}%>
	
	<!--sending mail-->
	<%
	String recipient = mailid;
    final String sender = "jayashree302001@gmail.com";
	final String password = "Pswd@123";
	String host = "smtp.gmail.com";
	String port = "587";
	
    Properties properties = System.getProperties();
	properties.setProperty("mail.transport.protocol", "smtp");
 	properties.setProperty("mail.smtp.host", host);
 	properties.setProperty("mail.smtp.user",sender);
	properties.setProperty("mail.smtp.password",password);
	properties.setProperty("mail.smtp.port", port);
	properties.setProperty("mail.smtp.auth", "true");
	properties.put("mail.smtp.starttls.enable", "true");
	
	Session ses = Session.getInstance(properties, new Authenticator() {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(sender,password);
    } 
	});
	MimeMessage msg = new MimeMessage(ses);
	try{
		msg.setFrom(new InternetAddress(sender));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		msg.setSubject("Bus Ticket");
		
		Multipart emailcontent=new MimeMultipart();
		
		MimeBodyPart textpart= new MimeBodyPart();
		textpart.setText("Hello "+username+"..!"+"\n"+"Please find the attachment of your tickets."+"\n"+" Have a copy of the ticket during your journey.");
	
	    MimeBodyPart attachment= new MimeBodyPart();
		attachment.attachFile(filename);
		
		emailcontent.addBodyPart(textpart);
		emailcontent.addBodyPart(attachment);
		
		msg.setContent(emailcontent);
		
		Transport.send(msg);
		%>
		<p align=center>Download your Ticket from your registered mailid</p>
		<%
	}
     catch(Exception e)
      { out.println(e);}    

	
	
	
	%>
<p align=center><a href="homepage.jsp">Go to Homepage</a></p>
</div>
</body>
</html>