package pet.model.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("noticefreeDAO")  // 서비스를 선언하고 서비스 이름을 지정 
public class FreeDaolmpl implements FreeDaoService{

	@Autowired
	private SqlSessionTemplate fdao = null;
	
	@Override
	public void insertArticle(NoticefreedomDTO dto) throws Exception {
		fdao.insert("free.insertBoard" , dto);
	}
	// 게시 페이징
	@Override
	public List getArticles(int startRow, int endRow) throws Exception {	
		HashMap hashmap = new HashMap();
		hashmap.put("startRow", startRow);
		hashmap.put("endRow", endRow);
		return fdao.selectList("free.noticeAll", hashmap);
	}
	
	public int getMaxNum() {
		return fdao.selectOne("free.maxNum");
	}
	public void fileUpdate(NoticefreedomDTO dto) {
		fdao.update("free.fileUpdate" , dto);
	}

	@Override
	public NoticefreedomDTO getArticle(int num) throws Exception {	
		return fdao.selectOne("free.noticeContent" , num);
	}

	@Override // 조회수
	public void NoticefreeCnt(int num) throws Exception {
		fdao.selectOne("free.NoticefreeCnt",num); 
		
	}

	@Override
	public void update(NoticefreedomDTO dto) throws Exception {
		fdao.update("free.Noticeupdate",dto);
	}

	@Override
	public void deleteArticle(int num) throws Exception {
		
		fdao.delete("free.noticeinfoDel" , num);
	}
	

	@Override
	public void writReply(FreeReplyDTO dto) throws Exception {
		fdao.insert("free.writeReply", dto);
		
	}

	@Override
	public List reply(int num) throws Exception {
		
		return fdao.selectList("free.getReplyList",num);
	}

	@Override
	public void updateReply(FreeReplyDTO dto) throws Exception {
		fdao.update("free.updateReply",dto);
		
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		fdao.delete("free.deleteReply",rno);
		
	}

	@Override
	public int getArticleCount() throws Exception {
		
		return fdao.selectOne("free.getArticleCount");
	}

	@Override
	public List searchList(String col, String search,int startRow, int endRow) {
		
		HashMap map = new HashMap();
		map.put("col", col);
		map.put("search", search);	
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return fdao.selectList("free.search",map);
	}
	@Override
	public int getsearchCount(String col, String search) throws Exception {	
		HashMap map = new HashMap();
		map.put("col" , col);
		map.put("search" , search);
		return fdao.selectOne("free.getArticleCount",map);
	}
	
}













