<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@include file="controller.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
Connection con20 = null;
Class.forName("com.ibm.db2.jcc.DB2Driver");
con20 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
Statement st20 = con20.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs20 = st20.executeQuery("select * from group where requestee='"+session.getAttribute("Username")+"' and approve='n'");
boolean indicator2=false;
ResultSetMetaData rsmd20 = rs20.getMetaData();
int numberOfColumns20 = rsmd20.getColumnCount();

if(rs20.next())
{indicator2=true;%>
<form action="add_grp.jsp" method="post">
<table id="port" cellspacing="25px" align="center">
    <caption>Group Approval Requests</caption>
    <tr>
        <th>Requester</th><th></th>
        <th> </th>
        <th> </th>
    </tr>

<%}
rs20.beforeFirst();
while(rs20.next())
{%><tr><%
    for(int i=1;i<=numberOfColumns20;i+=4)
    {%>
    <td><input type="radio" name="requester" value="<%out.println(rs20.getString(i));%>" required="required"/><%out.println(rs20.getString(i).toString());%></td>
    <td><input type="radio" name ="select" value="y" required="required"/>Accept</td>
    <td><input type="radio" name ="select" value="n" required="required"/>Reject</td>
    <%}
%></tr><%}
if(indicator2==true){%>

        <tr align="center">
            <td colspan="3" align="center">
                <input type="submit" name="submit" value="Approval"/>
            </td>
        </tr>
    </table>
</form>
<%}
if(indicator2==false)
{
    out.println("No Requests pending.");
}
con20.close();
%>

