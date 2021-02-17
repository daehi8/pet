package pet.model.service;

import java.sql.Connection;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.bean.CheckBean;
import pet.model.dto.CheckDTO;

@Service("Cdao")
public class CheckServiceImpl implements CheckService{

	@Autowired
	private SqlSessionTemplate Cdao = null;

	@Override
	public List<CheckDTO> list() throws Exception {
		return Cdao.selectList("check.check");
	}

	@Override
	public void write(CheckDTO dto) throws Exception {
		Cdao.insert("check.add", dto);
	}

	@Override
	public CheckDTO read(int no) throws Exception {
		return Cdao.selectOne("check.read", no);
	}

	@Override
	public void update(CheckDTO dto) throws Exception {
		Cdao.update("check.update", dto);
		
	}

	@Override
	public void delete(int no) throws Exception {
		Cdao.delete("check.delete", no);
	}

	@Override
	public int count() throws Exception {
		return Cdao.selectOne("check.count");
	}

	
}

	