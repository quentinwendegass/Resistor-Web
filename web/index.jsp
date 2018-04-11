<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="custom-styles.css">
    <link rel="stylesheet" href="bootstrap.css">
    <link rel="stylesheet" href="bootstrap-toggle.css">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Resistor Showcase</title>
</head>
<body class="bg-primary">

<nav class="navbar bg-primary navbar-dark sticky-top">
    <a class="navbar-brand ml-3" href="#">Resistor Showcase</a>
</nav>

<div class="container-fluid">
    <div class="row h-100">
        <div class="col-lg-4 bg-dark pt-5 pb-5">
            <form action="index.jsp" method="get">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="value-label">Value</span>
                    </div>
                    <input class="form-control" type="text" placeholder="Resistor value" onkeypress="return isNumberKey(event)" id="value" name="value" aria-describedby="value-label" required>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="tolerance-label">Tolerance</span>
                    </div>
                    <select name="tolerance" id="tolerance" class="custom-select" aria-describedby="tolerance-label">
                        <option value="0.1">0.1%</option>
                        <option value="0.25">0.25%</option>
                        <option value="0.5">0.5%</option>
                        <option value="1">1%</option>
                        <option value="2">2%</option>
                        <option value="5">5%</option>
                        <option value="10">10%</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="rings-label">Rings</span>
                    </div>
                        <input class="text-center" aria-describedby="rings-label" checked data-width="calc(100% - 100px)" type="checkbox" data-toggle="toggle" data-on="4 Rings" data-off="5 Rings" name="rings" id="rings" data-onstyle="success" data-offstyle="danger">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="e12-label">Only E12</span>
                    </div>
                    <input class="text-center" aria-describedby="e12-label" checked data-width="calc(100% - 100px)" type="checkbox" data-toggle="toggle" data-on="On" data-off="Off" name="e12" id="e12" data-onstyle="success" data-offstyle="danger">
                </div>
                <input class="btn btn-block btn-primary mt-5" type="submit" value="Show Resistor">
            </form>
        </div>
        <div class="col-lg-8 bg-light d-flex">
            <%
                String value = request.getParameter("value");
                String tolerance = request.getParameter("tolerance");

                if(value != null && tolerance != null){
            %>
            <img class="m-auto w-100" alt="" src="ResistorServlet?value=<%= value %>&tolerance=<%= tolerance %>">
            <%
                }
            %>
        </div>
    </div>
</div>


<script>
    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }

    $('body').on('scroll touchmove mousewheel', function(e){
        if($(window).width() > 992){
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
        return true;
    });

    $(window).on('resize', function(){
        $('.container-fluid').height($(window).height() - $('.navbar').innerHeight());
    });

    $(window).ready(function () {
        $('.container-fluid').height($(window).height() - $('.navbar').innerHeight());
    });
</script>

</body>
</html>