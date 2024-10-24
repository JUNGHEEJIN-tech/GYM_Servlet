package space.webpage;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

public class UsageGuide extends JPanel{
	
	public UsageGuide() {
		
		JTabbedPane usagetabbedPane = new JTabbedPane();
		
		//이용 수칙 탭
		JPanel rulesPanel = new JPanel();
		rulesPanel.add(new JLabel("이용수칙 내용"));
		usagetabbedPane.addTab("이용수칙", rulesPanel);
		
		//방문접수 안내 탭
		JPanel visitPanel = new JPanel();
		visitPanel.add(new JLabel("방문접수 안내 내용"));
		usagetabbedPane.addTab("방문접수 안내", visitPanel);
		
		//상담 안내 탭
		JPanel counselGuidePanel = new JPanel();
		counselGuidePanel.add(new JLabel("상담 안내 내용"));
		usagetabbedPane.addTab("상담 안내", counselGuidePanel);
	}
}
