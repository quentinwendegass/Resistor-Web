<?php

$img = ImageCreateTrueColor(1600,400);
$transparent = ImageColorAllocateAlpha($img, 244,0,0,127);
ImageFill($img,0,0, $transparent);
ImageColorTransparent($img, $transparent);

$white = ImageColorAllocate($img,0xFF,0xFF,0xFF);
$black = ImageColorAllocate($img,0x00,0x00,0x00);
$brown = ImageColorAllocate($img,90,40,20);
$red = ImageColorAllocate($img,140,0,0);
$green = ImageColorAllocate($img,0,140,0);
$blue = ImageColorAllocate($img,0,0,140);
$violet = ImageColorAllocate($img,100,20,100);
$yellow = ImageColorAllocate($img,200,200,0);
$silver = ImageColorAllocate($img,160,160,150);
$orange = ImageColorAllocate($img,200,100,20);
$grey = ImageColorAllocate($img,110,110,100);
$gold = ImageColorAllocate($img,200,150,0);


function getColorForRing($value){
    switch ($value) {
        case 0:
            return $GLOBALS["black"];
        case 1:
            return $GLOBALS["brown"];
        case 2:
            return $GLOBALS["red"];
        case 3:
            return $GLOBALS["orange"];
        case 4:
            return $GLOBALS["yellow"];
        case 5:
            return $GLOBALS["green"];
        case 6:
            return $GLOBALS["blue"];
        case 7:
            return $GLOBALS["violet"];
        case 8:
            return $GLOBALS["grey"];
        case 9:
            return $GLOBALS["white"];
        default:
            return null;
    }
}

function getColorForTolerance($tolerance){
    switch ($tolerance){
        case "1":
            return $GLOBALS["brown"];
        case "2":
            return $GLOBALS["red"];
        case "0.5":
            return $GLOBALS["green"];
        case "0.25":
            return $GLOBALS["blue"];
        case "0.1":
            return $GLOBALS["violet"];
        case "0.05":
            return $GLOBALS["grey"];
        case "5":
            return $GLOBALS["gold"];
        case "10":
            return $GLOBALS["silver"];
        default:
            return null;
    }
}


$value = $_GET["value"];
$tolerance = $_GET["tolerance"];
$fiveRings = $_GET["fiveRings"];


$firstRingColor = getColorForRing($value[0]);
$secondRingColor = getColorForRing($value[1]);

if($fiveRings == "true"){
    $thirdRingColor = getColorForRing($value[2]);
    $multiplierRingColor = getColorForRing(strlen($value) - 3);
}else{
    $multiplierRingColor = getColorForRing(strlen($value) - 2);
}

$toleranceRingColor = getColorForTolerance($tolerance);

$resistorColor = ImageColorAllocate($img,220,180,130);

ImageFilledRectangle($img,0,180,201,220,$black);
ImageFilledRectangle($img,1400,180,1600,220,$black);

ImageFilledArc($img, 400, 200, 400, 400, 0, 360, $resistorColor, IMG_ARC_PIE);
ImageFilledArc($img, 1200, 200, 400, 400, 0, 360, $resistorColor, IMG_ARC_PIE);
ImageFilledRectangle($img,400,40,1200,360,$resistorColor);

ImageFilledRectangle($img,550,40,590,360, $firstRingColor);
ImageFilledRectangle($img,650,40,690,360, $secondRingColor);
if($fiveRings == "true"){
    ImageFilledRectangle($img,750,40,790,360,$thirdRingColor);
    ImageFilledRectangle($img,850,40,890,360,$multiplierRingColor);
}else{
    ImageFilledRectangle($img,750,40,790,360,$multiplierRingColor);
}
if($toleranceRingColor != null)
    ImageFilledRectangle($img,1000,40,1040,360,$toleranceRingColor);

ImageSaveAlpha($img, true);
header('Content-Type: image/png');
ImagePNG($img);