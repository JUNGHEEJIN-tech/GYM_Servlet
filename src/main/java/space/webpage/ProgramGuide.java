package space.webpage;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

public class ProgramGuide extends JPanel {

	public ProgramGuide() {
	
	JTabbedPane programTabbedPane = new JTabbedPane();
	
	//이용자 준수사항
	JPanel rulesPanel = new JPanel();
	rulesPanel.add(new JLabel("이용자 준수 사항"));
	programTabbedPane.addTab("이용자 준수사항", rulesPanel);
	
	//프로그램 안내
	JPanel programGuidePanel = new JPanel();
	programGuidePanel.add(new JLabel("프로그램 안내"));
	programTabbedPane.addTab("프로그램 안내", programGuidePanel);
	
	this.setLayout(new java.awt.BorderLayout());
	this.add(programTabbedPane);
	
	}
}
