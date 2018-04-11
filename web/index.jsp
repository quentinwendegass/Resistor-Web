<%@ page import="at.htlklu.resistor.ResistorServlet" %>
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
                    <div class="invalid-feedback">
                        Please type in a higher number!
                    </div>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="tolerance-label">Tolerance</span>
                    </div>
                    <select name="tolerance" id="tolerance" class="custom-select" aria-describedby="tolerance-label">
                        <option value="0.05">0.05%</option>
                        <option value="0.1">0.1%</option>
                        <option value="0.25">0.25%</option>
                        <option value="0.5">0.5%</option>
                        <option value="1">1%</option>
                        <option value="2">2%</option>
                        <option value="5">5%</option>
                        <option value="10">10%</option>
                        <option value="0">20%</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="rings-label">Rings</span>
                    </div>
                        <input class="text-center" aria-describedby="rings-label" minlength="3" checked data-width="calc(100% - 100px)" type="checkbox" data-toggle="toggle" data-on="5 Rings" data-off="4 Rings" name="fiveRings" value="true" id="rings" data-onstyle="success" data-offstyle="danger">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="e12-label">Only E12</span>
                    </div>
                    <input class="text-center" aria-describedby="e12-label" checked data-width="calc(100% - 100px)" type="checkbox" data-toggle="toggle" data-on="On" data-off="Off" name="e12" value="true" id="e12" data-onstyle="success" data-offstyle="danger">
                </div>
                <input class="btn btn-block btn-primary mt-5" type="submit" value="Show Resistor">
            </form>
        </div>
        <div class="col-lg-8 bg-light d-flex">
            <div class="w-100 m-auto">
                <h3 id="value-showcase" class="w-100 text-center"></h3>
                <img class="w-100" alt="" src="">
            </div>

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

    $(document).ready(function () {
        $("input[type='submit']").click(function (e) {
            e.preventDefault();
            var value = $("#value").val();

            if($("#e12").prop('checked')){
                value = Math.round(e12Value(value));
            }

            if($("#rings").prop('checked')){
                if(value.toString().length < 3){
                    $('#value').addClass("is-invalid");
                    $('#value-showcase').html("");
                    $('img').attr("src", "");
                }else{
                    $('#value').removeClass("is-invalid");
                    $('img').attr("src", "ResistorServlet?value=" + value + "&tolerance=" + $("#tolerance").val() + "&fiveRings=true");
                    $('#value-showcase').html(value + "&#8486;");
                }
            }else{
                if(value.toString().length < 2){
                    $('#value').addClass("is-invalid");
                    $('#value-showcase').html("");
                    $('img').attr("src", "");
                }else{
                    $('#value').removeClass("is-invalid");
                    $('img').attr("src", "ResistorServlet?value=" + value + "&tolerance=" + $("#tolerance").val() + "&fiveRings=false");
                    $('#value-showcase').html(value + "&#8486;");
                }
            }
        });
    });

    var E12_SERIES = [1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2];

    function e12Value(val) {

        var e12;

        var found = false;
        for(var i = 1; true; i*=10){
            if(found) break;
            for(var j = 0; j < E12_SERIES.length; j++){
                if(E12_SERIES[j] * i > val){
                    if(j == 0){
                        if((val - E12_SERIES[E12_SERIES.length - 1] * (i / 10)) < (E12_SERIES[j] * i - val)){
                            e12 = E12_SERIES[E12_SERIES.length - 1] * (i / 10);
                        }else{
                            e12 = E12_SERIES[j] * i;
                        }
                    }else{
                        if((val - E12_SERIES[j - 1] * i) < (E12_SERIES[j] * i - val)){
                            e12 = E12_SERIES[j - 1] * i;
                        }else{
                            e12 = E12_SERIES[j] * i;
                        }
                    }
                    found = true;
                    break;
                }
            }
        }
        return e12;
    }

</script>

</body>
</html>