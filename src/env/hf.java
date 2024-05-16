import jason.asSyntax.*;
import jason.environment.Environment;
import jason.environment.grid.GridWorldModel;
import jason.environment.grid.GridWorldView;
import jason.environment.grid.Location;
import jason.asSyntax.parser.ParseException;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Label;
import java.util.Random;
import java.util.logging.Logger;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;



public class hf extends Environment {
	
    private Logger logger = Logger.getLogger("smartDripSys."+hf.class.getName());
    JButton button = new JButton("Start dripping");

	public static final Term poll = Literal.parseLiteral("poll(N)");
	public static final Term water = Literal.parseLiteral("watering(field)");
	public static final Term dry = Literal.parseLiteral("dry(field)");


    public hf() {
        JFrame frame = new JFrame("Smart Drip Sys");


    	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));

		JPanel s1Panel = new JPanel(new BorderLayout());
		Label s1Label = new Label("Sensor 1");
		JTextField s1Field = new JTextField("2");
		s1Panel.add(s1Label, BorderLayout.WEST);
		s1Panel.add(s1Field, BorderLayout.CENTER);

		JPanel s2Panel = new JPanel(new BorderLayout());
		Label s2Label = new Label("Sensor 2");
		JTextField s2Field = new JTextField("2");
		s2Panel.add(s2Label, BorderLayout.WEST);
		s2Panel.add(s2Field, BorderLayout.CENTER);

		JPanel s3Panel = new JPanel(new BorderLayout());
		Label s3Label = new Label("Sensor 3");
		JTextField s3Field = new JTextField("2");
		s3Panel.add(s3Label, BorderLayout.WEST);
		s3Panel.add(s3Field, BorderLayout.CENTER);

		JPanel cPanel = new JPanel(new BorderLayout());
		Label cLabel = new Label("Controller Threshold");
		JTextField cField = new JTextField("2");
		cPanel.add(cLabel, BorderLayout.WEST);
		cPanel.add(cField, BorderLayout.CENTER);

		frame.add(button, BorderLayout.NORTH);


		button.addActionListener((e) -> {
			button.setEnabled(false);
    	 //   Literal percept = ASSyntax.createLiteral(
    		//);
    	});
		frame.getContentPane().add(s1Panel);
		frame.getContentPane().add(s2Panel);
		frame.getContentPane().add(s3Panel);
		frame.getContentPane().add(cPanel);
    	frame.getContentPane().add(button);
    	frame.pack();
    	frame.setSize(550, 200);
    	frame.setVisible(true);
    }

    /** Called before the MAS execution with the args informed in .mas2j */
    @Override
    public void init(String[] args) {
        
		//TODO: Panelek inicializálása és beállítása
		/* Modell követelmények:
		 * - Legyen gomb esőzésre
		 * - +- gombok a nedvesedés manuális állítására (0-1 között) ágensenként
		*/
    }

    @Override
    public boolean executeAction(String agName, Structure action) {
        

		try{
			switch (action.getFunctor()) {
				case "scan": //Bejövő parancs az ágensektől
					logger.info( action.getFunctor() +" Scanning event " + agName); //KI: "scan Scanning event control"
					addPercept(agName, Literal.parseLiteral("scanning"));
				break;
				default:
					logger.info("Unknown action: " + action);
					return false;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		delay(500);
		return true;
    }

	public void delay(long ms){
		try {
			Thread.sleep(ms);
		} catch (Exception e) {}
	}

    /** Called before the end of MAS execution */
    @Override
    public void stop() {
        super.stop();
    }

}

