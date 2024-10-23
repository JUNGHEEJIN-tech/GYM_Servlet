package space.jdbc;

import java.util.List;

import space.dto.Member;

public interface MemberDao {
	public List<Member> allList();
	public int insert(Member member);
	public int update(Member member);
	public int delete(int idx);
	public Member findbyIdx(int idx);	
	public Member findbyId(String id, String pw);
}
