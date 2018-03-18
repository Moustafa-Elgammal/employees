<%-- 
    Document   : index
    Created on : Mar 17, 2018, 2:27:04 PM
    Author     : Moustafa Elgammal
--%>

<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
  <title>Employee | Insert.</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

        


    <div class="container">
        <div class="col-sm-10">
            <p></p>
                <h3 class="text-center">Add new Employee</h3>
            <hr/>
            <form action="test.jsp" method="POST">
                
            <div class="form-group row">
                <label for="inputFirst" class="col-sm-2 col-form-label">
                    First Name:<%Date d =  new Date(); %>
                    <%= d+"SDfsd "%>
                </label>
                <div class="col-sm-10">
                  <input type="text" 
                         name ="first_name[]"
                         class="form-control"
                         id="inputFirst"
                         placeholder="first name"
                         required
                    >
                </div>
            </div>
                <div class="form-group row">
                <label for="inputFirst" class="col-sm-2 col-form-label">
                    First Name:
                </label>
                <div class="col-sm-10">
                  <input type="text" 
                         name ="first_name[]"
                         class="form-control"
                         id="inputFirst"
                         placeholder="first name"
                         required
                    >
                </div>
            </div>
                <div class="form-group row">
                <label for="inputFirst" class="col-sm-2 col-form-label">
                    First Name:
                </label>
                <div class="col-sm-10">
                  <input type="text" 
                         name ="first_name[]"
                         class="form-control"
                         id="inputFirst"
                         placeholder="first name"
                         required
                    >
                </div>
            </div>
                <div class="form-group row">
                <label for="inputFirst" class="col-sm-2 col-form-label">
                    First Name:
                </label>
                <div class="col-sm-10">
                  <input type="text" 
                         name ="first_name[]"
                         class="form-control"
                         id="inputFirst"
                         placeholder="first name"
                         required
                    >
                </div>
            </div>
                <input type="submit" name="submit" value="submit">
            </form>
        </div></div></body></html>