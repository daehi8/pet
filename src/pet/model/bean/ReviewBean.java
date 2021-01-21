package pet.model.bean;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pet.model.dto.ReviewDTO;
import pet.model.dto.UploadReviewDTO;
import pet.model.service.ReviewService;
import pet.model.service.UploadReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewBean {
	
	@Autowired
	private ReviewService reviewService; 
	
	@Autowired
	private UploadReviewService uploadReviewService;
	
	@RequestMapping("insertreview.do")
	public String insertReview() throws Exception {
		return "review/insertReview";
	}
	
	@RequestMapping("insertreviewpro.do")
	public String insertReviewPro(ReviewDTO reviewDTO,
			UploadReviewDTO uploadReviewDTO,
			MultipartHttpServletRequest request) throws Exception {
		reviewService.insertReview(reviewDTO);
		int review_no = reviewService.selectNewReview();
		
		Iterator<String> fileTypeNames = request.getFileNames();
		while(fileTypeNames.hasNext()) {
			String fileTypeName = fileTypeNames.next();
			List<MultipartFile> mf = request.getFiles(fileTypeName);
			System.out.println(mf.size());
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
		return "review/insertReviewPro";
	}
}
