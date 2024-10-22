package space.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import space.common.DataSource;
import space.dto.Member;

public class JdbcMemberDao implements MemberDao {

	@Override
	public List<Member> allList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(Member member) {
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
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(int idx) {
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
		
		return toLoginMember;
	}

}
