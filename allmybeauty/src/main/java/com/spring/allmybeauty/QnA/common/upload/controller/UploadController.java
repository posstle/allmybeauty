package com.spring.allmybeauty.QnA.common.upload.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.common.upload.service.QnAAttachFileService;

import lombok.Setter;
import net.coobird.thumbnailator.Thumbnailator;


//@Log4j
@RestController
public class UploadController {

	private String uploadFileRepoDir = "C:\\\\myupload\\QNA";

	@Setter(onMethod_ = @Autowired)
	private QnAAttachFileService qnaAttachFileService;
	
	private String getDatefmtPathName() {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		Date date =new Date();
		
		String strDatefmtPathName = simpleDateFormat.format(date);
		
		return strDatefmtPathName.replace("/", File.separator);
	}

	@RequestMapping(value ="/QnAfileUpload", produces = {"application/json; charset=UTF-8"})
	@ResponseBody
	public ResponseEntity<List<QnAAttachFileVO>> fileUpload(MultipartFile[] uploadfiles) {
		
//		log.info("controller-upload 시작");
		
		List<QnAAttachFileVO> listAttachInfo = new ArrayList<QnAAttachFileVO>();
		
		String strDatefmtPathName = getDatefmtPathName();
		
		File fileUploadPath = new File(uploadFileRepoDir, strDatefmtPathName);
		
		if (!fileUploadPath.exists()) {
			fileUploadPath.mkdirs();
		}

		for(MultipartFile multipartUploadFile : uploadfiles) {
//			log.info("C================================");
//			log.info("Upload File Name: "+ multipartUploadFile.getOriginalFilename());
//			log.info("Upload File Size: "+ multipartUploadFile.getSize());
//			
			QnAAttachFileVO attach = new QnAAttachFileVO();
			
			attach.setRepopath(uploadFileRepoDir.toString());
			attach.setUploadpath(strDatefmtPathName.toString());

			String strUploadFileName = multipartUploadFile.getOriginalFilename();
			strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\")+1);
//			log.info("수정된 파일이름(strUploadFileName): " + strUploadFileName);
	
			attach.setFilename(strUploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			attach.setUuid(uuid.toString());
			
			strUploadFileName = uuid.toString()+"_"+ strUploadFileName ;
//			log.info("수정처리된파일이름: "+strUploadFileName);
			
			File saveUploadFile = new File(fileUploadPath, strUploadFileName); //추가
//			log.info("저장시 사용되는 파일이름(saveUploadFile, 경로포함): " + saveUploadFile); //추가
			
			try {
				multipartUploadFile.transferTo(saveUploadFile);
				
				FileOutputStream outputStreamForThumbnail = new FileOutputStream(new File(fileUploadPath,"thumb_"+strUploadFileName));
				Thumbnailator.createThumbnail(multipartUploadFile.getInputStream(), outputStreamForThumbnail,20,20);
//				log.info("outputStreamForThumbnail: "+outputStreamForThumbnail);
				outputStreamForThumbnail.close();
				
			} catch (Exception e) {
//				log.error(e.getMessage());
			}
			
			listAttachInfo.add(attach);
		}
		return new ResponseEntity<List<QnAAttachFileVO>> (listAttachInfo, HttpStatus.OK);

	}
	
	@GetMapping("/QnAThumbnail")
	@ResponseBody
	public ResponseEntity<byte[]> sendThumbNailFile(String filename){
		 
		File file = new File(filename);
//		log.info("썸네일파일이름(경로포함) : "+ file);
		
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Context-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@PostMapping("/delQnAUploadFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String filename){	
		
//		log.info("deleteFileName: "+filename);

		File delFile = null;

		try {
			
			delFile = new File(URLDecoder.decode(filename,"UTF-8"));
//			log.info("decoded deleteing fileName: "+delFile);
			
			delFile.delete();
			
			String originalImgFileName = delFile.getAbsolutePath().replace("thumb_", "");
			
			delFile = new File(originalImgFileName);
			
			delFile.delete();
			
		} catch (UnsupportedEncodingException e){
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("SuccessDeletingFile", HttpStatus.OK);

	}
	
	
	
}
