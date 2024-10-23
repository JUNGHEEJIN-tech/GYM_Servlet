package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import space.common.DataSource;
import space.dto.Member;

public class JdbcMemberDao implements MemberDao {

	private JdbcMemberDao() {}	
	
	private static JdbcMemberDao instance = null;
	
	public static JdbcMemberDao getInstance() {
		if (instance == null) {
			instance = new JdbcMemberDao();
		}		
		return instance;
	}
	
	
	@Override
	public List<Member> allList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Member member) {
		int result = 0;
		
		String sql = "INSERT INTO MEMBER (LOGIN_ID, LOGIN_PW, NAME, REGIST_DATE, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, NOTE, PHONE) "
				+ "VALUES (?, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DataSource.getDataSource();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, member.getLogin_id());
			pstmt.setString(2, member.getLogin_pw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPost_code());
			pstmt.setString(5, member.getAddr());
			pstmt.setString(6, member.getAddr_detail());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getNote());
			pstmt.setString(9, member.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member findbyIdx(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member findbyId(String id, String pw) {
		// 로그인용
		Member toLoginMember = null;
		
		String sql = "SELECT * FROM MEMBER WHERE LOGIN_ID = ? "
				+ "AND LOGIN_PW = ?";
		
		try (Connection conn = DataSource.getDataSource();
		PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				toLoginMember = new Member(rs.getInt("MEMBER_IDX"),
								rs.getString("LOGIN_ID"),
								rs.getString("LOGIN_PW"),
								rs.getString("NAME"),
								rs.getDate("REGIST_DATE"),
								rs.getString("POST_CODE"),
								rs.getString("ADDR"),
								rs.getString("ADDR_DETAIL"),
								rs.getString("EMAIL"),
								rs.getString("NOTE"),
								rs.getString("PHONE"));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return toLoginMember;
	}

}
