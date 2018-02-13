<%-- 
    Document   : registrationForm
    Created on : 13-feb-2018, 14:41:12
    Author     : Laptop10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Registration.Controller.*" %>
<%@page import="Registration.Model.*" %>
<% User usr = (User) request.getAttribute("userdata"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration Form!</h1>
        <div>
            <table>
                <form name="RegistrationForm" action="/TwitchAndYoutube/registration" method="POST">
                    <tr>
                        <td>
                            First Name:
                        </td>
                        <td>
                            <input type="text" name="firstName" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name:
                        </td>
                        <td>
                            <input type="text" name="lastName" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Age:
                        </td>
                        <td>
                            <input type="text" name="age" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-Mail:
                        </td>
                        <td>
                            <input type="text" name="email" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="submit" value="Verzenden">
                        </td>
                    </tr>
                </form>
            </table>
            
            <table>
                <% if (usr != null) { %>
                <tr>
                    <td>
                        Jouw naam is: 
                    </td>
                    <td>
                        <% out.print(usr.getFirstName()); %> <% out.print(usr.getLastName());%>
                    </td>  
                </tr>
                <tr>
                    <td>
                        Jouw email is:
                    </td>
                    <td>
                        <% out.print(usr.getEmail()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Jouw leeftijd is: 
                    </td>
                    <td>
                        <% out.print(usr.getAge()); %>
                    </td>
                </tr>
                    
                <% } else { %>
                <h1>
                    Er zijn nog geen users!
                </h1>
                <% } %>
            </table>
        </div>
    </body>
</html>
