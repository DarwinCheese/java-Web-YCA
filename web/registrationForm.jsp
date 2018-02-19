<%-- 
    Document   : registrationForm
    Created on : 13-feb-2018, 14:41:12
    Author     : Laptop10
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Registration.Controller.*" %>
<%@page import="Registration.Model.*" %>

<% ArrayList<User> userList = (ArrayList) request.getAttribute("usersFromDB"); %>

<jsp:include page="header.jsp" />
<h1>Registration Form!</h1>
<div class="registration">
    <table >
        <form name="RegistrationForm" action="/TwitchAndYoutube/PostServlet" method="POST">
            <tr>
                <td>
                    Voornaam:
                </td>
                <td>
                    <input type="text" name="firstName" required>
                </td>
            </tr>
            <tr>
                <td>
                    Achternaam:
                </td>
                <td>
                    <input type="text" name="lastName" required>
                </td>
            </tr>
            <tr>
                <td>
                    Leeftijd:
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
                    <input type="email" name="email" required>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="Verzenden" class="btn btn-primary">
                </td>
            </tr>
        </form>
    </table>
</div>

<div class="userList">
    <% if (userList.size() <= 0) { %>
        <h1>
            Er zijn nog geen users!
        </h1>
    <% } else { %>
        <table class="table table-hover table-sm">
            <caption>Lijst met aangemelde gebruikers</caption>
            <thead>
                <tr>
                    <th scope="col">
                        Voornaam
                    </th>
                    <th scope="col">
                        Achternaam
                    </th>
                    <th scope="col">
                        Leeftijd
                    </th>
                    <th scope="col">
                        E-mail
                    </th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < userList.size(); i++) { %>
                    <tr>
                        <td>
                            <%=userList.get(i).getFirstName() %> 
                        </td>
                        <td>
                            <%=userList.get(i).getLastName() %> 
                        </td>  
                        <td>
                            <%=userList.get(i).getAge() %> 
                        </td>
                        <td>
                            <%=userList.get(i).getEmail() %> 
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</div>
<jsp:include page="footer.jsp" />
