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

public class hf extends Environment {
    private Logger logger = Logger.getLogger("smartDripSys."+Env.class.getName());
    JButton button = new JButton("Start dripping");

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

