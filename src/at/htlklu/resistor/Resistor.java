package at.htlklu.resistor;

import java.awt.*;

public class Resistor{

    public static Color BROWN = new Color(90, 40, 20);
    public static Color RED = new Color(140, 0, 0);
    public static Color BLUE = new Color(0, 0, 140);
    public static Color GREEN = new Color(0, 140, 0);
    public static Color VIOLET = new Color(100, 20, 100);
    public static Color YELLOW = new Color(200, 200, 0);
    public static Color SILVER = new Color(160, 160, 150);
    public static Color ORANGE = new Color(200, 100, 20);
    public static Color GREY = new Color(110, 110, 100);
    public static Color GOLD = new Color(180,180,70);


    public static Color getColorForTolerance(float tolerance){
        int multipliedTolerance = (int)(tolerance * 100);
        switch (multipliedTolerance) {
            case 100:
                return BROWN;
            case 200:
                return RED;
            case 50:
                return GREEN;
            case 25:
                return BLUE;
            case 10:
                return VIOLET;
            case 5:
                return GREY;
            case 500:
                return GOLD;
            case 1000:
                return SILVER;
            default:
                return null;
        }
    }

    public static Color getColorForRing(int value){
        switch (value) {
            case 0:
                return Color.BLACK;
            case 1:
                return BROWN;
            case 2:
                return RED;
            case 3:
                return ORANGE;
            case 4:
                return YELLOW;
            case 5:
                return GREEN;
            case 6:
                return BLUE;
            case 7:
                return VIOLET;
            case 8:
                return GREY;
            case 9:
                return Color.WHITE;
            default:
                return null;
        }
    }
}
