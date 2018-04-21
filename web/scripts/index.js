$(window).on('resize', function(){
    $('.container-fluid').height($(window).height() - $('.navbar').innerHeight());
});

$(window).ready(function () {
    $('.container-fluid').height($(window).height() - $('.navbar').innerHeight());
});

$(document).ready(function () {
    $('body').on('scroll touchmove mousewheel', function(e){
        e.preventDefault();
        e.stopPropagation();
        return false;
    });

    $("input[type='submit']").click(function (e) {
        e.preventDefault();
        var value = $("#value").val();
        var numericValue = "";
        for(var i = 0; i < value.length; i++){
            var digit = value.charAt(i);
            switch(digit){
                case 'k':
                    numericValue += "000";
                    break;
                case 'M':
                    numericValue += "000000";
                    break;
                case 'G':
                    numericValue += "000000000";
                    break;
                default:
                    if(numericValue.length > i){
                        numericValue = numericValue.substr(0, i - 1) + digit + numericValue.substr(i);
                    }else{
                        numericValue += digit;
                    }
            }
        }

        if($("#e12").prop('checked')){
            numericValue = Math.round(e12Value(numericValue));
        }

        var temp = "";
        if(numericValue.toString().length > 9){
            temp = valueToString(numericValue, 'G', 9);
        }else if(numericValue.toString().length > 6){
            temp = valueToString(numericValue, 'M', 6);
        }else if(numericValue.toString().length > 3){
            temp = valueToString(numericValue, 'k', 3);
        }

        if(temp.toString().length > 0)
            value = temp;
        else
            value = numericValue;

        if($("#rings").prop('checked')){
            if(numericValue.toString().length < 3){
                $('#value').addClass("is-invalid");
                $('#value-showcase').html("");
                $('img').attr("src", "");
                $('#showcase').addClass("hidden");
            }else{
                $('#value').removeClass("is-invalid");
                $('img').attr("src", "resistor.php?value=" + numericValue + "&tolerance=" + $("#tolerance").val() + "&fiveRings=true");
                $('#value-showcase').html(value + "&#8486;");
                $('#showcase').removeClass("hidden");
            }
        }else{
            if(numericValue.toString().length < 2){
                $('#value').addClass("is-invalid");
                $('#value-showcase').html("");
                $('img').attr("src", "");
                $('#showcase').addClass("hidden");
            }else{
                $('#value').removeClass("is-invalid");
                $('img').attr("src", "resistor.php?value=" + numericValue + "&tolerance=" + $("#tolerance").val() + "&fiveRings=false");
                $('#value-showcase').html(value + "&#8486;");
                $('#showcase').removeClass("hidden");
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

function valueToString(value, symbol, digits) {
    var temp = "";
    for(var i = 0; i < value.toString().length - digits; i++){
        temp += value.toString().charAt(i);
    }
    temp += symbol;
    if(value.toString().charAt(value.toString().length - digits) !== '0')
        temp += value.toString().charAt(value.toString().length - digits);

    return temp;
}

function isValidInput(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode === 13 || (charCode > 36 && charCode < 41) || (charCode > 47 && charCode < 58)) {
        return true;
    }else if(charCode === 71 || charCode === 107 || charCode === 77){
        var val = $("#value").val();

        if(val.length === 0) return false;

        for(var i = 0; i < val.length; i++){
            if(val.charAt(i) === 'k' || val.charAt(i) === 'G' || val.charAt(i) === 'M'){
                return false;
            }
        }
        return true;
    }
    return false;
}
