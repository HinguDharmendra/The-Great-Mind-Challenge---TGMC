<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="js/jquery-ui-1.10.2/css/jquery-ui-1.10.2.custom.min.css" />
<script type="text/javascript">
    $(document).ready(function(){
     $('input[name="email"]').on('focusout',function(e){
                                        var emailStr = $(this).val();
                                        console.log("emailstr is " + emailStr);
                                       $.ajax({
                                            url : 'validation.jsp',
                                            data : { email : emailStr},
                                            dataType : 'html',
                                            type : 'POST',
                                            success : function(msg){
                                            
                                           if(msg=='TRUE'){
                                              $("#msgbox").fadeTo(900,1,function()
                                                {
                                                $(this).html('Email available').addClass('myinfo');
                                                });
                                             }
                                            else
						{
							$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
                                                {
                                                 //add message and change the class of the box and start fading
                                                 $(this).html('Sorry, Email Already Exists.').removeClass().addClass('myerror').fadeTo(900,1);
                                                 
                                                 });
                                                
						}
                                       }
                                        });
                                    });
      
    });
   
</script>
<script type="text/javascript">
function CheckPassword(inputtxt)
{

var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;  
if(inputtxt.value.match(paswd))
{
    return true;
}
else
{
alert('Password should be at least 7 character long and must include atleast one numeric and one special character');
inputtxt.value ="";
return false;
}
}
function VerifyPswd(cpswd, pswd)
{
    if(cpswd.value == pswd.value)
{
    return true;
}
else
{
alert('Password did not matched');
pswd.value ="";
cpswd.value="";
return false;
}
}

 function ValidateEmail(email)
  {
  var uemail = email;
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if(uemail.value.match(mailformat))
  {
  return true;
  }
  else
  {
  alert("You have entered an invalid email address!");
  uemail.value="";
  uemail.focus();

  return false;
  }
  }
  function allLetter(value)
  {
  var uname = value;
  var letters = /^[A-Za-z]+$/;
  if(uname.value.match(letters))
  {
  return true;
  }
  else
  {
  alert('Field must have alphabet characters only');
  uname.value="";
  uname.focus();
  return false;
  }
  }
  function allNum(value)
  {
  var uno = value;
  var letters = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
  if(uno.value.match(letters))
  {
  return true;
  }
  else
  {
  alert('Mobile Number must be Numeric and 10 digit');
  uno.value="";
  uno.focus();
  return false;
  }
  }

 </script>

<table border=0>
<form method="post" action="registration.jsp" name="register">
        <tr>
                <td colspan=2 align="center"> </td>
	</tr>
	<tr>
		<td>First Name </td>
		<td><input type="text" name="fname" onchange="allLetter(fname);" required="required"></td>
	</tr>
	<tr>
		<td>Middle Name </td>
		<td><input type="text" name="mname" onchange="allLetter(mname);" required="required"></td>
	</tr>
	<tr>

		<td>Last Name</td>
		<td><input type="text" name="lname" onchange="allLetter(lname);" required="required"></td>
	</tr>
        <tr>
		<td>Email</td>
		<td><input type="text" name="email" onchange="ValidateEmail(email);"required="required"></td>
                <td><div id="msgbox"></div></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password" onchange="CheckPassword(password);" required="required"></td>
	
        </tr>
        <tr>
		<td>Confirm Password</td>
		<td><input type="password" name="confirmpassword" onchange="VerifyPswd(confirmpassword, password);" required="required"></td>
	</tr>
	<tr>
		<td>Mobile No</td>
		<td><input type="text" name="mobile_no" onchange="allNum(mobile_no);" required="required"></td>
	</tr>
	<tr>
		<td>Gender</td>
                <td>
                <select name="gender">
			<option value="1">Male</option>
			<option value="2">Female</option>
                </select>
                </td>
	</tr>
	<tr>
		<td>Date of Birth</td>
                
                <td><input type="text" value="yyyy-mm-dd" name="dob" id="date" required="required"/></td>

	</tr>
        <tr>
		<td></td>
                <td><input type="submit" name="Submit" id="register" value="Register"  ></td>
	</tr>
</form>
</table>
