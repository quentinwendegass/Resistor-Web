package at.htlklu.resistor;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ResistorServlet")
public class ResistorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ResistorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BufferedImage img = getResistorImage(request.getParameter("value"), request.getParameter("tolerance"));
		
		response.setContentType("image/gif");
		ImageIO.write(img, "gif", response.getOutputStream());
		}
	
	private BufferedImage getResistorImage(String value, String tolerance){
		
		Color fistRing = Resistor.getColorForRing(Character.getNumericValue(value.charAt(0)));
		Color secondRing = Resistor.getColorForRing(Character.getNumericValue(value.charAt(1)));
		Color multiplierRing = Resistor.getColorForRing(value.length() - 2);
		Color toleranceRing = Resistor.getColorForTolerance(Float.parseFloat(tolerance));
		
		BufferedImage img = new BufferedImage(1200, 600, BufferedImage.TYPE_INT_ARGB);
		
		Graphics2D g = (Graphics2D) img.getGraphics();
		
		g.setColor(fistRing);
		g.fillRect(260, 100, 40, 400 + 1);
		g.setColor(secondRing);
		g.fillRect(360, 100, 40, 400 + 1);
		g.setColor(multiplierRing);
		g.fillRect(460, 100, 40, 400 + 1);
		g.setColor(toleranceRing);
		g.fillRect(600, 100, 40, 400 + 1);
		
		g.setColor(Color.BLACK);
		g.drawLine(0, 300, 200, 300);
		g.drawLine(1200, 300, 1000, 300);
		g.drawRect(200, 100, 800, 400);

		return img;
	}

    public static class Resistor{

        public static Color getColorForTolerance(float tolerance){
            int multipliedTolerance = (int)(tolerance * 100);
            switch (multipliedTolerance) {
                case 100:
                    return new Color(140, 70, 20);
                case 200:
                    return Color.RED;
                case 50:
                    return Color.GREEN;
                case 25:
                    return Color.BLUE;
                case 10:
                    return Color.PINK;
                case 500:
                    return Color.YELLOW;
                case 1000:
                    return Color.GRAY;
                default:
                    return null;
            }
        }

        public static Color getColorForRing(int value){
            switch (value) {
                case 0:
                    return Color.BLACK;
                case 1:
                    return new Color(140, 70, 20);
                case 2:
                    return Color.RED;
                case 3:
                    return Color.ORANGE;
                case 4:
                    return Color.YELLOW;
                case 5:
                    return Color.GREEN;
                case 6:
                    return Color.BLUE;
                case 7:
                    return Color.PINK;
                case 8:
                    return Color.GRAY;
                case 9:
                    return Color.WHITE;
                default:
                    return null;
            }
        }
    }
}
