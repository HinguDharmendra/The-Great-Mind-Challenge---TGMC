<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="controller.jsp" %>
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
            <div class="loc" id="hiuser">
                Hi, <%out.print(session.getAttribute("Username"));%>&nbsp;&nbsp;
                <a href="logout.jsp">
                    <font color="red"> Logout</font>
                </a>|
                <a href="welcome1.jsp">
                    <font color="red"> Home</font>
                </a>
            </div><br/>
                <div class="slider-wrap">
                    <div id="slider1" class="csw">
                        <div class="panelContainer">
                            <div class="panel" title="Results">
                                <div class="wrapper">
                                                        <%
                                    boolean indicator=false;
                                    String search=request.getParameter("guser");
                                    if(request.getParameter("submit")!=null)
                                    {
                                    try
                                    {
                                        Class.forName("com.ibm.db2.jcc.DB2Driver");
                                        Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
                                        Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

                                    ResultSet rs = st.executeQuery("select fname, mname, lname, email from user where email not in 'admin' and  email like '%"+search+"%' or fname like '%"+search+"%' or lname like '%"+search+"%'");
                                    ResultSetMetaData rsmd = rs.getMetaData();
                                    int numberOfColumns = rsmd.getColumnCount();
                                    if(rs.next())
                                    {indicator=true;%>
                                    <form method="post" action="groupb.jsp">
                                    <table id="port" cellspacing="25px" align="center">
                                        <caption><h3>Users</h3></caption>
                                        <tr>
                                        <th>Select</th>
                                        <th>First_Name</th>
                                        <th>Middle_Name</th>
                                        <th>Last_Name</th>
                                        <th>Email</th>
                                        </tr>
                                    <%}
                                    int i = 1;
                                    rs.beforeFirst();
                                    while(rs.next())
                                    {%><tr><td><input type="radio" name="group" value="<%out.println(rs.getString(i+3));%>" required="required"/></td><%
                                        for(;i<=numberOfColumns;i++)
                                        {%>
                                    <td align="center">
                                        <%out.println(rs.getString(i));%></td><%
                                        }
                                    %><td><input type="submit" name="submit" value="Send_Request"/></td></tr><% }
                            
                                    %>
                                        </table>
                                    </form>
                                        <br/><br/>




                                    <%
                                    if(indicator==false)
                                    {
                                        out.println("No User Found.");
                                    }
                                    }
                                    catch(Exception E)
                                    {
                                        out.print(E.getMessage());
                                    }
                                    }
                                    %>
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
