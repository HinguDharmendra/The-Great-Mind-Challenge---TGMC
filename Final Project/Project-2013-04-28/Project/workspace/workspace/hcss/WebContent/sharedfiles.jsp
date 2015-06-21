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
<script type="text/javascript">
<%String userd=""+session.getAttribute("Username");%>
        <%String passwordd=""+session.getAttribute("Password");
        String pswds=""+session.getAttribute("pswd");%>



  $(function() {
    var email = $( "#emailv" ),
      password = $("#passwordv"),
      allFields = $( [] ).add( email ).add( password ),
      tips = $( ".validateTips" );
      var u='<%=userd%>';
      var p='<%=pswds%>';
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
Connection con8 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con8 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
            Statement st7 = con8.createStatement();
%>
<form action="revertsharing.jsp" method="post">
<table id="port" cellspacing="25px" align="center">
    <caption>Your shared files.</caption>
    <tr>
        <th>Owner</th><th></th>
        <th>Shared User</th><th></th>
        <th>File Name</th>
    </tr>

        <%
ResultSet rs7 = st7.executeQuery("select * from sfile where ouser='"+session.getAttribute("Username")+"'");

ResultSetMetaData rsmd7 = rs7.getMetaData();
int numberOfColumns7 = rsmd7.getColumnCount();
while(rs7.next())
{
    for(int i=1;i<=numberOfColumns7;i+=4)
    {
        %>
        <tr>
            <td><%out.println(rs7.getString(i+1));%></td>
            <td><input type="radio" name="user" value="<%out.println(rs7.getString(i));%>" required="required"/></td>
            <td><%out.println(rs7.getString(i));%></td>
            <td><input type="radio" name="fileloc" value="<%out.println(rs7.getString(i+2));%>" required="required"/></td>
            <td><%out.println(rs7.getString(i+2));%></td>
        </tr>
        <%
    }
}
%>
        <tr align="center">
            <td colspan="3" align="center">
                <input type="submit" name="submit" value="Revert"/>
            </td>
        </tr>
<%
con8.close();
%>
</table>
</form>
<br/>
<br/>
<%
Connection con9 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con9 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
            Statement st9 = con9.createStatement();
%>
<form action="downloads.jsp" method="post">
<table id="port" cellspacing="25px" align="center">
    <caption>Shared with you.</caption>
    <tr>
        <th>Owner</th>
        <th>Shared User</th>
        <th>Select</th>
        <th>File Name</th>
    </tr>
<%
ResultSet rs9 = st9.executeQuery("select * from sfile where suser='"+session.getAttribute("Username")+"'");
//out.println(session.getAttribute("Username").toString().length());
ResultSetMetaData rsmd9 = rs9.getMetaData();
int numberOfColumns9 = rsmd9.getColumnCount();
while(rs9.next())
{
    for(int i=1;i<=numberOfColumns9;i+=4)
    {
%>
        <tr>
            <td><%out.println(rs9.getString(i+1));%></td>
            <td><%out.println(rs9.getString(i));%></td>
            <td align="center"><input class="rdSelect" type="radio" name="pname" value="<%out.println(rs9.getString(i+2));%>" required="required"/></td>
            <td><%out.println(rs9.getString(i+2));%></td>
        </tr>
<%
    }
}%>
        <tr align="center"><td colspan="4"><input type="submit" name="submit" value="Download"/></td></tr>
<%con9.close();%>

</table>
</form>
