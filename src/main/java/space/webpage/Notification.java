package space.webpage;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

public class Notification extends JPanel {
	
	public Notification() {
		
		JTabbedPane notificationTabbedPane = new JTabbedPane();
		
		//공지사항
		JPanel announcementPanel = new JPanel();
		announcementPanel.add(new JLabel("이용자 준수 사항"));
		notificationTabbedPane.addTab("공지사항", announcementPanel);
		
		//자유게시판
		JPanel freeboardPanel = new JPanel();
		freeboardPanel.add(new JLabel("자유게시판"));
		notificationTabbedPane.addTab("자유게시판", freeboardPanel);
		
		//이 달의 일정
		JPanel monthschedulePanel = new JPanel();
		monthschedulePanel.add(new JLabel("이 달의 일정"));
		notificationTabbedPane.addTab("이 달의 일정", monthschedulePanel);
		
		//채용 공고
		JPanel recruitPanel = new JPanel();
		recruitPanel.add(new JLabel("채용 공고"));
		notificationTabbedPane.addTab("채용 공고", recruitPanel);
		
	}
}
