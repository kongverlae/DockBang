package com.dockbang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import com.dockbang.model.BoardTO;
import com.dockbang.model.MemberTO;


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

	String selectUserName(@Param("email") String email);

	// 로그인 유저 소셜 유무, 이메일, 이름 가져오기
	@Select("SELECT social, email, name FROM user WHERE email=#{email}")
	MemberTO selectUserInfo(@Param("email") String email);
	
	// 게시판 리스트 출력
	@Select("select boardseq, subject, writer, wdate from board where category = #{category}")
	List<BoardTO> selectBoard(@Param("category") String category);
	
	// 게시판 저장
	@Insert("insert into board(boardseq, subject, writer, content, filename, filesize, hit, wip, wdate, mail, category) "
			+ "values (0, #{subject}, #{writer}, #{content}, #{filename}, #{filesize}, 0, #{wip}, now(), #{email}, #{category})")
	int insertBoard(@Param("subject") String subject,
			@Param("writer") String writer,
			@Param("content") String content,
			@Param("filename") String filename,
			@Param("filesize") long filesize,
			@Param("wip") String wip,
			@Param("email") String email,
			@Param("category") String category);
		
		
	
}
