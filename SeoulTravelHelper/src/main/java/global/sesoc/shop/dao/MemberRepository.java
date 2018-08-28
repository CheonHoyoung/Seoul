package global.sesoc.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.shop.vo.Member;

@Repository
public class MemberRepository {
	@Autowired
	SqlSession session;
	/**
	 * 회원 가입
	 * @param member
	 * @return int 회원가입여부(0, 1)
	 */
	public int join(Member member){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.insert(member);		
		return result;
	}
	/**
	 * 회원정보 수정
	 * @param member
	 * @return int 회원정보 수정여부(0, 1)
	 */
	public int update(Member member){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.update(member);		
		return result;
	}
	/**
	 * 아이디 중복확인, 로그인
	 * @param member
	 * @return 조회된 Member
	 */
	public Member loginMember(Member member){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member m = mapper.loginMember(member);
		return m;
	}
	
}

/*
@Controller  --view랑 연동
@Repository  --db랑 연동
@Service     --로직작업
@Componentt  --bean이랑 (여러가지 잡다)
<bean> 으로 등록되는것은 위의 4가지 +1 
*/