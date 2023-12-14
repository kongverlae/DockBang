package com.dockbang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;


@Mapper
public interface SqlMapperInter {
//	MyBatis - annotation Guide
	
	
//	DAO / Mapper 이용시 반드시 @Autowired 처리 되있는 변수를 사용할 것 (new ~~ 생성 X)

	
	
//	annotation으로 dml문 지정 후 sql문 작성
//	반환형과 파라미터 형식 맞게 작성
	
//	Ex
//	@Select("select seq, subject, writer, filename, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from album_board2 order by seq desc")
//	List<BoardTO> list();

//	@Update("update album_board2 set hit=hit+1 where seq=#{seq}")
//	int view_hit(@Param("seq") String seq);	

	// 일반 회원가입을 통한 유저 정보 저장
	@Insert("insert into user(userseq, email, password, name, usercheck, social) values (0, #{email}, #{password},#{name} , '사용자', 'x')")
	int insertUser(@Param("name") String name,
			@Param("email") String email,
			@Param("password") String password);
	// 카카오 로그인 api를 통한 유저 정보 저장
	@Insert("insert into user(userseq, email, name, usercheck, social) values (0, #{email}, #{name}, '사용자', 'o')")
	int insertKakaoUser(@Param("name") String name,
			@Param("email") String email);
	
	// 카카오 로그인 api를 통한 유저 정보 출력
	@Select("select count(*) from user where email=#{email}")
	int selectKakaoUser(@Param("email") String email);

	// 일반 로그인 유저 정보 일치 확인
	@Select("SELECT COUNT(*) FROM user WHERE email=#{email} AND password=#{password}")
	int selectUser(@Param("email") String email, @Param("password") String password);
	
	// 일반 로그인 유저 이름 갖고 오기
	@Select("select name from user where email=#{email}")
	String selectUserNmae(@Param("email") String email);
	
}
