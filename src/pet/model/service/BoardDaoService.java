package pet.model.service;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface BoardDaoService {
	public void insertArticle(NoticeInfoDTO dto) throws Exception;
	public int getMaxNum();
	public void fileUpdate(NoticeInfoDTO dto);
//	public Connection getConnection() throws Exception;
	public int getArticleCount() throws Exception;
	public List getArticles(int startRow, int endRow) throws Exception; //페이징
	public void NoticeInfoCnt(int num) throws Exception;
	public NoticeInfoDTO getArticle(int num) throws Exception;	
//	public NoticeInfoDTO updateGetArticle(int num) throws Exception;
	public void update(NoticeInfoDTO dto) throws Exception;
	public void deleteArticle(int num) throws Exception;	
	public void writReply(BoardReplyDTO dto) throws Exception;
	public List reply(int num) throws Exception; // 댓글
	public void updateReply(BoardReplyDTO dto) throws Exception; // 댓글 
	public void deleteReply(int rno) throws Exception; // 댓글 삭제
	public List searchList(String col , String search,int startRow, int endRow);//검색
	public int getsearchCount(String col , String search) throws Exception; //검색 페이징
}



