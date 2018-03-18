<%-- 
    Document   : index
    Created on : Mar 18, 2018, 22:00:04 PM
    Author     : Moustafa Elgammal
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
    PreparedStatement selectProducts = null;
    ResultSet resultSet = null;

    public  DB_connection() {
      try {
        connection = DriverManager.getConnection(url, username, password);

      } catch (SQLException e){
//            print("connection exception");
      }
    }

    public int last_employee_id(){
        int id = 0;
        try{
           
           resultSet = selectProducts.executeQuery("select * from employees");
           if(resultSet.last()){
               id = resultSet.getInt("id");
           }

            return id;
        } catch (SQLException e)
        {
           return id;
        }
        
    }


    public boolean setQuery(String Query) {
      try {
        selectProducts = connection.prepareStatement(Query);
        return true;
      } catch (SQLException e){
        return false;
      }
    }

    
    public ResultSet getResults (){

      try {
        resultSet = selectProducts.executeQuery();
      } catch (SQLException e){

      }

      return resultSet;
    }


    public ResultSet executeQueryGetResults(String Query){
        setQuery(Query);
        return getResults();
    }


    
}
%>
<%
    DB_connection db = new DB_connection();
    String Query = "";
    ResultSet courses,skills,projects,languages,employees;

    
    Query = "SELECT * FROM employees";
    employees = db.executeQueryGetResults(Query);


%>

    

    <div class="container">
        <div class="col-sm-12">
            <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">phone</th>
                    <th scope="col">email</th>
                    
                    <th scope="col">Skills</th>
                    <th scope="col">projects</th>
                    <th scope="col">Courses</th>
                    <th scope="col">languages</th>
                    
                    <th scope="col">
                        <i class="fa fa-gear"></i>
                    </th>
                    
                  </tr>
                </thead>
                <tbody>
                <% while(employees.next()){%>
                  <tr>
                      
                    <th scope="row"><%= employees.getInt("id")%></th>
                    <td><%= employees.getString("first_name")%></td>
                    <td><%= employees.getString("last_name")%></td>
                    <td><%= employees.getString("phone")%></td>
                    <td><%= employees.getString("email")%></td>

                    <td>
                        <%
                            Query = "SELECT * FROM employees_skills left join skills "
                                    + "on skills.id = employees_skills.s_id WHERE e_id = '"
                                    + employees.getInt("id")+"';";
                            skills = db.executeQueryGetResults(Query);                                        
                            while(skills.next()){ 
                            %>
                                <%= skills.getString("name")%>,
                            <%
                            }
                         %>
                    </td>
                    <td>
                        <%
                            Query = "SELECT * FROM employees_projects left join projects "
                                    + "on projects.id = employees_projects.p_id WHERE e_id = '"
                                    + employees.getInt("id")+"';";
                            skills = db.executeQueryGetResults(Query);                                        
                            while(skills.next()){ 
                            %>
                                <%= skills.getString("name")%>,
                            <%
                            }
                         %>
                    </td>
                    
                    <td>
                        <%
                            Query = "SELECT * FROM employees_courses left join courses "
                                    + "on courses.id = employees_courses.c_id WHERE e_id = '"
                                    + employees.getInt("id")+"';";
                            skills = db.executeQueryGetResults(Query);                                        
                            while(skills.next()){ 
                            %>
                                <%= skills.getString("name")%>,
                            <%
                            }
                         %>
                    </td>
                    
                    <td>
                        <%
                            Query = "SELECT * FROM employees_languages left join languages "
                                    + "on languages.id = employees_languages.l_id WHERE e_id = '"
                                    + employees.getInt("id")+"';";
                            skills = db.executeQueryGetResults(Query);                                        
                            while(skills.next()){ 
                            %>
                                <%= skills.getString("name")%>,
                            <%
                            }
                         %>
                    </td>
                    
                    <td> 
                        <a href="delete.jsp?id=<%= employees.getInt("id")%>"> 
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                  </tr>
                 <%}%>
                </tbody>
              </table>
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