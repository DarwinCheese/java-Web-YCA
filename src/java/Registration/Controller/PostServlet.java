/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Registration.Controller;

import Registration.Model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laptop10
 */
@WebServlet(urlPatterns = {"/PostServlet"})
public class PostServlet extends HttpServlet {
    private String dbURL = "jdbc:mysql://localhost:3306/twitchandyoutube";
    private String dbUser = "root";
    private String dbPass = "";
    Connection conn = null; // connection to the database
    String message = null;  // message will be sent back to client
    ArrayList<User> userList = new ArrayList();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO users (user_id, first_name, last_name, age, email) values (null, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setInt(3, age);
            statement.setString(4, email);
            
            String sql2 = "SELECT * FROM users";
            PreparedStatement statement2 = conn.prepareStatement(sql2);

            // sends the statement to the database server
            int row = statement.executeUpdate();
            ResultSet result2 = statement2.executeQuery();
            userList = new ArrayList();
            while (result2.next()) {
                String firstNameDB = result2.getString("FIRST_NAME");
                String lastNameDB = result2.getString("LAST_NAME");
                int ageDB = result2.getInt("AGE");
                String emailDB = result2.getString("EMAIL");

                User user = new User(firstNameDB, lastNameDB, emailDB, ageDB);
                userList.add(user);
            }
 
            // sends the statement to the database server
            
            if (row > 0) {
                message = "De user is toegevoegd aan de database!";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }            
            RequestDispatcher rd = request.getRequestDispatcher("registrationForm.jsp");
            request.setAttribute("usersFromDB", userList);
            
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
