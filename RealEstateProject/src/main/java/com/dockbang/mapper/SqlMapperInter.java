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
import com.dockbang.model.FoodTO;
import com.dockbang.model.MemberTO;
import com.dockbang.model.MovieTO;
import com.dockbang.model.PoliceTO;
import com.dockbang.model.SaleTO;
import com.dockbang.model.SubwayStationTO;


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
	@Select("select name,password from user where email=#{email}")
	String selectUserName(@Param("email") String email);
	
	// 일반 로그인 유저 비밀번호 갖고 오기
		@Select("select password from user where email=#{email}")
		String selectUserPassword(@Param("email") String email);

	// 로그인 유저 소셜 유무, 이메일, 이름 가져오기
	@Select("SELECT social, email, name FROM user WHERE email=#{email}")
	MemberTO selectUserInfo(@Param("email") String email);
	
	// 게시판 리스트 출력
	@Select("select boardseq, subject, writer, wdate from board where category = #{category} order by boardseq desc")
	List<BoardTO> selectBoard(@Param("category") String category);
	
	// 게시판 View 출력
	@Select("select subject, writer, mail, wip, wdate, hit, content from board where boardseq =#{boardseq}")
	List<BoardTO> selectView(@Param("boardseq") Integer boardseq);

	// hit hit+1
	@Update("update board set hit=hit+1 where boardseq =#{boardseq}")
	void updateHit(@Param("boardseq") Integer boardseq);
	
	// 지도 경계선 표시 
	@Select("select lon from navermap")
	List<String> selectlon();
	
	// 지도 경계선 표시
	@Select("select lat from navermap")
	List<String> selectlat();
	
	// 지도 경계선 표시
	@Select("select local from navermap")
	List<String> selectlocal();
	
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
	
	// 게시판 수정
	@Update("update board set subject = #{subject}, content = #{content}, filename = #{filename}, filesize = #{filesize} where category = #{category} AND boardseq = #{boardseq}")
	int updateBoard(@Param("subject") String subject,
	        @Param("content") String content,
	        @Param("filename") String filename,
	        @Param("filesize") long filesize,
	        @Param("category") String category,
	        @Param("boardseq") int boardseq);
	// 게시글 삭제
	@Delete("delete from board where category = #{category} AND boardseq = #{boardseq}")
	int deleteBoard(@Param("category") String category,
			@Param("boardseq") int boardseq);

	// 역 정보(단일) 가져오기
	@Select("select name, subway_line, latitude, longitude from subway_station group by name having name = #{name};")
	SubwayStationTO getStation(@Param("name") String name);
	
	// 역 정보(전체) 가져오기
	@Select("select name, subway_line, latitude, longitude from subway_station;")
	List<SubwayStationTO> getStations();
	
	// 역 정보 가져오기
	@Select("select name, subway_line, latitude, longitude from subway_station group by name;")
	List<SubwayStationTO> getStationsGroupByName();
	
	// saleTO 참고
	@Select("select title, lat, lon from sale")
	List<SaleTO> getSales();
	
	// saleTO 참고
	@Select("select * from sale where title = #{title}")
	List<SaleTO> getSalesinfo(@Param("title") String title);
		
	// 
	@Insert("insert into sale_near_station values("
			+ "0, #{stationName}, #{stationLine}, #{saleName}, #{saleDistance}"
			+ ")")
	int insertDistanceStationSale(
			String stationName,
			String stationLine,
			String saleName,
			double saleDistance
			);
	
	// 컬럼: SaleTO 참고
	// seq를 이용해 sale 가져오기
	@Select("select * from sale where sale_seq = #{sale_seq}")
	SaleTO getSale(String sale_seq);
	
	// 컬럼: SaleTO 참고
	// 공간DB 이용 - 기준점으로부터 1km이내 매물 가져오기
	@Select("select *, "
			+ "ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
			+ "from sale "
			+ "where ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) < (#{distance} * 1000)")
	List<SaleTO> getSalesNearStation(double lon, double lat, String distance);
	
	// 공간DB 이용 - 기준점으로부터 제일 가까운 편의시설(음식점) 하나 가져오기
	@Select("select business_name, business_type, road_address, ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
			+ "from food "
			+ "group by ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) "
			+ "having distance is not null "
			+ "limit 1")
	FoodTO getFoodNearPoint(double lon, double lat);
	
	// 공간DB 이용 - 기준점으로부터 제일 가까운 편의시설(영화관) 하나 가져오기
	@Select("select business_name, ji_address, ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
			+ "from movie "
			+ "group by ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) "
			+ "having distance is not null "
			+ "limit 1")
	MovieTO getMovieNearPoint(double lon, double lat);
	
	// 공간DB 이용 - 기준점으로부터 제일 가까운 편의시설(경찰서) 하나 가져오기
	@Select("select division, address, ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
			+ "from police "
			+ "group by ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) "
			+ "having distance is not null "
			+ "limit 1")
	PoliceTO getPopliceNearPoint(double lon, double lat);
	
}
