<!DOCTYPE html>
<html class="h-100 bg-light">
<head>
    <script src="scripts/jquery-3.3.1.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/bootstrap-toggle.min.js"></script>
    <script src="scripts/index.js" type="application/javascript"></script>

    <link rel="stylesheet" href="styles/bootstrap.min.css">
    <link rel="stylesheet" href="styles/bootstrap-toggle.min.css">
    <link rel="stylesheet" href="styles/custom-styles.css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Resistor Showcase</title>
</head>
<body class="bg-light">

<nav class="navbar bg-primary navbar-dark sticky-top">
    <a class="navbar-brand ml-3 text-md-left text-center w-100" href="#">Resistor Showcase</a>
</nav>

<div class="container-fluid bg-info">
    <div class="row h-100 btn-primary">
        <div class="col-md-4 bg-dark pt-5 pb-5">
            <form action="" method="get">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="value-label">Value</span>
                    </div>
                    <input class="form-control" type="text" placeholder="Resistor value" onkeypress="return isValidInput(event)" id="value" name="value" aria-describedby="value-label" required>
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
        <div class="col-md-8 bg-light d-flex hidden" id="showcase">
            <div class="w-100 m-auto">
                <h3 id="value-showcase" class="w-100 text-center"></h3>
                <img class="w-100" alt="" src="">
            </div>
        </div>
    </div>
</div>

</body>
</html>