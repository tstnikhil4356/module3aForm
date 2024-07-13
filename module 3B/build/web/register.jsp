<%-- 
    Document   : register
    Created on : Jul 12, 2024, 12:40:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s1 = request.getParameter("username");
            String s2 = request.getParameter("password");
            String s3 = request.getParameter("password_confirm");
            String s4 = request.getParameter("email");
            String s5 = request.getParameter("country");
            
            if(s2.equals(s3))
            {
                try{
                    
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement pst =conn.prepareStatement("insert into registration_041 values(?,?,?,?)");
                pst.setString(1, s1);
                pst.setString(2, s2);
                pst.setString(3, s4);
                pst.setString(4, s5);
                int rows = pst.executeUpdate();
                if(rows==1)
                {
                    out.println("Mubarakho !!! Registration Succesfully !!!");
                }
                else
                {
                    out.println("Kuch Toh Gadbad Hai...!!! Firse try Kar!!!");
                    
                    %>
                    <jsp:include page="register.html"></jsp:include>
                    <%
                }
                }
                
                catch(Exception e)
                {
                    
                    out.write("Exception :"+e);
                }
            }
            else
            {
                out.print("Password Mismatch..!!! Reenter All Details");
                
                %>
                
                <jsp:include page="register.html"></jsp:include>
                <%
            }
                %>
    </body>
</html>
