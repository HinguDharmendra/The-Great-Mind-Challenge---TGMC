<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.security.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ResultSet rs1=null;
    String firstname = request.getParameter("fname");
    String middlename = request.getParameter("mname");
    String lastname = request.getParameter("lname");
    String email = request.getParameter("email");
    String password =request.getParameter("password");
    String contactNo = request.getParameter("mobile_no");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    int countmail=0;
    if(request.getParameter("Submit")!=null)
    {
            Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st = con.createStatement();
            String strQuery=null;

            strQuery = "select * from user where email='"+email+"'";
            rs1 = st.executeQuery(strQuery);
            while(rs1.next())
            {
                countmail++;
            }
            if(countmail>0)
            {
                out.println("Email is already registered.");
                response.sendRedirect("error.jsp");
                con.close();
            }
            else
            {
                MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
                mdAlgorithm.update(password.getBytes());
                byte[] digest = mdAlgorithm.digest();
                StringBuffer hexString = new StringBuffer();
                for (int i = 0; i < digest.length; i++)
                {
                    password = Integer.toHexString(0xFF & digest[i]);

                 if (password.length() < 2)
                      {
                        password = "0" + password;
                      }

                 hexString.append(password);
                }
           
        
            PreparedStatement  stat=con.prepareStatement("insert into user (fname, mname, lname, email, gender, password, mobile_no, dob) values(?,?,?,?,?,?,?,?)");
                stat.setString(1, firstname);
                stat.setString(2, middlename);
                stat.setString(3, lastname);
                stat.setString(4, email);
                stat.setString(5, gender);
                stat.setString(6, hexString.toString());
                stat.setString(7, contactNo);
                stat.setString(8, dob);
                stat.executeUpdate();

                con.close();

                File root = new File("C:/Data");
                if(!root.exists())
                {root.mkdir();}
                File newfolder = new File(root, "/"+email);
            	 newfolder.mkdir();
                response.sendRedirect("success.jsp");
            }
  }
    

            else
    {
        out.println("You need to submit your form");
    }
%>

