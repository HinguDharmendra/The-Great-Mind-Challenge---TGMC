<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.security.*"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@include file="controller.jsp"%>
 <script type="text/javascript">
      <%String userd=""+session.getAttribute("Username");%>
        <%String passwordd=""+session.getAttribute("Password");
        String pswd=""+session.getAttribute("pswd");%>
      
          
    
  $(function() {
    var email = $( "#emailv" ),
      password = $("#passwordv"),
      allFields = $( [] ).add( email ).add( password ),
      tips = $( ".validateTips" );
      var u='<%=userd%>';
      var p='<%=pswd%>';
      var bValid = false;
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }

    function checkRegexp( u, userval, msg ) {
      if ( !( userval== u.val()  ) ) {
        u.addClass( "ui-state-error" );
        updateTips( msg );
        return false;
      } else {
        return true;
      }
    }

    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Submit": function() {

          allFields.removeClass( "ui-state-error" );

            // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
          bValid = bValid || checkRegexp( email,u, "Invalid Email " );
          bValid = bValid && checkRegexp( password, p, "Invalid password" );

          if ( bValid ) {
            $( this ).dialog( "close" );
          }
          },
        Cancel: function() {
          $( this ).dialog( "close" );
           $('.rdSelect').prop('checked',false);
        }
      },
      close: function() {

            allFields.val( "" ).removeClass( "ui-state-error" );
            if( bValid==false ){ $('.rdSelect').prop('checked',false);}
            bValid=false;
         }
    });

    $( ".rdSelect" ).click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  </script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<div id="dialog-form" title="Please enter your details">
  <p class="validateTips">All form fields are required.</p>
    <form>
  <fieldset>
    <label for="emailv">Email</label>
    <input type="text" name="emailv" id="emailv" value="" class="text ui-widget-content ui-corner-all" />
    <label for="password">Password</label>
    <input type="password" name="passwordv" id="passwordv" value="" class="text ui-widget-content ui-corner-all" />
  </fieldset>
  </form>
</div>
<%
            Connection con2 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con2 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
            Statement st2 = con2.createStatement();

ResultSet rs2 = st2.executeQuery("select filename,loc from file where users='"+userd+"' and type='d'");
ResultSetMetaData rsmd2 = rs2.getMetaData();
int numberOfColumns2 = rsmd2.getColumnCount();%>
<h3> Select File to Download</h3>
<form name="formd" action="download.jsp" method="post">
    <table id="port" cellspacing="25px">
        <tr><td>

<%
while(rs2.next())
{
    for(int i=1;i<=numberOfColumns2;i+=2)
    {
        %>
        <ul type="none">
            <li>
                <input class="rdSelect" type="radio" name="pname" value="<%out.println(rs2.getString(i+1));%>" required="required"/><%out.println(rs2.getString(i));%>
            </li>

        </ul>
        <%
    }
}%></td></tr><tr><td align="center"><input type="submit" name="submit" value="Download"/></td></tr></table>
</form><%
con2.close();
%>


        <form action="uploaddocB.jsp"  ENCTYPE="multipart/form-data" method="post">
            <table>

    <tr>
        <td><B>Document Upload</B></td>
    </tr>

    <tr>
        <td><b>Choose the Document To Upload:</b></td>
        <td><INPUT NAME="file" TYPE="file" accept="text/*, .pdf, .doc" required="required"></td>
    </tr>

    <tr>
        <td><input type="submit" value="Upload File" name="submit"> </td>
    </tr>
            </table>
        </form>
