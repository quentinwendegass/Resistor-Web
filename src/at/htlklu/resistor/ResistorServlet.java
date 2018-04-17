package at.htlklu.resistor;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

        String value = request.getParameter("value");
        String tolerance = request.getParameter("tolerance");
        String fiveRings = request.getParameter("fiveRings");

        BufferedImage img;

        if(fiveRings.equals("true")){
            img = getResistorImage(value, tolerance, true);
        }else{
            img = getResistorImage(value, tolerance, false);
        }

		
		response.setContentType("image/gif");
		ImageIO.write(img, "gif", response.getOutputStream());
		}
	
	private BufferedImage getResistorImage(String value, String tolerance, boolean fiveRing){
        Color fistRing = Resistor.getColorForRing(Character.getNumericValue(value.charAt(0)));
		Color secondRing = Resistor.getColorForRing(Character.getNumericValue(value.charAt(1)));
		Color thirdRing = null;
		Color multiplierRing;
		if(fiveRing){
            thirdRing = Resistor.getColorForRing(Character.getNumericValue(value.charAt(2)));
            multiplierRing = Resistor.getColorForRing(value.length() - 3);
        }else{
		    multiplierRing = Resistor.getColorForRing(value.length() - 2);
        }
		Color toleranceRing = Resistor.getColorForTolerance(Float.parseFloat(tolerance));

		BufferedImage img = new BufferedImage(1600, 400, BufferedImage.TYPE_INT_ARGB);
		
		Graphics2D g = (Graphics2D) img.getGraphics();

        g.setColor(Color.BLACK);
        g.fillRect(0, 180, 201, 40);
        g.fillRect(1400, 180, 200, 40);
        g.setColor(new Color(220, 180, 130));
        g.fillOval(200,0, 400, 400);
        g.fillOval(1000,0, 400, 400);
        g.fillRect(400,40, 800, 320);

        g.setColor(fistRing);
		g.fillRect(550, 40, 40, 320);
		g.setColor(secondRing);
		g.fillRect(650, 40, 40, 320);
		if(thirdRing != null){
            g.setColor(thirdRing);
            g.fillRect(750, 40, 40, 320);
            g.setColor(multiplierRing);
            g.fillRect(850, 40, 40, 320);
        }else{
            g.setColor(multiplierRing);
            g.fillRect(750, 40, 40, 320);
        }
		if(toleranceRing != null){
            g.setColor(toleranceRing);
            g.fillRect(1000, 40, 40, 320);
        }

		return img;
	}
}
