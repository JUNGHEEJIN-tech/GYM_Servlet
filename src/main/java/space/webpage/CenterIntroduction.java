package space.webpage;

import javax.swing.*;

public class CenterIntroduction extends JFrame {
    public CenterIntroduction() {
        setTitle("센터소개");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        
        // JTabbedPane 생성
        JTabbedPane tabbedPane = new JTabbedPane();
        
        // 인사말 탭
        JPanel greetingsPanel = new JPanel();
        greetingsPanel.add(new JLabel("인사말 내용"));
        tabbedPane.addTab("인사말", greetingsPanel);
        
        // 지도자 소개 탭
        JPanel leaderPanel = new JPanel();
        leaderPanel.add(new JLabel("지도자 소개 내용"));
        tabbedPane.addTab("지도자 소개", leaderPanel);
        
        // 오시는 길 탭
        JPanel directionsPanel = new JPanel();
        directionsPanel.add(new JLabel("오시는 길 내용"));
        tabbedPane.addTab("오시는 길", directionsPanel);
        
        // JTabbedPane을 프레임에 추가
        add(tabbedPane);
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            CenterIntroduction frame = new CenterIntroduction();
            frame.setVisible(true);
        });
    }
}
