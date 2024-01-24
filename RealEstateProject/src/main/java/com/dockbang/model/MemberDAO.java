package com.dockbang.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dockbang.mapper.SqlMapperInter;

@Repository
public class MemberDAO {
	@Autowired
	private SqlMapperInter mapper;

	
	// 기능 설명
	public void memberRegister() {
		// 기능

//		return null;
	}
	
	
	// 기능 설명
	public void memberRegisterOk() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberLogin() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberModify() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberModifyOk() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberDelete() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberDeleteOk() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void surveyHistory() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberInfo() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void bookmarkList() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void bookmarkDelete() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void bookmarkDeleteOk() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void searchHistory() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void searchHistoryDelete() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void searchHistoryDeleteOk() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberBoardList() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void memberCommentList() {
		// 기능
		
//		return null;
	}
	
	// 유저 정보 반환
	public MemberTO getMemberTO(String userEmail) {
		MemberTO memberTO = mapper.selectUserInfo(userEmail);
		
		return memberTO;
	}
	
	// 특정 유저 북마크 리스트 반환
	public List<BookmarkTO> getBookmarkTOList(String userEmail){
		List<BookmarkTO> bookmarkTOList = mapper.getUserBookmark(userEmail);
		
		return bookmarkTOList;
	}
	
	
	// 유저 북마크 추가
	public int addUserBookmark(String userEmail, String saleSeq, String memo) {
		return mapper.addUserBookmark(userEmail, saleSeq, memo);
	}
	
	
}
