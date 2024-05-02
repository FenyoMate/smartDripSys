import jason.asSyntax.*;
import jason.environment.Environment;
import jason.environment.grid.GridWorldModel;
import jason.environment.grid.GridWorldView;
import jason.environment.grid.Location;

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

import jason.asSyntax.*;
import jason.environment.*;
import jason.asSyntax.parser.*;

import java.util.logging.*;

public class Env extends Environment {

    private Logger logger = Logger.getLogger("smartDripSys."+Env.class.getName());
    JButton button = new JButton("Park my car!");

    public Env() {
        JFrame frame = new JFrame("Car parking system");


    	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));

		JPanel xPanel = new JPanel(new BorderLayout());
		Label xLabel = new Label("x");
		JTextField xField = new JTextField("2");
		xPanel.add(xLabel, BorderLayout.WEST);
		xPanel.add(xField, BorderLayout.CENTER);

		JPanel yPanel = new JPanel(new BorderLayout());
		Label yLabel = new Label("y");
		JTextField yField = new JTextField("2");
		yPanel.add(yLabel, BorderLayout.WEST);
		yPanel.add(yField, BorderLayout.CENTER);

		frame.add(button, BorderLayout.NORTH);


		button.addActionListener((e) -> {
			button.setEnabled(false);
    	 //   Literal percept = ASSyntax.createLiteral(
    		//);
    	});
		frame.getContentPane().add(xPanel);
		frame.getContentPane().add(yPanel);
    	frame.getContentPane().add(button);
    	frame.pack();
    	frame.setSize(300, 150);
    	frame.setVisible(true);
    }

    /** Called before the MAS execution with the args informed in .mas2j */
    @Override
    public void init(String[] args) {
        super.init(args);
        try {
            addPercept(ASSyntax.parseLiteral("percept("+args[0]+")"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean executeAction(String agName, Structure action) {
        logger.info("executing: "+action+", but not implemented!");
        if (true) { // you may improve this condition
             informAgsEnvironmentChanged();
        }
        return true; // the action was executed with success
    }

    /** Called before the end of MAS execution */
    @Override
    public void stop() {
        super.stop();
    }

}
