package pet.model.service;

import java.util.List;
import pet.model.bean.CheckBean;
import pet.model.dto.CheckDTO;

public interface CheckService {
	// 목록
	public List<CheckDTO> list() throws Exception;
	// 작성
	public void write(CheckDTO dto) throws Exception;
	// 조회
	public CheckDTO read(int no)throws Exception;
	// 수정
	public void update(CheckDTO dto)throws Exception;
	// 삭제
	public void delete(int no) throws Exception;
	
	// 게시물 총개수
	public int count() throws Exception;
}