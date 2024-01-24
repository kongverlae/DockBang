package com.dockbang.mapper;

import java.util.List;
import java.util.Map;

import com.dockbang.model.*;
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
	String selectUserName(@Param("email") String email);
	
	// 이메일로 유저 전체 정보 갖고 오기
	@Select("select * from user where email=#{email}")
	MemberTO selectUserFromEmail(@Param("email") String email);
	
	// 로그인 유저 소셜 유무, 이메일, 이름 가져오기
	@Select("SELECT social, email, name FROM user WHERE email=#{email}")
	MemberTO selectUserInfo(@Param("email") String email);
	
	// 유저 북마크 추가
	@Insert("insert into bookmark (useremail, saleseq, memo) values (#{userEmail}, #{saleSeq}, #{memo})")
	int addUserBookmark(String userEmail, String saleSeq, String memo);

	// 유저 북마크 검색
	@Select("select bookmarkseq, useremail, memo, saleseq from bookmark where useremail=#{userEmail}")
	List<BookmarkTO> getUserBookmark(String userEmail);
	
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
	
	// 댓글 리스트 출력
	@Select("select writer, content, wdate from comment where boardseq = #{boardseq} order by commentseq desc")
	List<CommentTO> selectComment(@Param("boardseq") Integer boardseq);
	
	// 댓글 추가
	@Insert("INSERT INTO comment(commentseq, content, userseq, writer, boardseq, wdate) "
	        + "VALUES (0, #{content},#{userseq} , #{writer}, #{boardseq}, now())")
	int insertComment(@Param("content") String content,
						@Param("userseq") String userseq,
	                  @Param("writer") String writer,
	                  @Param("boardseq") int boardseq);
	
	// 댓글 삭제
	@Delete("delete from comment where userseq = #{userseq}")
	int deleteComment(@Param("userseq") String userseq);
	
	// 역 정보(단일) 가져오기
	@Select("select name, subway_line, latitude, longitude from subway_station group by name having name = #{name};")
	SubwayStationTO getStation(@Param("name") String name);
	
	// 역 정보(전체) 가져오기
	@Select("select name, subway_line, latitude, longitude from subway_station;")
	List<SubwayStationTO> getStations();
	
	// 역 정보 가져오기
	@Select("select name, subway_line, latitude, longitude from subway_station group by name;")
	List<SubwayStationTO> getStationsGroupByName();
	
	// 히스토리 저장
	@Insert("insert into history (historyseq, userseq, saleseq) values (0, #{userseq}, #{saleseq})")
	int insertUserHistory(String userseq, String saleseq);
	
	// 히스토리 가져오기
	@Select("select historyseq, userseq, saleseq from history where userseq = #{userseq}")
	List<HistoryTO> getUserHistory(String userseq);
	
	// saleTO 참고
	//@Select("select title, lat, lon from sale")
	//@Select("select title, lat, lon, sale_type from sale")
	@Select("select title, lat, lon, sale_seq from sale")
	//@Select("select * from sale")
	//@Select("select * from sale limit 1000") // 원활한 작업을 위해 변경함
	List<SaleTO> getSales();
	
	// saleTO 참고
	@Select("select * from sale where title = #{title}")
	List<SaleTO> getSalesinfo(@Param("title") String title);
		
	// 컬럼: SaleTO 참고
	// seq를 이용해 sale 전체정보 가져오기
	@Select("select * from sale where sale_seq = #{sale_seq}")
	SaleTO getSale(String sale_seq);
	
	// 컬럼: SaleTO 참고
	// seq를 이용해 sale list에 표시할 정보 가져오기
	@Select("select sale_seq, "
			+ "sale_pic, "
			+ "sale_type, "
			+ "price, "
			+ "deposit, "
			+ "monthly_fee, "
			+ "house_type, "
			+ "area, "
			+ "floor, "
			+ "height, "
			+ "address "
			+ "from sale where sale_seq = #{sale_seq}")
	SaleTO getSaleListInfo(String sale_seq);
	
	// 컬럼: SaleTO 참고
	// 공간DB 이용 - 기준점으로부터 1km이내 매물 가져오기
	//@Select("select *, "
	//		+ "ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
	//		+ "from sale "
	//		+ "where ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) < (#{distance} * 1000)")
	//List<SaleTO> getSalesNearStation(double lon, double lat, String distance);
	@Select("select sale_seq, "
			+ "ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
			+ "from sale "
			+ "where ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) < (#{distance} * 1000)")
	List<String> getSalesNearStation(double lon, double lat, String distance);
	
	
	// 공간DB 이용 - 기준점으로부터 제일 가까운 편의시설(음식점) 하나 가져오기
	@Select("select business_name, business_type, road_address, ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) distance "
			+ "from food "
			+ "group by ST_Distance_Sphere(Point(lon, lat), Point(#{lon}, #{lat})) "
			+ "having distance is not null "
			+ "and business_type = #{type} "
			+ "limit 1")
	FoodTO getFoodNearPoint(double lon, double lat, String type);
	
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
	
	
	// 상세 검색용 sqls
	// house_type으로 sale_seq 가져오기
	@Select({
        "<script>",
        "SELECT sale_seq FROM sale WHERE house_type IN",
        "<foreach item='houseType' collection='houseTypes' open='(' separator=',' close=')'>",
        "#{houseType}",
        "</foreach>",
        "</script>"
    })
    List<String> getSaleSeqByHouseTypes(@Param("houseTypes") List<String> houseTypes);
	
	/*
	 * @Select({ "<script>", "SELECT sale_seq FROM sale WHERE",
	 * "<foreach item='saleType' collection='saleTypeList' separator=' OR '>",
	 * "sale_type = #{saleType} AND ", "<choose>",
	 * "<when test=\"saleType == 'p'\">",
	 * "price BETWEEN #{priceMin} AND #{priceMax}", "</when>",
	 * "<when test=\"saleType == 'l'\">",
	 * "deposit BETWEEN #{lDepositMin} AND #{lDepositMax}", "</when>",
	 * "<when test=\"saleType == 'm'\">",
	 * "deposit BETWEEN #{mDepositMin} AND #{mDepositMax} AND monthly_fee BETWEEN #{monthlyFeeMin} AND #{monthlyFeeMax}"
	 * , "</when>", "</choose>", "</foreach>", "</script>", }) List<String>
	 * getSaleSeqBySaleTypes(
	 * 
	 * @Param("saleTypeList") List<String> saleTypeList,
	 * 
	 * @Param("priceMin") String priceMin,
	 * 
	 * @Param("priceMax") String priceMax,
	 * 
	 * @Param("lDepositMin") String lDepositMin,
	 * 
	 * @Param("lDepositMax") String lDepositMax,
	 * 
	 * @Param("mDepositMin") String mDepositMin,
	 * 
	 * @Param("mDepositMax") String mDepositMax,
	 * 
	 * @Param("monthlyFeeMin") String monthlyFeeMin,
	 * 
	 * @Param("monthlyFeeMax") String monthlyFeeMax);
	 */
	
	/*
	 * @Select("<script>" + "SELECT sale_seq " + "FROM sale " + "WHERE " +
	 * "<if test='saleTypeList != null'>" + "   <choose>" +
	 * "       <when test='saleTypeList.contains(\"p\")'>" +
	 * "           sale_type = 'p' AND price BETWEEN #{priceMin} AND #{priceMax} " +
	 * "       </when>" + "       <when test='saleTypeList.contains(\"l\")'>" +
	 * "           sale_type = 'l' AND deposit BETWEEN #{lDepositMin} AND #{lDepositMax} "
	 * + "       </when>" + "       <when test='saleTypeList.contains(\"m\")'>" +
	 * "           sale_type = 'm' AND deposit BETWEEN #{mDepositMin} AND #{mDepositMax} "
	 * + "           AND monthly_fee BETWEEN #{monthlyFeeMin} AND #{monthlyFeeMax} "
	 * + "       </when>" + "       <otherwise>" + "           1=0 " + // No
	 * saleType matched, return no results "       </otherwise>" + "   </choose>" +
	 * "</if>" + "</script>") List<String> getSaleSeqBySaleTypes(
	 * 
	 * @Param("saleTypeList") List<String> saleTypeList,
	 * 
	 * @Param("priceMin") String priceMin,
	 * 
	 * @Param("priceMax") String priceMax,
	 * 
	 * @Param("lDepositMin") String lDepositMin,
	 * 
	 * @Param("lDepositMax") String lDepositMax,
	 * 
	 * @Param("mDepositMin") String mDepositMin,
	 * 
	 * @Param("mDepositMax") String mDepositMax,
	 * 
	 * @Param("monthlyFeeMin") String monthlyFeeMin,
	 * 
	 * @Param("monthlyFeeMax") String monthlyFeeMax);
	 */
	
	// 'p' 매물 타입 검색
    @Select("<script>" +
            "SELECT sale_seq FROM sale WHERE sale_type = 'p'" +
            "<if test='priceMax != null and priceMax == \"150000\"'>" +
            "   AND price &gt;= #{priceMin}" +
            "</if>" +
            "<if test='priceMax == null or priceMax != \"150000\"'>" +
            "   AND price BETWEEN #{priceMin} AND #{priceMax}" +
            "</if>" +
            "</script>")
    List<String> getSaleSeqBySaleTypeP(@Param("priceMin") String priceMin,
                                       @Param("priceMax") String priceMax);

    // 'l' 매물 타입 검색
    @Select("<script>" +
            "SELECT sale_seq FROM sale WHERE sale_type = 'l'" +
            "<if test='lDepositMax != null and lDepositMax == \"100000\"'>" +
            "   AND deposit &gt;= #{lDepositMin}" +
            "</if>" +
            "<if test='lDepositMax == null or lDepositMax != \"100000\"'>" +
            "   AND deposit BETWEEN #{lDepositMin} AND #{lDepositMax}" +
            "</if>" +
            "</script>")
    List<String> getSaleSeqBySaleTypeL(@Param("lDepositMin") String lDepositMin,
                                       @Param("lDepositMax") String lDepositMax);

    // 'm' 매물 타입 검색
    @Select("<script>" +
            "SELECT sale_seq FROM sale WHERE sale_type = 'm'" +
            "<if test='mDepositMax != null and mDepositMax == \"50000\"'>" +
            "   AND deposit &gt;= #{mDepositMin}" +
            "</if>" +
            "<if test='mDepositMax == null or mDepositMax != \"50000\"'>" +
            "   AND deposit BETWEEN #{mDepositMin} AND #{mDepositMax}" +
            "</if>" +
            "<if test='monthlyFeeMax != null and monthlyFeeMax == \"200\"'>" +
            "   AND monthly_fee &gt;= #{monthlyFeeMin}" +
            "</if>" +
            "<if test='monthlyFeeMax == null or monthlyFeeMax != \"200\"'>" +
            "   AND monthly_fee BETWEEN #{monthlyFeeMin} AND #{monthlyFeeMax}" +
            "</if>" +
            "</script>")
    List<String> getSaleSeqBySaleTypeM(@Param("mDepositMin") String mDepositMin,
                                       @Param("mDepositMax") String mDepositMax,
                                       @Param("monthlyFeeMin") String monthlyFeeMin,
                                       @Param("monthlyFeeMax") String monthlyFeeMax);

}
