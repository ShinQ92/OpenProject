package guestbook.service;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import guestbook.model.MessageListView;
import jdbc.connection.ConnectionProvider;

 public class GetMessageListService {

  //싱글톤
 private static GetMessageListService instance = new GetMessageListService();
 public static GetMessageListService getInstance() {
  return instance;
 }
 private GetMessageListService() {
 }
 
 // 한 페이지에 보여줄 메시지의 수
 private static final int MESSAGE_COUNT_PER_PAGE = 3;
 //Message 리스트를 가져올 메서드 getMessageList(int pageNumber)
 //페이지 넘버를 입력하면 리스트를 가져와야 한다.
 public MessageListView getMessageList(int pageNumber) throws ServiceException {
  
  Connection conn = null;
  MessageDao dao = null;
  
  int currentPageNumber = 1;   //currentPageNumber의 default 값은 1
  
  //현재 페이지 넘버 구하기
  if(pageNumber > 0) {
   currentPageNumber = pageNumber;    
  }
  
  try {
   conn = ConnectionProvider.getConnection();    //DB연결 작업
   dao = MessageDao.getInstance();    //메서드 작업
   
   // 전체 게시물의 수
   int messageTotalCount = dao.selectCount(conn);
   
   //게시물의 리스트
   List<Message> messageList = null;
   int firstRow = 0;
   int endRow = 0;
   
   //firstRow 와 endRow 구해서, 그 안의 리스트 뽑기
   if(messageTotalCount > 0) {
    firstRow = (currentPageNumber - 1)*MESSAGE_COUNT_PER_PAGE;
    endRow = firstRow+ MESSAGE_COUNT_PER_PAGE - 1 ;
    messageList = dao.selectList(conn,firstRow, endRow);
    
   }else {
    currentPageNumber = 0;
    messageList = Collections.emptyList();
   }
   
   return new MessageListView(
     messageList,
     messageTotalCount,
     currentPageNumber,
     MESSAGE_COUNT_PER_PAGE,
     firstRow,
     endRow);
   
   
  } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }
  return null;
 }
}