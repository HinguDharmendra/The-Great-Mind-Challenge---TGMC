<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getParameter("requester")!=null && request.getParameter("select")!=null)
    {
	String requester1 = request.getParameter("requester");
    String requester = requester1.substring(0, requester1.length()-2);
    String value = request.getParameter("select");
    if(request.getParameter("submit")!=null)
    {
            Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
            if(value.equals("y"))
            {
                PreparedStatement  stat=con.prepareStatement("update group set approve='y' where requester='"+requester+"'");
                stat.executeUpdate();
            }
            else if(value.equals("n"))
            {
                PreparedStatement  stat=con.prepareStatement("delete from group where requester='"+requester+"'");
                stat.executeUpdate();
            }
                con.close();
                response.sendRedirect("welcome1.jsp");
    }
    else
    {
    	response.sendRedirect("error1.jsp");
    }
    }
    else
    {
    	response.sendRedirect("error1.jsp");
    }
%>

