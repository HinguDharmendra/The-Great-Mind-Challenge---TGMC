<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@include file="controller.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
Connection con10 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con10 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st10 = con10.createStatement();
            Statement st11 = con10.createStatement();
            Statement st01 = con10.createStatement();

ResultSet rs10 = st10.executeQuery("select requestee from group where requester='"+session.getAttribute("Username")+"'");
ResultSetMetaData rsmd10 = rs10.getMetaData();
int numberOfColumns8 = rsmd10.getColumnCount();

ResultSet rs01 = st01.executeQuery("select requester from group where requestee='"+session.getAttribute("Username")+"'");
ResultSetMetaData rsmd01 = rs01.getMetaData();
int numberOfColumns01 = rsmd01.getColumnCount();
%>
<form action="share.jsp" method="post">
<table id="port" cellspacing="25px" align="center">
    <tr><td>Select user to be whom you want share files.</td></tr>
    

    <tr><td><select name="user">
<%
while(rs10.next())
{
    for(int i=1;i<=numberOfColumns8;i++)
    {
        %>
        <option value="<%out.println(rs10.getString(i));%>"><%out.println(rs10.getString(i));%></option>
        <%
    }
}
while(rs01.next())
{
    for(int i=1;i<=numberOfColumns01;i++)
    {
        %>
        <option value="<%out.println(rs01.getString(i));%>"><%out.println(rs01.getString(i));%></option>
        <%
    }
}
%>
    </select></td></tr>
    <tr><td>Select file to shared.(<u>At a time only one file can be shared because of the security reasons</u>)</td></tr>
   
    <tr><td></td></tr>

<%
ResultSet rs11 = st11.executeQuery("select filename,loc from file where users='"+session.getAttribute("Username")+"'");
ResultSetMetaData rsmd11 = rs11.getMetaData();
int numberOfColumns11 = rsmd11.getColumnCount();
while(rs11.next())
{
    for(int i=1;i<=numberOfColumns11;i+=2)
    {
        %>
        <tr><td><input type="radio" name="path" value="<%out.println(rs11.getString(i+1));%>" required="required"/><%out.println(rs11.getString(i));%></td></tr>
        
        <%
    }
}
%>
    <tr> <td> <input type="submit" name="submit" value="Submit"/></td></tr>
    
</table>
</form>
<%
con10.close();
%>
