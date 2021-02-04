package pet.model.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import pet.model.dto.PageDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;
import pet.model.dto.UploadReviewDTO;
import pet.model.service.CommentReviewService;
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
	
	@RequestMapping("insertreview.do")
	public String insertReview() throws Exception {
		return "review/insertReview";
	}
	
	@RequestMapping("insertreviewpro.do")
	public String insertReviewPro(ReviewDTO reviewDTO,
			UploadReviewDTO uploadReviewDTO,
			CommentReviewDTO commentReviewDTO,
			RatingReviewDTO ratingReviewDTO,
			PriceReviewDTO priceReviewDTO,
			MultipartHttpServletRequest request) throws Exception {
		
		// 리뷰 입력
		reviewService.insertReview(reviewDTO);
		int review_no = reviewService.selectNewReview();
		
		// 다중 파일업로드
		// 파일 이름 차례대로 검색 후 이름에 맞는 파일 모두 업로드
		Iterator<String> fileTypeNames = request.getFileNames();
		while(fileTypeNames.hasNext()) {
			String fileTypeName = fileTypeNames.next();
			List<MultipartFile> mf = request.getFiles(fileTypeName);
			
			for(int i = 0; i < mf.size(); i++) {
				if(mf.get(i).isEmpty()) {
					break;
				}
				
				String fileName = mf.get(i).getOriginalFilename();				
				uploadReviewDTO.setOrg_name(fileName);
				uploadReviewDTO.setReview_no(review_no);
				int no = uploadReviewService.insertFile(uploadReviewDTO);
				String ext = fileName.substring(fileName.lastIndexOf("."));			
				String saveName = "file_"+no+ext;
				uploadReviewDTO.setNo(no);
				uploadReviewDTO.setSave_name(saveName);
				uploadReviewDTO.setFile_type(fileTypeName);
				uploadReviewService.fileUpdate(uploadReviewDTO);
				
				String savePath = request.getRealPath("save");
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
				Integer.parseInt(ratingReviewDTO.getAfter()), 
				Integer.parseInt(ratingReviewDTO.getClean()), 
				Integer.parseInt(ratingReviewDTO.getDetail()),
				Integer.parseInt(ratingReviewDTO.getKind()),
				Integer.parseInt(ratingReviewDTO.getPrice()),
				Integer.parseInt(ratingReviewDTO.getWaiting())
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
			Model model,
			String searchType) throws Exception {
		
		// 페이징 처리
		if(pageNum == 0) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(Integer.toString(pageNum));
		}		
		int count = reviewService.getListReviewCount(reviewDTO.getHospital_name());		
		pageDTO.setCount(count);
		pageDTO.paging(pageDTO.getPageNum(), count);
		
		int start = pageDTO.getStartRow();
		int end = pageDTO.getEndRow();
		List reviewList = reviewService.getListReview(start, end, reviewDTO.getHospital_name(), searchType);		
		
		// 필요한 리뷰정보 리스트 생성
		List ratingList = new ArrayList();
		List commentList = new ArrayList();
		List priceByNoList = new ArrayList();
		List priceList = new ArrayList();
		Map priceMap = new HashMap();
		
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
			
			ratingList.add(ratingReviewDTO);
			commentList.add(commentReviewDTO);
			priceMap.put(i,priceByNoList);
			
			// 평점 합계 구하기
			int clean = Integer.parseInt(ratingReviewDTO.getClean());
			int price = Integer.parseInt(ratingReviewDTO.getPrice());
			int kind = Integer.parseInt(ratingReviewDTO.getKind());
			int waiting = Integer.parseInt(ratingReviewDTO.getWaiting());
			int detail = Integer.parseInt(ratingReviewDTO.getDetail());
			int after = Integer.parseInt(ratingReviewDTO.getAfter());
			int mean = (int) (ratingReviewDTO.getMean());
			
			cleanRating += clean;
			priceRating += price;
			kindRating += kind;
			waitingRating += waiting;
			detailRating += detail;
			afterRating += after;
			meanRating += mean;
		}
		
		// 평점  평균 구하기
		int meanCleanRating = cleanRating / count;
		int meanPriceRating = priceRating / count;
		int meanKindRating = kindRating / count;
		int meanWaitingRating = waitingRating / count;
		int meanDetailRating = detailRating / count;
		int meanAfterRating = afterRating / count;
		int meanRatingResult = meanRating / count;
		
		// 리뷰 재방문 추천 수
		int recomCount = reviewService.getRecomCount(reviewDTO.getHospital_name());
		int notRecomCount = reviewService.getNotRecomCount(reviewDTO.getHospital_name());
		
		// 병원 정보
		docMyHospitalDTO = reviewService.selectByHospitalName(reviewDTO.getHospital_name());
		
		// 의사 사진 정보 
		docPictureDTO = reviewService.getDocPicture(reviewDTO.getHospital_name());
		
		// 의사 정보
		docInfoDTO = reviewService.getDocInfo(reviewDTO.getHospital_name());
		
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
		model.addAttribute("docPictureDTO", docPictureDTO);
		model.addAttribute("docInfoDTO", docInfoDTO);
		
		return "review/contentsReview";
	}
	
	// 리뷰리스트
	@RequestMapping("adminreviewlist.do")
	public String reviewList(@RequestParam(defaultValue ="1") int pageNum,
			PageDTO pageDTO,
			ReviewDTO reviewDTO,
			Model model,
			@RequestParam(defaultValue ="N") String searchType
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
		
		return "review/adminReviewList";
	}
	
	// 리뷰 승인
	@RequestMapping("okauthcheck.do")
	public String okAuthcheck(int review_no)throws Exception{
		reviewService.okAuthCheck(review_no);

		return "review/adminReviewAuthCheck";
	}
	
	// 리뷰 미승인
	@RequestMapping("noauthcheck.do")
	public String noAuthcheck(int review_no)throws Exception{
		reviewService.noAuthCheck(review_no);
	
		return "review/adminReviewAuthCheck";
	}
	
	//어드민 리뷰 상세페이지
	@RequestMapping("admincontentsreview.do")
	public String adminContentsReview(int review_no,
			ReviewDTO reviewDTO,
			RatingReviewDTO ratingReviewDTO,
			CommentReviewDTO commentReviewDTO,
			UploadReviewDTO uploadReviewDTO,
			Model model)throws Exception{
		
		reviewDTO = reviewService.selectByReviewNo(review_no);
		commentReviewDTO = commentReviewService.selectByReviewNo(review_no);
		ratingReviewDTO = ratingReviewService.selectByReviewNo(review_no);
		List priceByNoList = priceReviewService.selectByReviewNo(review_no);
		uploadReviewDTO = uploadReviewService.getAuthByReviewNo(review_no);
		List cureFileReviewList = uploadReviewService.getHospitalByReviewNo(review_no);
		List hospitalFileReviewList = uploadReviewService.getCureByReviewNo(review_no);
		
		model.addAttribute("reviewDTO", reviewDTO);
		model.addAttribute("commentReviewDTO", commentReviewDTO);
		model.addAttribute("ratingReviewDTO", ratingReviewDTO);
		model.addAttribute("priceByNoList", priceByNoList);
		model.addAttribute("uploadReviewDTO", uploadReviewDTO);
		model.addAttribute("cureFileReviewList", cureFileReviewList);
		model.addAttribute("hospitalFileReviewList", hospitalFileReviewList);
		
		return "review/adminContentsReview";
	}
}
