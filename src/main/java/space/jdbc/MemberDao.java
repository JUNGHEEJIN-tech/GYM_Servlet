package space.jdbc;

import java.util.List;

import space.dto.Member;

public interface MemberDao {
	public List<Member> allList();
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(int idx);
	public Member findbyIdx(int idx);	
	public Member findbyId(String id, String pw);
}
