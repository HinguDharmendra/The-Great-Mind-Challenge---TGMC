<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String saveFile="";
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File f = new File("C:/Data/"+session.getAttribute("Username")+"/audio");
if(!f.exists())
    f.mkdir();
File ff = new File("C:/Data/"+session.getAttribute("Username")+"/audio/"+saveFile);

FileOutputStream fileOut = new FileOutputStream(ff);

fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
String path = ff.getPath();
//  out.println(path);
PreparedStatement psmnt = null;
String users=""+session.getAttribute("Username");
String type="a";
try
{
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
psmnt = con.prepareStatement("insert into file (loc,filename,users,type) values (?,?,?,?)");
psmnt.setString(1,path);
psmnt.setString(2,saveFile);
psmnt.setString(3,users);
psmnt.setString(4,type);

int s = psmnt.executeUpdate();
if(s>0){
out.println("Uploaded successfully!");
response.sendRedirect("welcome2.jsp#3");
con.close();
}
else{
out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
}
}
%>