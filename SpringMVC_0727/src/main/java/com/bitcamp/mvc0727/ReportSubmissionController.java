package com.bitcamp.mvc0727;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ReportSubmissionController {
	
	String dir= "C://uploadFile";
	
	@RequestMapping(value="/report/upload", method=RequestMethod.GET)
	public String form() {
		return "report/uploadForm";
	}
	
	@RequestMapping( value="submitReport1", method=RequestMethod.POST)
	public String submitReport1(
			@RequestParam("studentNumber") String studentNumber,
			@RequestParam("studentName") String studentName,
			@RequestParam("report") MultipartFile multipartFile,
			Model model
			) {
		
		System.out.println(studentNumber);
		System.out.println(studentName);
		System.out.println(multipartFile.getName());
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getSize());
		
		model.addAttribute("snum", studentNumber);
		model.addAttribute("sname", studentName);
		model.addAttribute("filename", multipartFile.getOriginalFilename());
		
		File file = new File(dir, multipartFile.getOriginalFilename());
		
		return "report/uploadComplete";
	}
	
	@RequestMapping(value="/report/submitReport1", method=RequestMethod.POST)
	public String submitReport2(MultipartHttpServletRequest request, Model model) throws IllegalStateException, IOException {
		
		String sNum = request.getParameter("studentNumber");
		String sName = request.getParameter("studentName");
		//파일받기
		MultipartFile report = request.getFile("report");
		//파일이름
		String fileName= report.getOriginalFilename();
		long filesize = report.getSize();
		
		System.out.println("학생번호 : " + sNum);
		System.out.println("학생이름 : " + sName);
		System.out.println("파일이름 : " + fileName);
		System.out.println("파일크기 : " + filesize);
		
		model.addAttribute("snum", sNum);
		model.addAttribute("sname", sName);
		model.addAttribute("fileName", fileName);
		
		//파일저장
		report.transferTo(new File(dir, fileName));
		
		
		return "report/uploadComplete";
	}

	public String submitReport3(RequestReportUpdate reportUpdate, Model model) throws IllegalStateException, IOException {
		
		System.out.println("학생번호 : " + reportUpdate.getStudentNumber());
		System.out.println("학생이름 : " + reportUpdate.getStudentName());
		System.out.println("파일이름 : " + reportUpdate.getReport().getOriginalFilename());
		System.out.println("파일크기 : " + reportUpdate.getReport().getSize());

		model.addAttribute("snum", reportUpdate.getStudentNumber());
		model.addAttribute("sname", reportUpdate.getStudentName());
		model.addAttribute("filename", reportUpdate.getReport().getOriginalFilename());
		
		
		reportUpdate.getReport().transferTo(new File(dir, reportUpdate.getReport().getOriginalFilename()));
		
		return "report/uploadComplete";		
	}
}
