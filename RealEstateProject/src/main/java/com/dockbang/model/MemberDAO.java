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
	
	// 일반회원 탈퇴
	public int memberDeleteOk(String userEmail, String inputPassword) {
		// 회원 삭제
		int flag = mapper.deleteUser(userEmail, inputPassword);
		return flag;
	}

	// 유저 북마크 제거
	public int deleteUserBookmarkAll(String userEmail){
		int flag = mapper.deleteUserBookmarkAll(userEmail);
		return flag;
	}
	
	// 유저 히스토리 제거
	public int deleteUserHistoryAll(String userseq){
		int flag = mapper.deleteUserHistoryAll(userseq);
		return flag;
	}
	
	// 소셜회원 탈퇴
	public int socialMemberDeleteOk(String userEmail) {
		// 회원 삭제
		int flag = mapper.deleteSocialUser(userEmail);

		return flag;
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
		MemberTO memberTO = mapper.selectUserFromEmail(userEmail);
		
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
	
	// 특정 유저 히스토리 반환
	public List<HistoryTO> getHistoryTOList(MemberTO memberTO){
		return mapper.getUserHistory(memberTO.getUserseq());
	}
	
	
}
