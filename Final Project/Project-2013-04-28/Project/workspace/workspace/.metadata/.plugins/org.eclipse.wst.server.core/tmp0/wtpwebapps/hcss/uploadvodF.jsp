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
<script type="text/javascript">
    <%String userv=""+session.getAttribute("Username");%>
        <%String passwordv=""+session.getAttribute("Password");
        String pswdv=""+session.getAttribute("pswd");%>



  $(function() {
    var email = $( "#emailv" ),
      password = $("#passwordv"),
      allFields = $( [] ).add( email ).add( password ),
      tips = $( ".validateTips" );
      var u='<%=userv%>';
      var p='<%=pswdv%>';
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
Connection con5 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con5 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st5 = con5.createStatement();

ResultSet rs5 = st5.executeQuery("select filename,loc from file where users='"+userv+"' and type='v'");
ResultSetMetaData rsmd5 = rs5.getMetaData();
int numberOfColumns5 = rsmd5.getColumnCount();
%><h3> Select File to Download</h3>
<form name="formv" action="download.jsp" method="post">
    <table id="port" cellspacing="25px">
        <tr><td>

<%
while(rs5.next())
{
    for(int i=1;i<=numberOfColumns5;i+=2)
    {
        %>
        <ul type="none">
            <li>
                <input class="rdSelect" id="pname" type="radio" name="pname" value="<%out.println(rs5.getString(i+1));%>" required="required"/><%out.println(rs5.getString(i));%>
            </li>

        </ul>
        <%
    }
}
%></td></tr><tr><td align="center"><input type="submit" name="submit" value="Download"/></td></tr></table>
</form><%
con5.close();
%>


        <form action="uploadvodB.jsp"  ENCTYPE="multipart/form-data" method="post">
            <table>

    <tr>
        <td><B>VIdeo Upload</B></td>
    </tr>

    <tr>
        <td><b>Choose the Video Clip To Upload:</b></td>
        <td><INPUT NAME="file" TYPE="file" accept="video/*" required="required"></td>
    </tr>

    <tr>
        <td><input type="submit" value="Upload File" name="submit"> </td>
    </tr>
            </table>
        </form>
