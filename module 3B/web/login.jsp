<%-- 
    Document   : login
    Created on : Jul 12, 2024, 12:41:04 PM
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
            String s1 =request.getParameter("username");
            String s2 =request.getParameter("password");
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement pst =conn.prepareStatement("select * from registration_041 where username=?");
                pst.setString(1,s1);
                ResultSet rs = pst.executeQuery();
                
                if (rs.next())
                {
                    if(rs.getString(2).equals(s2))
                    {
                        out.print("Login HoGaya Mubarakho !!");
                    }
                    
                    else
                    {
                        out.print("Appka Password Galat hai !!");
                        %>
                        <jsp:include page="login.html"></jsp:include>
                        <%
                        
                    }
                }
                else
                {
                    out.print("Tum Exist Nhi karte Register Karo Jaakar");
                    %>
                    <jsp:include page="register.html"></jsp:include>
                    <%
                    
                }
                
                
                
            }
            catch(Exception e)
            {
                out.print("Exception:"+e);
            }

        
        %>
    </body>
</html>
