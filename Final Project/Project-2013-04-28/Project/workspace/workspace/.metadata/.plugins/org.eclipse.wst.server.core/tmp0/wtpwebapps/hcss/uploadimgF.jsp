<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@include file="controller.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
 <%String useri=""+session.getAttribute("Username");%>
        <%String passwordi=""+session.getAttribute("Password");
        String pswdi=""+session.getAttribute("pswd");%>



  $(function() {
    var email = $( "#emailv" ),
      password = $("#passwordv"),
      allFields = $( [] ).add( email ).add( password ),
      tips = $( ".validateTips" );
      var u='<%=useri%>';
      var p='<%=pswdi%>';
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
Connection con3 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con3 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st3 = con3.createStatement();

ResultSet rs3 = st3.executeQuery("select filename,loc from file where users='"+useri+"' and type='i'");
ResultSetMetaData rsmd3 = rs3.getMetaData();
int numberOfColumns3 = rsmd3.getColumnCount();
%><h3> Select File to Download</h3>
<form name="formi" action="download.jsp" method="post">
    <table id="port" cellspacing="25px">
        <tr><td>

<%
while(rs3.next())
{
    for(int i=1;i<=numberOfColumns3;i+=2)
    {
        %>
        <ul type="none">
            <li>
                <input class="rdSelect" id="pnamei" type="radio" name="pname" value="<%out.println(rs3.getString(i+1));%>" required="required"/><%out.println(rs3.getString(i));%>
            </li>

        </ul>
        <%
    }
}%></td></tr><tr><td align="center"><input type="submit" name="submit" value="Download"/></td></tr></table>
</form><%
con3.close();
%>

        <form action="uploadimgB.jsp"  ENCTYPE="multipart/form-data" method="post">
            <table>

    <tr>
        <td><B>Image Upload</B></td>
    </tr>

    <tr>
        <td><b>Choose the Image To Upload:</b></td>
        <td><INPUT NAME="file" TYPE="file" accept="image/*" required="required"></td>
    </tr>

    <tr>
        <td><input type="submit" value="Upload File" name="submit"> </td>
    </tr>
            </table>
        </form>
