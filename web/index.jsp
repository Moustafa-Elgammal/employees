<%-- 
    Document   : index
    Created on : Mar 17, 2018, 2:27:04 PM
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

    public boolean insertQuery(){
        String Query = "INSERT INTO `company`.`employees`"
                        +"(`first_name`, `last_name`, "
                        + "`phone`, `email`,"
                        + "`date`) "
                        + "VALUES (?, ?, ?, ?, ?)";
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
//            print("query execution error");
      }

      return resultSet;
    }


    public ResultSet executeQueryGetResults(String Query){
        setQuery(Query);
        return getResults();
    }


    public int setNew(String first, String last, String phone, String email, Timestamp date){
        int result = 0;
        try{
            this.insertQuery();
            selectProducts.setString(1,first);
            selectProducts.setString(2,last);
            selectProducts.setString(3,phone);
            selectProducts.setString(4,email);
            selectProducts.setTimestamp(5,date);
            result = selectProducts.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }      
        
        return result;
    }

    
    public int add_employee_language(int id,int l_id){
        int result = 0;
        try{

            String Query = "INSERT INTO employees_languages"
                + " (`e_id`, `l_id`) "
                + "VALUES ( ?, ?)";

            selectProducts = connection.prepareStatement(Query);

            selectProducts.setInt(1,id);
            selectProducts.setInt(2,l_id);
            result = selectProducts.executeUpdate();
            return result;

        } catch (SQLException e){
            e.printStackTrace();
        }         
        return result;
    }

    public int add_employee_skill(int id,int s_id){
        int result = 0;
        try{

            String Query = "INSERT INTO employees_skills"
                + " (`e_id`, `s_id`) "
                + "VALUES ( ?, ?)";

            selectProducts = connection.prepareStatement(Query);

            selectProducts.setInt(1,id);
            selectProducts.setInt(2,s_id);
            result = selectProducts.executeUpdate();
            return result;

        } catch (SQLException e){
            e.printStackTrace();
        }         
        return result;
    }

    public int add_employee_project(int id,int p_id){
        int result = 0;
        try{

            String Query = "INSERT INTO employees_projects"
                + " (`e_id`, `p_id`) "
                + "VALUES ( ?, ?)";

            selectProducts = connection.prepareStatement(Query);

            selectProducts.setInt(1,id);
            selectProducts.setInt(2,p_id);
            result = selectProducts.executeUpdate();
            return result;

        } catch (SQLException e){
            e.printStackTrace();
        }         
        return result;
    }
    
    public int add_employee_course(int id,int c_id){
        int result = 0;
        try{

            String Query = "INSERT INTO employees_courses"
                + " (`e_id`, `c_id`) "
                + "VALUES ( ?, ?)";

            selectProducts = connection.prepareStatement(Query);

            selectProducts.setInt(1,id);
            selectProducts.setInt(2,c_id);
            result = selectProducts.executeUpdate();
            return result;

        } catch (SQLException e){
            e.printStackTrace();
        }         
        return result;
    }
}

%>
    <%
        DB_connection db = new DB_connection();
        String Query = "";
        boolean check = false;
        //Get Courses
        int id = 0,i=0;
        ResultSet courses,skills,projects,languages,employees;
    %>

    

    <div class="container">
        <div class="col-sm-12">
            
            <p>
        <%
            String s = request.getParameter("submit");
            if(s != null){
                String first_name = request.getParameter("first_name");
                String last_name =  request.getParameter("last_name");
                String phone =  request.getParameter("phone");
                String email =  request.getParameter("email");
                Date date  = new Date();
                Timestamp time = new Timestamp(date.getTime());
                String [] languages_i = request.getParameterValues("languages[]");
                String [] skills_i = request.getParameterValues("skills[]");
                String [] courses_i = request.getParameterValues("courses[]");
                String [] projects_i = request.getParameterValues("projects[]"); 
                
                // insert query
                
                db.setNew(first_name, last_name, phone, email, time);
                id = db.last_employee_id();
                
                for(i = 0; i < languages_i.length; i++)
                    db.add_employee_language(id, Integer.parseInt(languages_i[i]));
                
                for(i = 0; i < skills_i.length; i++)
                    db.add_employee_skill(id, Integer.parseInt(skills_i[i]));
                
                for(i = 0; i < courses_i.length; i++)
                    db.add_employee_course(id, Integer.parseInt(courses_i[i]));
                
                for(i = 0; i < projects_i.length; i++)
                    db.add_employee_project(id, Integer.parseInt(projects_i[i]));
                
                
            }
        %>


            </p>
            <h3 class="text-center">Add new Employee:<a class="btn btn-info" href="employees.jsp"> Show All Employees</a></h3>
            <hr/>
            <form action="index.jsp" method="POST">
                
            <div class="form-group row">
                <label for="inputFirst" class="col-sm-4 col-form-label">
                    First Name:
                </label>
                <div class="col-sm-8">
                  <input type="text" 
                         name ="first_name"
                         class="form-control"
                         id="inputFirst"
                         placeholder="first name"
                         required
                    >
                </div>
            </div>
                <hr>
            <div class="form-group row">
                <label for="inputLast" class="col-sm-4 col-form-label">
                    Last Name:
                </label>
                <div class="col-sm-8">
                  <input type="text" 
                         name ="last_name"
                         class="form-control"
                         id="inputLast"
                         placeholder="last name"
                         required
                    >
                </div>
            </div>
                <hr>
            <div class="form-group row">
                <label for="inputPhone" class="col-sm-4 col-form-label">
                    Phone:
                </label>
                <div class="col-sm-8">
                  <input type="text" 
                         name ="phone"
                         class="form-control"
                         id="inputPhone"
                         placeholder="phone#"
                         required
                    >
                </div>
            </div>
                <hr>
            <div class="form-group row">
                <label for="inputEmail" class="col-sm-4 col-form-label">
                    Email:
                </label>
                <div class="col-sm-8">
                  <input type="email" 
                         name ="email"
                         class="form-control"
                         id="inputEmail"
                         placeholder="Email"
                         required
                    >
                </div>
            </div>
            <hr>
            <%
                Query = "SELECT * FROM languages";
                languages = db.executeQueryGetResults(Query);
            %>
                
            <div id="languages">
                <div class="languages">
                    <div class="form-group row">
                        <label for="inputLanguages" class="col-sm-4 col-form-label">
                            Language: 
                            <button id="add_languages" class="btn btn-info add_language_button">
                                <i class="fa fa-plus"></i>
                            </button>
                        </label>
                        <div class="col-sm-8">
                            <select id="inputLanguages"
                                    class="form-control"
                                    name="languages[]">
                              <option selected value="0">Choose...</option>
                                <% while(languages.next()){ %>
                              <option value="<%= languages.getString("id") %>"
                                      >
                                    <%= languages.getString("name") %>
                                  </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <hr>           
            <%
                Query = "SELECT * FROM skills";
                skills = db.executeQueryGetResults(Query);
            %>
                
            <div id="skills">
                <div class="skills">
                    <div class="form-group row">
                        <label for="inputSkills" class="col-sm-4 col-form-label">
                            Skill: 
                            <button id="add_skills" class="btn btn-info add_skill_button">
                                <i class="fa fa-plus"></i>
                            </button>
                        </label>
                        <div class="col-sm-8">
                            <select id="inputSkills"
                                    class="form-control"
                                    name="skills[]">
                              <option selected value="0">Choose...</option>
                                <% while(skills.next()){ %>
                              <option value="<%= skills.getString("id") %>"
                                      >
                                    <%= skills.getString("name") %>
                                  </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
                                
            <%
                Query = "SELECT * FROM courses";
                courses = db.executeQueryGetResults(Query);
            %>

            <div id="courses">
                <div class="courses">
                    <div class="form-group row">
                        <label for="inputCourses" class="col-sm-4 col-form-label">
                            Course: 
                            <button id="add_courses" class="btn btn-info add_course_button">
                                <i class="fa fa-plus"></i>
                            </button>
                        </label>
                        <div class="col-sm-8">
                            <select id="inputCourses"
                                    class="form-control"
                                    name="courses[]">
                              <option selected value="0">Choose...</option>
                                <% while(courses.next()){ %>
                              <option value="<%= courses.getString("id") %>"
                                      >
                                    <%= courses.getString("name") %>
                                  </option>
                                <%}%>

                            </select>
                        </div>
                    </div>
                </div>
            </div>
                                
                <hr>
                <%
                    Query = "SELECT * FROM projects";
                    projects = db.executeQueryGetResults(Query);
                %>
                
            <div id="projects">
                <div class="projects">
                    <div class="form-group row">
                        <label for="inputSrojects" class="col-sm-4 col-form-label">
                            Project:
                            <button id="add_projects" class="btn btn-info add_project_button">
                                <i class="fa fa-plus"></i>
                            </button>
                        </label>
                        <div class="col-sm-8">
                            <select id="inputCourses"
                                    class="form-control"
                                    name="projects[]">
                              <option selected value="0">Choose...</option>
                                <% while(projects.next()){ %>
                              <option value="<%= projects.getString("id") %>"
                                      >
                                    <%= projects.getString("name") %>
                                  </option>
                                <%}%>

                            </select>
                        </div>
                    </div>
                </div>
            </div> 
                <hr>       
                <div class="form-group row">
                    <label for="inputSave" class="col-sm-4 col-form-label">
                    </label>
                    <div class="col-sm-8">
                    <input type="submit" 
                         name ="submit"
                         class="form-control btn-info"
                         id="inputSave"
                         value="Save Employee"
                         required
                    >
                </div>
            </div>                           
            </form>
        </div>
    </div>  
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>   
  <script>
      jQuery(document).ready(function($){
          
        $('#add_languages').click(function(e){
            e.preventDefault();
            languages = $(".languages").html();
            $("#languages").append(languages);
            remove = $(".add_language_button");
            remove[remove.length - 1].remove();
        });
        
        $('#add_skills').click(function(e){
              e.preventDefault();
              skills = $(".skills").html();
              $("#skills").append(skills);
              remove = $(".add_skill_button");
              remove[remove.length - 1].remove();
        });
        
        $('#add_courses').click(function(e){
              e.preventDefault();
              courses = $(".courses").html();
              $("#courses").append(courses);
              remove = $(".add_course_button");
              remove[remove.length - 1].remove();
        });
        
        $('#add_projects').click(function(e){
              e.preventDefault();
              projects = $(".projects").html();
              $("#projects").append(projects);
              remove = $(".add_project_button");
              remove[remove.length - 1].remove();
        });
                   
      });     
  </script>
</body>
</html>