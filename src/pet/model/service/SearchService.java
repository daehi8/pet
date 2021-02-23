package pet.model.service;

import java.util.List;

public interface SearchService {
	public List getHospitalList (String keyword , int start , int end)throws Exception;
	public int getHospitalListCount(String keyword)throws Exception;
	public List getSearch(String keyword);
	public List getTestReview(String keyword);
	public List getHospital(String keyword);
	public List getDocInfo(String keyword);
	public List getCity(String keyword);

}
