<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@include file="controller.jsp" %>

<%
    String user=""+session.getAttribute("Username");
    String data[] = new String[6];
Connection con2 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con2 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st2 = con2.createStatement();

ResultSet rs2 = st2.executeQuery("select psprt, pannum, pinnum, dlic, adno, bno from shortcuts where users='"+user+"'");
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
                function number(value)
                          {
                          var uname = value;
                          var letters = /^[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]$/;
                          if(uname.value.match(letters))
                          {
                          return true;
                          }
                          else
                          {
                          alert('Field must have 11 digit alphanumerals only');
                          uname.value="";
                          uname.focus();
                          return false;
                          }
                          }
                    function pin_number(value)
                          {
                          var uname = value;
                          var letters = /^[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]$/;
                          if(uname.value.match(letters))
                          {
                          return true;
                          }
                          else
                          {
                          alert('Field must have 4 digits only');
                          uname.value="";
                          uname.focus();
                          return false;
                          }
                          }

                </script>

</head>
<body background="images/distressed.jpeg">
    <font color="white">
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
                                            <div class="panel" title="Add Content">
                                                <div class="wrapper">
                                                        <font color="white">
                                                            <table cellspacing="25px" id="port">
                                                                <form method="post" action="adddata.jsp">
                                                                    <tr>
                                                                        <td>
                                                                            Passport Number:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" size="10" name="psprt" onchange="number(psprt);"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>

                                                                        <td>
                                                                            PAN card Number:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" size="10" name="pannum" onchange="number(pannum);"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>

                                                                        <td>
                                                                            ATM PIN Number:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" size="4" name="pinnum" onchange="pin_number(pinnum)"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Driving License Number:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" size="10" name="dlic" onchange="number(dlic);"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Adhar card Number:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" size="10" name="adno" onchange="number(dlic);"/>
                                                                        </td>
                                                                    </tr><tr>
                                                                        <td>
                                                                            Bank Account Number:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" size="10" name="bno" onchange="number(dlic);"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr align="center">
                                                                        <td><input type="submit" name="submit" value="Submit"/></td>
                                                                    </tr>

                                                                </form>
                                                            </table>
                                                        </font>
                                        		</div>
                                            </div>
                                            <div class="panel" title="Change Content">
                                                <div class="wrapper">
                                                    <font color="white">
                                                    <form action="changedata.jsp" method="post">
                                                        <table cellspacing="25px"id="port">
                                                        
                                                                <tr>
                                                                    <th align="center">Passport Number</th>
                                                                    <th align="center">PAN card Number</th>
                                                                    <th align="center">ATM PIN Number</th>
                                                                    <th align="center">Driving License Number</th>
                                                                    <th align="center">Adhar Card Number</th>
                                                                    <th align="center">Bank Account Number</th>
                                                                </tr>
                                                                <tr>
                                                                    <td><input type="text" name="psprt" value="<%out.println(data[0]);%>" onchange="number(psprt);"/></td>
                                                                    <td><input type="text" name="pannum" value="<%out.println(data[1]);%>" onchange="number(pannum);"/></td>
                                                                    <td><input type="text" name="pinnum" value="<%out.println(data[2]);%>" onchange="number(pannum);"/></td>
                                                                    <td><input type="text" name="dlic" value="<%out.println(data[3]);%>" onchange="number(dlic);"/></td>
                                                                    <td><input type="text" name="adno" value="<%out.println(data[4]);%>"/></td>
                                                                    <td><input type="text" name="bno" value="<%out.println(data[5]);%>"/></td>
                                                                        <%con2.close();%>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td colspan="4">
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
    </font>
      <div id="templatemo_footer">

        Copyright © 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->
</body>
</html>
