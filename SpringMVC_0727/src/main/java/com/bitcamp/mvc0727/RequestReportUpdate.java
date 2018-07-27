package com.bitcamp.mvc0727;

import org.springframework.web.multipart.MultipartFile;

public class RequestReportUpdate {

	private String studentNumber;
	private String studentName;
	@Override
	public String toString() {
		return "RequestReportUpdate [studentNumber=" + studentNumber + ", studentName=" + studentName + ", report="
				+ report + "]";
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	private MultipartFile report;
}
