package pet.model.bean;

import java.io.File;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import pet.model.dto.CommentReviewDTO;
import pet.model.dto.DocInfoDTO;
import pet.model.dto.DocMyHospitalDTO;
import pet.model.dto.DocPictureDTO;
import pet.model.dto.HospitalDTO;
import pet.model.dto.LikeReviewDTO;
import pet.model.dto.MemberDTO;
import pet.model.dto.PageDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;
import pet.model.dto.UploadReviewDTO;
import pet.model.service.CommentReviewService;
import pet.model.service.LikeReviewService;
import pet.model.service.PriceReviewService;
import pet.model.service.RatingReviewService;
import pet.model.service.ReviewService;
import pet.model.service.UploadReviewService;

@RestController
@RequestMapping("/review/")
public class ReviewBean {
	
	@Autowired
	private ReviewService reviewService; 
	
	@Autowired
	private UploadReviewService uploadReviewService;
	
	@Autowired
	private CommentReviewService commentReviewService;
	
	@Autowired
	private RatingReviewService ratingReviewService;
	
	@Autowired
	private PriceReviewService priceReviewService;
	
	@Autowired
	private LikeReviewService likeReviewService;
	
	@RequestMapping("insertreview.do")
	public String insertReview(Model model) throws Exception {
		List hospitalList = reviewService.selectHospitalAll();
		
		// 리뷰 진료과목 정보
		List subjectList = priceReviewService.selectSubjectList();
		
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("hospitalList", hospitalList);
		
		return "review/insertReview";
	}
	
	@RequestMapping("insertreviewpro.do")
	public String insertReviewPro(ReviewDTO reviewDTO,
			UploadReviewDTO uploadReviewDTO,
			CommentReviewDTO commentReviewDTO,
			RatingReviewDTO ratingReviewDTO,
			PriceReviewDTO priceReviewDTO,
			DocInfoDTO docInfoDTO,
			MultipartHttpServletRequest request) throws Exception {
		
		// 리뷰 입력
		// 병원정보 입력
		String doc_mail = "";
		if(docInfoDTO.getDoc_name() != null) {
			if(reviewService.selectDocMailByName(docInfoDTO) != null) {
				doc_mail = reviewService.selectDocMailByName(docInfoDTO);
			}
		}
		
		reviewDTO.setHospital_no(docInfoDTO.getHospital_no());
		reviewDTO.setDoc_mail(doc_mail);
		reviewService.insertReview(reviewDTO);
		int review_no = reviewService.selectNewReview();
		
		// 다중 파일업로드
		// 파일 이름을 검색후 이름 수만큼 반복
		Iterator<String> fileTypeNames = request.getFileNames();
		while(fileTypeNames.hasNext()) {
			String fileTypeName = fileTypeNames.next();
			List<MultipartFile> mf = request.getFiles(fileTypeName);
			
			// 파일 이름에 해당하는 파일의 수만큼 반복
			for(int i = 0; i < mf.size(); i++) {
				if(mf.get(i).isEmpty()) {
					break;
				}
				
				// 파일 원본 이름
				String fileName = mf.get(i).getOriginalFilename();				
				uploadReviewDTO.setOrg_name(fileName);
				uploadReviewDTO.setReview_no(review_no);
				
				// DB에 저장 후 파일 고유 번호 불러오기  
				int no = uploadReviewService.insertFile(uploadReviewDTO);
				
				// 파일 확장자 분리
				String ext = fileName.substring(fileName.lastIndexOf("."));			
				
				// 서버에 저장될 파일 이름 생성 후 DB에 저장
				String saveName = "file_"+no+ext;
				uploadReviewDTO.setNo(no);
				uploadReviewDTO.setSave_name(saveName);
				uploadReviewDTO.setFile_type(fileTypeName);
				uploadReviewService.fileUpdate(uploadReviewDTO);
				
				// 파일 저장경로 생성
				String savePath = request.getRealPath("save");
				
				// 파일 생성 후 업로드
				File saveFile = new File(savePath+"\\"+saveName); 	
				try {
					mf.get(i).transferTo(saveFile);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		// 리뷰 코멘트 입력
		commentReviewDTO.setReview_no(review_no);
		commentReviewService.insertCommentReview(commentReviewDTO);
		
		// 리뷰 평점 평균 구하기
		int [] meanRating = {
				ratingReviewDTO.getAfter(), 
				ratingReviewDTO.getClean(), 
				ratingReviewDTO.getDetail(),
				ratingReviewDTO.getKind(),
				ratingReviewDTO.getPrice(),
				ratingReviewDTO.getWaiting()
		};
		
		// 총점 값
		int sumRating = 0 ;		
		// 평균 값 
		float avgRating = 0f;
		
		for (int i = 0; i < meanRating.length; i++) {
			sumRating += meanRating[i];
		}		
		avgRating = sumRating / (float) meanRating.length ;
		
		// 리뷰 평점 입력
		ratingReviewDTO.setReview_no(review_no);
		ratingReviewDTO.setMean(avgRating);
		ratingReviewService.insertRatingReview(ratingReviewDTO);
		
		// 리뷰 가격정보 입력
		String [] rePrice = priceReviewDTO.getPrice_info().split(",");
		String [] reSubject = priceReviewDTO.getSubject_info().split(",");
		
		for(int i = 0; i < rePrice.length; i++) {
			priceReviewDTO.setReview_no(review_no);
			priceReviewDTO.setPrice_info(rePrice[i]);
			priceReviewDTO.setSubject_info(reSubject[i]);			
			priceReviewService.insertPriceReview(priceReviewDTO);
		}
		
		
		return "review/insertReviewPro";
	}
	
	// 상세페이지
	@RequestMapping("contentsreview.do")
	public String contentsReview(@ModelAttribute PageDTO pageDTO,
			@RequestParam(defaultValue ="1") int pageNum,
			ReviewDTO reviewDTO,
			RatingReviewDTO ratingReviewDTO,
			CommentReviewDTO commentReviewDTO,
			DocMyHospitalDTO docMyHospitalDTO,
			DocPictureDTO docPictureDTO,
			DocInfoDTO docInfoDTO,
			HospitalDTO hospitalDTO,
			Model model,
			int hospital_no,
			@RequestParam(defaultValue ="regOrder") String searchType) throws Exception {
		
		// 페이징 처리
		if(pageNum == 0) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(Integer.toString(pageNum));
		}		
		int count = reviewService.getListReviewCount(reviewDTO.getHospital_no());
		pageDTO.setCount(count);
		pageDTO.paging(pageDTO.getPageNum(), count);
		
		int start = pageDTO.getStartRow();
		int end = pageDTO.getEndRow();
		List reviewList = reviewService.getListReview(start, end, reviewDTO.getHospital_no(), searchType);		
		
		// 필요한 리뷰정보 리스트 생성
		List ratingList = new ArrayList();
		List commentList = new ArrayList();
		List priceByNoList = new ArrayList();
		List priceList = new ArrayList();
		Map priceMap = new HashMap();
		List likeList = new ArrayList();
		List memNickList = new ArrayList();
		
		// 필요한 평점 생성
		int cleanRating = 0;
		int kindRating = 0;
		int waitingRating = 0;
		int detailRating = 0;
		int priceRating = 0;
		int afterRating = 0;
		int meanRating = 0;
		
		// 리뷰DTO 연결
		for(int i=0; i < reviewList.size(); i++) {
			ratingReviewDTO = null;
			commentReviewDTO = null;
			priceByNoList = null;
			
			int review_no = ((ReviewDTO) reviewList.get(i)).getNo();
			
			ratingReviewDTO = ratingReviewService.selectByReviewNo(review_no);
			commentReviewDTO = commentReviewService.selectByReviewNo(review_no);
			priceByNoList = priceReviewService.selectByReviewNo(review_no);
			String memNick = reviewService.selectNickByEmail(((ReviewDTO) reviewList.get(i)).getMember_email());
			
			memNickList.add(memNick);
			ratingList.add(ratingReviewDTO);
			commentList.add(commentReviewDTO);
			priceMap.put(i,priceByNoList);
			
			// 평점 합계 구하기
			int clean = ratingReviewDTO.getClean();
			int price = ratingReviewDTO.getPrice();
			int kind = ratingReviewDTO.getKind();
			int waiting = ratingReviewDTO.getWaiting();
			int detail = ratingReviewDTO.getDetail();
			int after = ratingReviewDTO.getAfter();
			int mean = (int) (ratingReviewDTO.getMean());
			
			cleanRating += clean;
			priceRating += price;
			kindRating += kind;
			waitingRating += waiting;
			detailRating += detail;
			afterRating += after;
			meanRating += mean;
			
			// 리뷰 추천 수 리스트 구하기
			int likeCount = likeReviewService.getLikeReviewCount(review_no);
			likeList.add(likeCount);
		}
		
		// 평점  평균 구하기
		int meanCleanRating = 0;
		int meanPriceRating = 0;
		int meanKindRating = 0;
		int meanWaitingRating = 0;
		int meanDetailRating = 0;
		int meanAfterRating = 0;
		int meanRatingResult = 0;
		
		if(count != 0) {
			meanCleanRating = cleanRating / count;
			meanPriceRating = priceRating / count;
			meanKindRating = kindRating / count;
			meanWaitingRating = waitingRating / count;
			meanDetailRating = detailRating / count;
			meanAfterRating = afterRating / count;
			meanRatingResult = meanRating / count;
		}
		// 리뷰 재방문 추천 수
		int recomCount = reviewService.getRecomCount(reviewDTO.getHospital_no());
		int notRecomCount = reviewService.getNotRecomCount(reviewDTO.getHospital_no());
		
		// 병원 정보
		docMyHospitalDTO = reviewService.selectMyhospitalByHospitalNo(reviewDTO.getHospital_no());
		
		// 병원 추가 정보
		hospitalDTO = reviewService.selectHospitalByHospitalNo(reviewDTO.getHospital_no());
		
		// 의사 정보
		docInfoDTO = reviewService.getDocInfo(reviewDTO.getHospital_no());
		model.addAttribute("count", count);
		model.addAttribute("meanCleanRating", meanCleanRating);
		model.addAttribute("meanPriceRating", meanPriceRating);
		model.addAttribute("meanKindRating", meanKindRating);
		model.addAttribute("meanWaitingRating", meanWaitingRating);
		model.addAttribute("meanDetailRating", meanDetailRating);
		model.addAttribute("meanAfterRating", meanAfterRating);
		model.addAttribute("meanRatingResult", meanRatingResult);
		model.addAttribute("notRecomCount", notRecomCount);
		model.addAttribute("recomCount", recomCount);
		model.addAttribute("page", pageDTO);
		model.addAttribute("ratingList", ratingList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("priceMap", priceMap);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("docMyHospitalDTO", docMyHospitalDTO);
		model.addAttribute("docInfoDTO", docInfoDTO);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("searchType", searchType);
		model.addAttribute("likeList",likeList);
		model.addAttribute("hospitalDTO", hospitalDTO);
		model.addAttribute("hospital_no", hospital_no);
		model.addAttribute("memNickList", memNickList);
		
		return "review/contentsReview";
	}
	
	// 관리자 리뷰리스트
	@RequestMapping("adminreviewlist.do")
	public String reviewList(@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="no") String searchType,
			PageDTO pageDTO,
			ReviewDTO reviewDTO,
			Model model
			) throws Exception{
		
		// 페이징 처리
		if(pageNum == 0) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(Integer.toString(pageNum));
		}		
		int count = reviewService.getListAuthCheckReviewCount(searchType);
		pageDTO.setCount(count);
		pageDTO.paging(pageDTO.getPageNum(), count);
		
		int start = pageDTO.getStartRow();
		int end = pageDTO.getEndRow();
		List authCheckList = reviewService.getListAuthCheckReview(start, end, searchType);

		model.addAttribute("searchType", searchType);
		model.addAttribute("authCheckList", authCheckList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/review/adminReviewList";
	}
	
	// 리뷰 승인
	@RequestMapping("okauthcheck.do")
	public String okAuthcheck(int review_no)throws Exception{
		reviewService.okAuthCheck(review_no);

		return "admin/review/adminReviewAuthCheck";
	}
	
	// 리뷰 미승인
	@RequestMapping("noauthcheck.do")
	public String noAuthcheck(int review_no)throws Exception{
		reviewService.noAuthCheck(review_no);
	
		return "admin/review/adminReviewAuthCheck";
	}
	
	//어드민 리뷰 상세페이지
	@RequestMapping("admincontentsreview.do")
	public String adminContentsReview(
			@RequestParam(defaultValue ="1") int pageNum,
			@RequestParam(defaultValue ="no") String searchType,
			int review_no,
			ReviewDTO reviewDTO,
			RatingReviewDTO ratingReviewDTO,
			CommentReviewDTO commentReviewDTO,
			UploadReviewDTO uploadReviewDTO,
			DocInfoDTO docInfoDTO,
			Model model)throws Exception{
		
		reviewDTO = reviewService.selectByReviewNo(review_no);
		commentReviewDTO = commentReviewService.selectByReviewNo(review_no);
		ratingReviewDTO = ratingReviewService.selectByReviewNo(review_no);
		uploadReviewDTO = uploadReviewService.getAuthByReviewNo(review_no);
		docInfoDTO = reviewService.getDocInfo(reviewDTO.getHospital_no());
		
		List cureFileReviewList = uploadReviewService.getHospitalByReviewNo(review_no);
		List hospitalFileReviewList = uploadReviewService.getCureByReviewNo(review_no);
		List priceByNoList = priceReviewService.selectByReviewNo(review_no);
				
		String hospitalName = reviewService.selectHospitalName(reviewDTO.getHospital_no());
		
		model.addAttribute("reviewDTO", reviewDTO);
		model.addAttribute("commentReviewDTO", commentReviewDTO);
		model.addAttribute("ratingReviewDTO", ratingReviewDTO);
		model.addAttribute("priceByNoList", priceByNoList);
		model.addAttribute("uploadReviewDTO", uploadReviewDTO);
		model.addAttribute("cureFileReviewList", cureFileReviewList);
		model.addAttribute("hospitalFileReviewList", hospitalFileReviewList);
		model.addAttribute("hospitalName", hospitalName);
		model.addAttribute("docInfoDTO", docInfoDTO);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchType", searchType);
		
		return "admin/review/adminContentsReview";
	}
	
	//추천 기능
	@RequestMapping("likereview.do")
	public String likeReview(
			LikeReviewDTO likeReviewDTO,
			int hospital_no,
			Model model)throws Exception{
		// 같은 아이디로 중복추천 불가능하게 추천한 아이디가 있는지 체크
		int check = likeReviewService.likeCheck(likeReviewDTO);
		if(check < 1) {
			likeReviewService.insertLikeReview(likeReviewDTO);
		}
		
		model.addAttribute("hospital_no", hospital_no);
		model.addAttribute("check", check);
		
		return "review/likeReviewPro";
	}
}
