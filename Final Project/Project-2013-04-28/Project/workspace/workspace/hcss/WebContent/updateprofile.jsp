<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="controller.jsp"%>

<%
    String user=""+session.getAttribute("Username");
    String data[] = new String[10];
Connection con2 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con2 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st2 = con2.createStatement();

ResultSet rs2 = st2.executeQuery("select * from user where email='"+user+"'");
ResultSetMetaData rsmd2 = rs2.getMetaData();
int numberOfColumns2 = rsmd2.getColumnCount();
while(rs2.next())
{
    for(int i=1;i<=numberOfColumns2;i++)
    {
        data[i-1]=rs2.getString(i);
    }
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Highly Confidential Security System</title>
        <link href="css/hcss.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Highly Confidential Security System"/>
		<meta name="keywords" content="VJTI, Security, system, highly confidential, confidential"/>
		<meta name="author" content="Dharmendra Hingu, Harnish Gevaria, Meenali Kaprani"/>
                <script src="js/jquery-1.2.1.pack.js" type="text/javascript"></script>
                <script src="js/jquery-easing.1.2.pack.js" type="text/javascript"></script>
                <script src="js/jquery-easing-compatibility.1.2.pack.js" type="text/javascript"></script>
                <script src="js/coda-slider.1.1.1.pack.js" type="text/javascript"></script>
                <script type="text/javascript"  src="js/DD_roundies_0.0.2a-min.js"></script>
                <script type="text/javascript">
                    jQuery(window).bind("load", function() {
                                    jQuery("div#slider1").codaSlider()
		});
                </script>
                <script type="text/javascript" >

  function ValidateEmail()
  {
  var uemail = register.email;
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if(uemail.value.match(mailformat))
  {
  return true;
  }
  else
  {
  alert("You have entered an invalid email address!");
  uemail.value="";
  uemail.focus();

  return false;
  }
  }
  function allLetter(value)
  {
  var uname = value;
  var letters = /^[A-Za-z]+$/;
  if(uname.value.match(letters))
  {
  return true;
  }
  else
  {
  alert('Field must have alphabet characters only');
  uname.value="";
  uname.focus();
  return false;
  }
  }
  function allNum(value)
  {
  var uno = value;
  var letters = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
  if(uno.value.match(letters))
  {
  return true;
  }
  else
  {
  alert('Mobile Number must be Numeric and 10 digit');
  uno.value="";
  uno.focus();
  return false;
  }
  }
                </script>

</head>
<body background="images/distressed.jpeg">
    <div id='cream'>
	<div id="hcss_title_bar_wrapper">
		<div id="hcss_logo">
                  <img src="images/logob300150.png" alt="LOGO"/>
		</div>
		<div id="hcss_title_bar">
			<p id='head'>Highly Confidential Security System</p>
		</div>
	</div>

	<div id="search" align="right">
		<form method="post" action ="search.jsp">
			<input type="text" name='search'></input>
			<input type="submit" name='submit' value='Search'></input>
		</form>
	</div>
        </div>
    	<div id="hcss_content_wrapper">
		
                    <div class="loc" id="hiuser">Hi, <%out.print(session.getAttribute("Username"));%>&nbsp;&nbsp;
                <a href="logout.jsp">
                    <font color="red">Logout</font>
                </a>
                |
                 <a href="welcome1.jsp#1"><font color="red">HOME</font></a>
               </div><br/>
                    <div class="slider-wrap">
                            <div id="slider1" class="csw">
                                    <div class="panelContainer">
                                            <div class="panel" title="Update_Profile">
                                                <div class="wrapper">
                                                    <font color="white">
                                                    <form action="updateinfo.jsp" method="post">
                                                        
                                                        <table cellspacing="25px">

                                                                <tr>
                                                                    <th align="center">First_Name</th>
                                                                    <th align="center">Middle_Name</th>
                                                                    <th align="center">Last_Name</th>
                                                                </tr>
                                                                  <tr>
                                                                    <td><input type="text" name="fname" value="<%out.println(data[0]);%>" onchange="allLetter(fname);"/></td>
                                                                    <td><input type="text" name="mname" value="<%out.println(data[1]);%>" onchange="allLetter(fname);"/></td>
                                                                    <td><input type="text" name="lname" value="<%out.println(data[2]);%>" onchange="allLetter(fname);"/></td>
                                                                </tr>
                                                        </table>
                                                        
                                                        
                                                        
                                                        <table cellspacing="25px">
                                                                <tr>
                                                                    <th align="center">Mobile_No</th>
                                                                    <th align="center">Date_of_Birth</th>
                                                                </tr>
                                                                <tr>
                                                                    <td><input type="text" name="mobile_no" value="<%out.println(data[7]);%>" onchange="allNum(mobilr_no);"/></td>
                                                                    <td><input type="text" name="dob" value="<%out.println(data[8]);%>"/></td>
                                                                </tr>
                                                        </table>
                                                    <table align="center">
                                                                <tr align="center">
                                                                    <td>
                                                                        <input type="submit" value="Update" name="submit"/>
                                                                    </td>
                                                                </tr>

                                                    </table>
                                                    </form>
                                                    </font>
                                                </div>
                                            </div>

                                    </div>
                            </div>
                    </div>
               
        </div>
        <div id="templatemo_footer">

        Copyright © 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->
</body>
</html>
