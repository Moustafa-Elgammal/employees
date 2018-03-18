<%-- 
    Document   : delete
    Created on : Mar 19, 2018, 12:06:43 AM
    Author     : maxxi
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Employee | Insert.</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
</head>
<body>
    
<%!
  public  class DB_connection {
    String url = "jdbc:mysql://localhost:3306/company";
    String username = "root";
    String password = "";

    Connection connection = null;
    PreparedStatement employees = null;
    ResultSet resultSet = null;

    public  DB_connection() {
      try {
        connection = DriverManager.getConnection(url, username, password);

      } catch (SQLException e){
//            print("connection exception");
      }
    }



    public boolean EmployeeDeleteQuery() {
      try {
        employees = connection.prepareStatement("DELETE FROM employees WHERE id=?");
        return true;
      } catch (SQLException e){
        return false;
      }
    }

    
    

    public int EmployeeDeleteById(String id){
        try {
            EmployeeDeleteQuery();
            employees.setString(1,id);
            return employees.executeUpdate();
        } catch (SQLException e){
            return 0;
        }         
    }


    
}
%>
<%
    DB_connection db = new DB_connection();
    String Query = "";
%>

    <div class="container">
        <div class="col-sm-12">
            <%
                String id = request.getParameter("id");
                if(id != null){
                    if(db.EmployeeDeleteById(id) != 0)
                     %>
                      <a class="btn btn-success" href="employees.jsp">Successfully Deleted, Back</a>
                     <%
                }
            %>
            <a class="btn btn-info" href="index.jsp"> Add New Employee</a>
        </div>   
    </div>  
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>   
  <script>
         
  </script>
</body>
</html>