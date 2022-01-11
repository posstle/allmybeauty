package com.spring.allmybeauty.common.fileupload.controller;

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

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class FileUploadAjaxController {
	private String uploadFileRepoDir = "C:\\myupload";
	
	//날짜 형식 경로
	private String getDatefmtPathName() {
		//날짜 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		//날짜 생성
		Date date = new Date();
		
		String strDatefmtPathName = simpleDateFormat.format(date);
		
		return strDatefmtPathName.replace("/", File.separator);
	}
	
	//섬네일 이미지 생성
	private boolean checkIsImageForUploadFile(File uploadFile) {
		try {
			String strContentType = Files.probeContentType(uploadFile.toPath());
			log.info("업로드 파일의 ContentType " + strContentType);
			
			return strContentType.startsWith("image");
		} catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	

	
	//업로드 요청 파일 - 저장 및 결과 메시지 전송
	@PostMapping(value = "/fileUploadAjaxAction", produces = {"application/json; charset=UTF-8"})
	@ResponseBody
	public  ResponseEntity<List<AttachfilesVO>> fileUploadActionPost(MultipartFile[] uploadFiles, @RequestParam(value="ImageID", required = false) Integer ImageID) {
		
		log.info("이미지아이디! : " + ImageID);
		
		log.info("들어온 파일 : " + uploadFiles);

		log.info("======FileUpload With Ajax=====");
		
		//업로드 파일 각각에 대한 피드백 정보를 담을 객체
		List<AttachfilesVO> listAttachInfo = new ArrayList<AttachfilesVO>();
		
		//날짜 형식 폴더 경로 문자열 생성
		String strDatefmtPathName = getDatefmtPathName();
		
		
		  File fileUploadPath = new File(uploadFileRepoDir, strDatefmtPathName);
		  log.info("upload path : " + fileUploadPath);
		 
		
		if(!fileUploadPath.exists()) {
			fileUploadPath.mkdirs();
		}
		
		for(MultipartFile multipartUploadFile : uploadFiles) {
			log.info("==========");
			log.info("Upload File Name : " + multipartUploadFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartUploadFile.getSize());
			
			//업로드 파일 각각에 대한 피드백 정보가 저장될 VO 객체 생성
			AttachfilesVO attachInfo = new AttachfilesVO();
			
			attachInfo.setRepoPath(uploadFileRepoDir.toString());
			log.info("attachInfoVO.repoPath : " +  attachInfo.getRepoPath());
			
			attachInfo.setUploadpath(strDatefmtPathName.toString());
			log.info("attachInfoVO.uploadPath : " + attachInfo.getUploadpath());
			
			String strUploadFileName = multipartUploadFile.getOriginalFilename();
			strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\")+1);
			
			if(ImageID!=null) {
				if(ImageID==1) {
					String ext=strUploadFileName.substring(strUploadFileName.lastIndexOf("."));
					String originFileName=FilenameUtils.getBaseName(strUploadFileName);
					originFileName="ImageForList_"+originFileName;
					strUploadFileName=originFileName+ext;
				} else if(ImageID==2) {
					String ext=strUploadFileName.substring(strUploadFileName.lastIndexOf("."));
					String originFileName=FilenameUtils.getBaseName(strUploadFileName);
					originFileName="ImageForDesc_"+originFileName;
					strUploadFileName=originFileName+ext;
				}
			}
			
			log.info("수정된 파일이름" + strUploadFileName);
			
			attachInfo.setFilename(strUploadFileName);
			log.info("attachInfoVO.fileName : " + attachInfo.getFilename());
			
			UUID uuid = UUID.randomUUID();
			
			//uuid 문자열 저장
			attachInfo.setUuid(uuid.toString());
			log.info("attachInfoVO : " + attachInfo.getUuid());
			
			strUploadFileName = uuid.toString() + "_" + strUploadFileName;
			log.info("UUID 처리된 파일 이름 : " + strUploadFileName);
			
			File saveUploadFile = new File(fileUploadPath, strUploadFileName);
			log.info("저장 시 사용되는 파일 이름" + saveUploadFile);
			
			try {
				multipartUploadFile.transferTo(saveUploadFile);
				
				//썸네일 관련
				if(checkIsImageForUploadFile(saveUploadFile)) {
					
//					attachInfo.setFiletype("I");
//					log.info("attachInfoVO.fileType : " + attachInfo.getFiletype());
					
					FileOutputStream outputStreamForThumbnail = 
											new FileOutputStream(new File(fileUploadPath, "s_" + strUploadFileName));
											if(ImageID!=null) {
												Thumbnailator.createThumbnail(multipartUploadFile.getInputStream(),
														outputStreamForThumbnail, 665, 750);
											} else {
												Thumbnailator.createThumbnail(multipartUploadFile.getInputStream(),
														outputStreamForThumbnail, 165, 165);
											}
											
											outputStreamForThumbnail.close();
				}						
//				else {
//					attachInfo.setFiletype("F");
//					log.info("attachInfoVO.fileType : " + attachInfo.getFiletype());
//				}
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
			listAttachInfo.add(attachInfo);
		}
		return new ResponseEntity<List<AttachfilesVO>> (listAttachInfo, HttpStatus.OK);
	}
	
	//썸네일 이미지 파일 표시
	@GetMapping("/displayThumbnailFile")
	@ResponseBody
	public ResponseEntity<byte[]> sendThumbNailFile(String fileName){
		
		if(fileName.equals(null) || fileName.equals("")) {
			return null;
		}
		
		File file = new File(fileName);
		log.info("썸네일 파일 이름(경로포함): " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<byte[]> (FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//서버에 업로드 된 파일 삭제
	@PostMapping("/deleteUploadedFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("파일 삭제 fileName : " + fileName);
		File delFile = null;
		
		try {
			delFile = new File(URLDecoder.decode(fileName, "UTF-8"));
			delFile.delete();
			

			String originalImageFileName = delFile.getAbsolutePath().replace("s_", "");
			
			log.info("largetFileName : " + originalImageFileName);
			
			delFile = new File(originalImageFileName);
			delFile.delete();
			
		} catch (UnsupportedEncodingException e){
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("SuccessDeletingFile", HttpStatus.OK);
	}
}
