<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo App</title>
	<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
      <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
      <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'><link rel="stylesheet" href="./style.css">
      <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
      
      <link rel="stylesheet" href="css/main.css">
      
      <style>
      ::-webkit-scrollbar {
        width: 8px;
      }
      /* Track */
      ::-webkit-scrollbar-track {
        background: #f1f1f1; 
      }
      
      /* Handle */
      ::-webkit-scrollbar-thumb {
        background: #888; 
      }
      
      /* Handle on hover */
      ::-webkit-scrollbar-thumb:hover {
        background: #555; 
      }
       body {                        
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        text-align: left;
        background-image: url("bgimg.jpg");
      }

      i {
          font-style: italic;
      }

      .container{
          position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        height:600px;
      }

      .card {
			 background: rgba(255, 255, 255, 0.43);
			border-radius: 16px;
			box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
			backdrop-filter: blur(11.3px);
			-webkit-backdrop-filter: blur(11.3px);
			border: 1px solid rgba(255, 255, 255, 0.68);
          box-shadow: 0 0.46875rem 2.1875rem rgba(4, 9, 20, 0.03), 0 0.9375rem 1.40625rem rgba(4, 9, 20, 0.03), 0 0.25rem 0.53125rem rgba(4, 9, 20, 0.05), 0 0.125rem 0.1875rem rgba(4, 9, 20, 0.03);
          border-width: 0;
          
          transition: all .2s;
      }

      
		.card-header:first-child {
          border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
      }
      
      .card-header {
          display: flex;
          align-items: center;
          padding-top: 0;
          padding-bottom: 0;
          
          
          padding-right: 0.625rem;
          height: 3.5rem;
      }
      .widget-subheading{
          color: #858a8e;
          font-size: 16px;
          
      }
      .card-header.card-header-tab .card-header-title {
	       background: rgba(255, 255, 255, 0.43);
			border-radius: 20px;
			box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
			backdrop-filter: blur(11.3px);
			-webkit-backdrop-filter: blur(11.3px);
			border: 1px solid rgba(255, 255, 255, 0.68);
			padding : 3px 10px 3px 10px;
          display: flex;
          align-items: center;
          white-space: nowrap;
      }

      .card-header .header-icon {
          font-size: 2.65rem;
          margin-right: 0.625rem;
			background: rgba(255, 255, 255, 0.43);
			border-radius: 16px;
			box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
			backdrop-filter: blur(11.3px);
			-webkit-backdrop-filter: blur(11.3px);
			border: 1px solid rgba(255, 255, 255, 0.68);
      }

      .card-header.card-header-tab .card-header-title {
          display: flex;
          align-items: center;
          white-space: nowrap;
          margin-right:15px;
      }

      .btn-actions-pane-right {
          margin-left: auto;
          white-space: nowrap;
      }

      .text-capitalize {
          text-transform: capitalize !important;
      }

      .scroll-area-sm {
      			
          height: 488px;
          overflow-x: hidden;
      }

      .list-group-item {
      
			background: rgba(255, 255, 255, 0.22);
			border-radius: 16px;
			box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
			backdrop-filter: blur(3.1px);
			-webkit-backdrop-filter: blur(3.1px);
			border: 1px solid rgba(255, 255, 255, 0.13);
     	  position: relative;
     	  color: #000000;
     	  text-weight:800;
          display: block;
          padding: 0.75rem 1.25rem; 
          margin-bottom: 2.5px;
          height: 72.8px;
          box-sizing: border-box; 
      }

      .list-group {
          display: flex;
          flex-direction: column;
          padding-left: 0;
          margin-bottom: 0;
      }

      .todo-indicator {
          position: absolute;
          width: 4px;
          height: 60%;
          border-radius: 0.3rem;
          left: 0.625rem;
          top: 20%;
          opacity: .6;
          transition: opacity .2s;
      }
     

      .bg-warning {
          background-color: #f7b924 !important;
      }

      .widget-content {
          padding: 1rem;
          flex-direction: row;
          align-items: center;
      }

		.widget-content-right {
		    display: flex;
		    align-items: center; 
		}
		
		.widget-content-right button {
		    margin-right: 5px; 
		}
		
		
      .widget-content .widget-content-wrapper {
          display: flex;
          flex: 1;
          position: relative;
          /* align-items: center; */
      }
      
      .widget-content-left.mr-4 {
		    display: flex;
		    align-items: center;
		    justify-content: center; 
		}
      
      .widget-content .widget-content-right {
		    margin-left: auto;
		}
      .btn:not(:disabled):not(.disabled) {
          cursor: pointer;
      }

      .btn {
          position: relative;
          font-size: larger;
          transition: color 0.15s, background-color 0.15s, border-color 0.15s, box-shadow 0.15s;
      }

      .btn-outline-success {
          color: #3ac47d;
          border-color: #3ac47d;
      }

      .btn-outline-success:hover {
          color: #fff;
          background-color: #3ac47d;
          border-color: #3ac47d;
      }

      .btn-outline-success:hover {
          color: #fff;
          background-color: #3ac47d;
          border-color: #3ac47d; 
          /* #3ac47d */
      }
      .btn-primary {
          color: #fff;
          background-color: #3f6ad8;
          border-color: #3f6ad8;
      }
      .header-buttons {
		    margin-left: auto;
		    margin-right:10px;
		}
      
      .btn { 
          position: relative;
          transition: color 0.15s, background-color 0.15s, border-color 0.15s, box-shadow 0.15s;
          outline: none !important;
      }
		
      .card-footer{
          background-color: #fff;
      }
      
      a{
      	text-decoration: none;
      	color: black;	
      }
      a:hover{
      	text-decoration: none;
      	color: blue;	
      }
      
      .completed {
		    text-decoration: wavy line-through;
		}
		
		
      
      </style>
</head>
<body>

<%! int a;%>


  <div class="row d-flex justify-content-center container">
    <div class="col-md-12">
      <div class="card-hover-shadow-2x mb-3 card">
      <form action="TodoStatus" method="post">
        <div class="card-header-tab card-header">
          <a href="index.html"><div class="card-header-title font-size-lg text-capitalize font-weight-normal">
            <i class="fa fa-arrow-left"></i>
          </div></a>
          
          <div class="card-header-title font-size-lg text-capitalize font-weight-normal">
            <i class="fa fa-tasks"></i>&nbsp;Todo Lists
          </div>
          
    	  <div class="header-buttons">
    	  <a href="Logout">
        	<button class="btn btn-danger" id="logoutButton"><i class="fa fa-sign-out"></i></button>
         </a>
    </div>
    	
        </div>
        <div class="scroll-area-sm">
          <perfect-scrollbar class="ps-show-limits">
            <div style="position: static;" class="ps ps--active-y">
              <div class="ps-content">
                <ul class=" list-group list-group-flush">
                <%
					String dbcon = "jdbc:mysql://localhost:3306/todos";
					
					
					try {
					
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection(dbcon, "root", "password");
						PreparedStatement ps = con.prepareStatement("select * from todo order by id desc");
				
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{
							a=rs.getInt(1);
							
							  String indicate="";
	                          String badge="";
	                          String stricktext="";
	                          if (rs.getString(4).equals("Completed")) { 
						            badge="badge badge-info ml-2";
									indicate="todo-indicator bg-secondary";
									stricktext="completed";
	                          } else {
	                        	  	indicate="todo-indicator bg-info";
						          	badge="badge badge-danger ml-2";
						          	stricktext="";
						      } 
				%>
                
                  <li class="list-group-item">
                    <div class="<%= indicate %>"></div>
                    <div class="widget-content p-0">
                      <div class="widget-content-wrapper">
                        <div class="widget-content-left mr-4">
                          <div class="custom-checkbox custom-control">
							<div class="checkbox-container">				
                            <input class="ui-checkbox" type="checkbox" id="taskCheckbox" value="<%= a %>" 
                            <% if (rs.getString(4).equals("Completed")) { %>
					            checked disabled
					          <% } %> >
                       		</div>
                            </div>
                        </div>
                        <div class="widget-content-left">
                          <div class="widget-heading <%= stricktext %>" id="title"><% out.println(rs.getString(2)); %>  &nbsp;&nbsp;
                          <div class="<%= badge %>" id="myDiv">
                          
                          <% if (rs.getString(4).equals("Completed")) { %>
					            Completed
					          <% } else { %>
					          	Pending
					          <% } %></div>
                          </div>
                          <div class="widget-subheading <%= stricktext %>" id="des"><i><% out.println(rs.getString(3)); %></i></div>
                        </div>
                      <div class="widget-content-right">			          
                        <button class="border-0 btn-transition btn btn-outline-secondary edit-task-button" data-toggle="modal" data-target="#editTaskModal"
                         value="<%= a %>" onclick='editID(this)' type="button">
                          <i class="fa fa-edit"></i></button>
                        
                        <form action="TodoDelete" method="post">
                          	<input type="hidden" name="delete" value=<%=a %>>
                          	<button type="submit" class="border-0 btn-transition btn btn-outline-danger">
                         	<i class="fa fa-trash"></i>
                         	</button>
                        </form>
                      </div>
                      </div>
                    </div>
                  </li>
                  <% 	
						}
					}
					catch(Exception e){
						out.println(e.getMessage());
					}
					%>
                </ul>
              </div>
              
            </div>
          </perfect-scrollbar>
        </div>

        <div class="border-top p-3 d-flex flex-row align-items-center gap-2">
        	<form action="TodoStatus" method="post">
	            <input type="hidden" name="Id" id="t1" value="">
	            <button class="btn btn-success" type="submit"><i class="zmdi zmdi-check"></i></button>
          	</form>
          	
          	
            <!-- <button class="btn btn-danger"><i class="zmdi zmdi-delete">&nbsp;&nbsp;Delete All</i></button> -->
            <!-- <div class="flex-fill">
			<form action="TodoStatus" method="post">
	            <input type="hidden" name="Id" id="t1" value="">
	            <button class="btn btn-outline-success" type="submit"><i class="zmdi zmdi-check"></i></button>
          	</form>
          	</div> -->
            <!-- <button class="btn btn-outline-danger"><i class="zmdi zmdi-close"></i></button> -->
            
            
            <div class="flex-fill"></div>
            <button class="btn btn-primary" data-toggle="modal" data-target="#addTaskModal" type="button"><i class="zmdi zmdi-plus"></i>&nbsp;&nbsp;Add Task</button>
         </div>

        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addTaskModalLabel">Add a New Task</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="TodoDisplay" method="post">
        <div class="modal-body">
          
            <div class="mb-3">
              <label for="recipient-name" class="col-form-label">Title:</label>
              <input type="text" class="form-control" id="title" name="text">
            </div>
            <div class="mb-3">
              <label for="message-text" class="col-form-label">Description:</label>
              <textarea class="form-control" id="description" name="destext"></textarea>
            </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="saveTaskButton">Save Task</button>
        </div>
      	</form>
      </div>
    </div>
  </div>
	
  <div class="modal fade" id="editTaskModal" tabindex="-1" role="dialog" aria-labelledby="editTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editTaskModalLabel">Edit a Task</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="TodoEdit" method="post">
          	<input type="hidden" name="Edit" id="edit-taskId" value="">
		      <div class="mb-3">
		        <label for="edit-title" class="col-form-label">Title:</label>
		        <input type="text" class="form-control" name="taskname" id="edit-title">
		      </div>
		      <div class="mb-3">
		        <label for="edit-des" class="col-form-label">Description:</label>
		        <textarea class="form-control" name="taskdes" id="edit-des"></textarea>
		      </div>
          
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		          <button type="submit" class="btn btn-warning" id="saveTaskButton">Update Task</button>
		        </div>
        	</form>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">

  $('#saveTaskButton').on('click', function () {
    $('#addTaskModal').modal('hide');
  });

  function editID(objButton){  
	    //alert(objButton.value);
	    document.getElementById('edit-taskId').value = objButton.value;
	}
  


  /* function chk(checkbox) {
	  if (checkbox.checked) {
	    var inputValue = checkbox.value;
	    var inputField = document.getElementById('t1');
	    inputField.value = inputValue; 
	   
	  }
	} */

  var checkboxes = document.querySelectorAll('#taskCheckbox');
  var inputField = document.getElementById('t1');

  checkboxes.forEach(function (checkbox) {
      checkbox.addEventListener('change', function () {
          var selectedValues = [];

          checkboxes.forEach(function (checkbox) {
              if (checkbox.checked) {
                  selectedValues.push(checkbox.value);
              }
          });

          inputField.value = selectedValues.join(' ');
      });
  });
  





</script>
  <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
  
</body>
</html>