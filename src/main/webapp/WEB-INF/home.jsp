<%@ page import="java.util.List" %>
<%@ page import="com.example.mytodo.model.ToDo" %>
<html lang="en">
<head>
    <title>TODO</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&amp;display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootlint/1.1.0/bootlint.min.js"></script>

    <link rel="stylesheet" href="css/style.css">
    <script src="js/app.js"></script>
</head>
<body>
<div class="container m-5 p-2 rounded mx-auto bg-light shadow">
    <!-- App title section -->
    <div class="row m-1 p-4">
        <div class="col">
            <div class="p-1 h1 text-primary text-center mx-auto display-inline-block">
                <i class="fa fa-check bg-primary text-white rounded p-2"></i>
                <u>My Todo-s</u>
            </div>
        </div>
    </div>
    <!-- Create todo section -->
    <form method="post" action="/addToDo">

        <div class="row m-1 p-3">
            <div class="col col-11 mx-auto">
                <div class="row bg-white rounded shadow-sm p-2 add-todo-wrapper align-items-center justify-content-center">
                    <div class="col">

                        <input class="form-control form-control-lg border-0 add-todo-input bg-transparent rounded"
                               type="text" placeholder="Add new .." name="title">
                    </div>
                    <div class="col-auto m-0 px-2 d-flex align-items-center">
                        <input type="date" class="fa fa-calendar my-2 px-1 text-primary btn due-date-button"
                               data-toggle="tooltip"
                               data-placement="bottom" title="Set a Due date" name="finishDate">
                    </div>
                    <div class="col-auto px-0 mx-0 mr-2">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="p-2 mx-4 border-black-25 border-bottom"></div>
    <!-- View options section -->
    <div class="row m-1 p-3 px-5 justify-content-end">
        <div class="col-auto d-flex align-items-center">
        </div>
        <div class="col-auto d-flex align-items-center px-1 pr-3">
            <select class="custom-select custom-select-sm btn my-2">
                <option value="added-date-asc" selected>Added date</option>
                <option value="due-date-desc">Due date</option>
            </select>
            <i class="fa fa fa-sort-amount-asc text-info btn mx-0 px-0 pl-1" data-toggle="tooltip"
               data-placement="bottom" title="Ascending"></i>
            <i class="fa fa fa-sort-amount-desc text-info btn mx-0 px-0 pl-1 d-none" data-toggle="tooltip"
               data-placement="bottom" title="Descending"></i>
        </div>
    </div>
    <!-- Todo list section -->
    <div class="row mx-1 px-5 pb-3 w-80">
        <div class="col mx-auto">
            <!-- Todo Item 1 -->
            <% List<ToDo> toDos = (List<ToDo>) request.getAttribute("toDos");%>
            <%
                for (ToDo toDo : toDos) {%>


            <div class="row px-3 align-items-center todo-item rounded">
                <div class="col-auto m-1 p-0 d-flex align-items-center">
                    <h2 class="m-0 p-0">

                        <i class="fa fa-check-square-o text-primary btn m-0 p-0" data-toggle="tooltip"
                           data-placement="bottom" title="Mark as todo"></i>
                    </h2>
                </div>
                <div class="col px-1 m-1 d-flex align-items-center">
                    <input type="text"
                           class="form-control form-control-lg border-0 edit-todo-input bg-transparent rounded px-3"
                           readonly value=<%=toDo.getTitle()%>>
                </div>
                <div class="col-auto m-1 p-0 px-3 d-none">
                </div>
                <div class="col-auto m-1 p-0 todo-actions">
                    <%=toDo.getStatus()%>
                    <div class="row d-flex align-items-center justify-content-end">

                        <h5 class="m-0 p-0 px-2">
                            <a href="/updateToDo?id=<%=toDo.getId()%>">
                                <i class="fa fa-pencil text-info btn m-0 p-0" data-toggle="tooltip" data-placement="bottom"
                                   title="Edit todo"></i>
                            </a>

                        </h5>
                        <h5 class="m-0 p-0 px-2">
                            <a href="/deleteToDo?id=<%=toDo.getId()%>">
                                <i class="fa fa-trash-o text-danger btn m-0 p-0" data-toggle="tooltip"
                                   data-placement="bottom" title="Delete todo"></i>
                            </a>

                        </h5>
                    </div>
                    <div class="row todo-created-info">
                        <div class="col-auto d-flex align-items-center pr-2">
                            <i class="fa fa-info-circle my-2 px-2 text-black-50 btn" data-toggle="tooltip"
                               data-placement="bottom" title="" data-original-title="Created date"></i>
                            <label class="date-label my-2 text-black-50"><%=toDo.getCreated_date()%>></label>
                        </div>
                    </div>
                </div>
            </div>
            <% }%>
        </div>
    </div>
</div>
</body>
</html>
