<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Highly Confidential Security System</title>
        <link href="css/hcss.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="js/jquery-ui-1.10.2/css/jquery-ui-1.10.2.custom.min.css" />
                <meta name="description" content="Highly Confidential Security System"/>
		<meta name="keywords" content="VJTI, Security, system, highly confidential, confidential"/>
		<meta name="author" content="Dharmendra Hingu, Harnish Gevaria, Meenali Kaprani"/>

                <script src="js/jquery-ui-1.10.2/js/jquery-1.9.1.js" type="text/javascript"></script>
                <script src="js/jquery-ui-1.10.2/js/jquery-ui-1.10.2.custom.js" type="text/javascript"></script>
                <script src="js/jquery-easing.1.2.pack.js" type="text/javascript"></script>
                <script src="js/jquery-easing-compatibility.1.2.pack.js" type="text/javascript"></script>
                <script src="js/coda-slider.1.1.1.pack.js" type="text/javascript"></script>
               <script type="text/javascript">
                    jQuery(window).bind("load", function() {
                        jQuery("div#slider1").codaSlider()
                        });
                </script>
</head>

    <body background="images/distressed.jpeg"><font color="white">
   <div id="cream">
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
		
                      <div class="loc" id="hiuser">Welcome, Guest &nbsp;&nbsp;&nbsp;
                <a href="index.jsp#4" class="cross-link">
                        <font color="red">Register</font>
                    </a>
                |
                <a href="index.jsp#3" class="cross-link">
                       <font color="red"> Login</font>
                    </a>
                |
                <a href="index.jsp" class="cross-link">
                       <font color="red"> Home</font>
                    </a>
               </div><br/>
                    <div class="slider-wrap">
                            <div id="slider1" class="csw">
                                    <div class="panelContainer">
                                            <div class="panel" title="Access Forbidden">
                                                <div class="wrapper">
                                                    <h3>Session Expired, <br/></h3>
                                                    <div class="loc">
                                                To access the services
                                                <a href="index.jsp#3"><font color="red">Login</font>
                                                 </a>again
                                                    </div>
      
                                      		</div>
                                            </div>
                                    </div>
                            </div>
                    </div>
                
        </div>
    </font>
         <div id="templatemo_footer">

        Copyright � 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->
</body>
</html>
