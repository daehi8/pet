package pet.model.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("noticeInfoDAO")  // 서비스를 선언하고 서비스 이름을 지정 
public class BoardDaolmpl implements BoardDaoService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertArticle(NoticeInfoDTO dto) throws Exception {
		dao.insert("board.insertBoard" , dto);
	}
	// 게시 페이징
	@Override
	public List getArticles(int startRow, int endRow) throws Exception {	
		HashMap hashmap = new HashMap();
		hashmap.put("startRow", startRow);
		hashmap.put("endRow", endRow);
		return dao.selectList("board.noticeAll", hashmap);
	}
	
	public int getMaxNum() {
		return dao.selectOne("board.maxNum");
	}
	public void fileUpdate(NoticeInfoDTO dto) {
		dao.update("board.fileUpdate" , dto);
	}

	@Override
	public NoticeInfoDTO getArticle(int num) throws Exception {	
		return dao.selectOne("board.noticeContent" , num);
	}

	@Override // 조회수
	public void NoticeInfoCnt(int num) throws Exception {
		dao.selectOne("board.NoticeInfoCnt",num);
		
	}

	@Override
	public void update(NoticeInfoDTO dto) throws Exception {
		dao.update("board.Noticeupdate",dto);
	}

	@Override
	public void deleteArticle(int num) throws Exception {
		
		dao.delete("board.noticeinfoDel" , num);
	}
	

	@Override
	public void writReply(BoardReplyDTO dto) throws Exception {
		dao.insert("board.writeReply", dto);
		
	}

	@Override
	public List reply(int num) throws Exception {
		
		return dao.selectList("board.getReplyList",num);
	}

	@Override
	public void updateReply(BoardReplyDTO dto) throws Exception {
		dao.update("board.updateReply",dto);
		
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		dao.delete("board.deleteReply",rno);
		
	}

	@Override
	public int getArticleCount() throws Exception {
		
		return dao.selectOne("board.getArticleCount");
	}

	@Override
	public List searchList(String col, String search,int startRow, int endRow) {
		
		HashMap map = new HashMap();
		map.put("col", col);
		map.put("search", search);	
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return dao.selectList("board.search",map);
	}
	@Override
	public int getsearchCount(String col, String search) throws Exception {	
		HashMap map = new HashMap();
		map.put("col" , col);
		map.put("search" , search);
		return dao.selectOne("board.getsearchCount",map);
	}
	
}













