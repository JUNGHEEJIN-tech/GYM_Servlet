package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
		
		List<Member> mLst = new ArrayList<Member>();
		
		String sql = "SELECT * FROM MEMBER";
				
		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Member member = new Member();
				
				pstmt.setString(1, member.getLogin_id());
				pstmt.setString(2, member.getLogin_pw());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getPost_code());
				pstmt.setString(5, member.getAddr());
				pstmt.setString(6, member.getAddr_detail());
				pstmt.setString(7, member.getEmail());
				pstmt.setString(8, member.getNote());
				pstmt.setString(9, member.getPhone());
				
				mLst.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return mLst;
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
		
		
		//COALESCE 사용할것.
		
		String sql = "UPDATE MEMBER set  "
				+ "LOGIN_PW = COALESCE(?, login_pw), "
				+ "POST_CODE = COALESCE(?, post_code), "
				+ "ADDR = COALESCE(?, addr), "
				+ "ADDR_DETAIL = COALESCE(?, addr_detail), "
				+ "EMAIL = COALESCE(?, email), "
				+ "NOTE = COALESCE(?, note), "
				+ "PHONE = COALESCE(?, phone) "
				+ "WHERE MEMBER_IDX = ?";

		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, member.getLogin_pw());
			pstmt.setString(2, member.getPost_code());
			pstmt.setString(3, member.getAddr());
			pstmt.setString(4, member.getAddr_detail());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getNote());
			pstmt.setString(7, member.getPhone());
			
			pstmt.setInt(8, member.getIdx());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return 0;
	}

	// 비밀번호 초기화 테스트 완료
	public boolean initPasswoard(int idx) {
		boolean result = false;

		String sql = "UPDATE MEMBER SET LOGIN_PW = 'a1234' WHERE MEMBER_IDX = ?";

		try (Connection conn = DataSource.getDataSource(); 
				PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	
	//데이터 삭제문, 성공 시 1 을 반환함.
	@Override
	public int delete(int idx) {
		
		int result = 0;

		String sql = "DELETE MEMBER WHERE MEMBER_IDX = ?";
		
		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	public boolean deleteByLoginId(String loginId)
	{	
		boolean result = false;

		String sql = "DELETE MEMBER WHERE LOGIN_ID = ?";
		
		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result; 
	}


	@Override
	public Member findbyIdx(int idx) {
		
		Member toLoginMember= null;
		
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_IDX = ?";
				
		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, idx);
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
			e.printStackTrace();
		}
		
		return toLoginMember;
	}

	@Override
	public Member findbyId(String id, String pw) {
		// 로그인용
		Member toLoginMember = null;

		String sql = "SELECT * FROM MEMBER WHERE LOGIN_ID = ? " + "AND LOGIN_PW = ?";

		try (Connection conn = DataSource.getDataSource(); PreparedStatement pstmt = conn.prepareStatement(sql)) 
		{
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
	
//	public static void main(String[] args) {
//		//
//		
//		int a = JdbcMemberDao.getInstance().delete(21);
//		System.out.println(a);
//	}
	
	
	
//	public static void main(String[] args) {
//		Member m = new Member();
//		m.setIdx(1);
//		m.setAddr("sex");
//		
//		JdbcMemberDao.getInstance().update(m);
//		
//
//		//테스트 완료		
//		//JdbcMemberDao.getInstance().initPasswoard(1);
//		
//	}
	
	
	//중복되는 Login Id 가 존재 할 경우 true 반환.
	public boolean checkOverlabId(String loginId)
	{
		boolean result = false;
		
		String sql = "SELECT * FROM MEMBER WHERE LOGIN_ID = ?";
		
		try (Connection conn = DataSource.getDataSource();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

}
