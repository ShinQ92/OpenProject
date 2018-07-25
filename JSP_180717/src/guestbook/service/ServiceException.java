package guestbook.service;

import java.sql.SQLException;

//사용자 정의 예외 클래스 

public class ServiceException extends Exception {

	public ServiceException(String string, SQLException e) {
		
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}
