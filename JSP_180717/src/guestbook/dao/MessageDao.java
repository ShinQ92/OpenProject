package guestbook.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import guestbook.model.Message;
import jdbc.JdbcUtil;
public class MessageDao {


 // DAO 클래스는 기능 클래스 --> 여러 개의 인스턴스 생성이 불필요하다.
 // 결론 --> 싱글톤 패턴으로 처리 하자.
 // 1.private 생성자
 private MessageDao() {
 }
 // 2.인스턴스 생성 : 1개 생성하고 공유해서 사용.
 private static MessageDao instance = new MessageDao();
 // 3. 외부에서 사용할 수 있는 메서드 생성.
 public static MessageDao getInstance() {
  return instance;
 }


 // Insert_insert() 메서드
 public int insert(Connection conn, Message message) throws SQLException {
  PreparedStatement pstmt = null;
  String sql = "insert into guestbook_message values (message_id_seq.NEXTVAL, ?, ?, ?)";
  try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, message.getGuestName());
   pstmt.setString(2, message.getPassword());
   pstmt.setString(3, message.getMessage());
   return pstmt.executeUpdate();
  } catch (SQLException e) {
   e.printStackTrace();
  } finally {
   JdbcUtil.close(pstmt);
  }
  return 0;
 }


 // Select_ selectCount() 메세지_for 전체 게시물 수(messageTotalCount)
 public int selectCount(Connection conn) throws SQLException {
  Statement stmt = null;
  ResultSet rs = null;
  String sql = "select count(*) from guestbook_message";
  try {
   stmt = conn.createStatement();
   rs = stmt.executeQuery(sql);
   rs.next();
   return rs.getInt(1);
  } finally {
   JdbcUtil.close(rs);
   JdbcUtil.close(stmt);
  }
 }


 //Select_ selectList()
 public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  List<Message> messageList = null;
  String sql = "select message_id, guest_name, password, message " + "from ( "
    + "select rownum rnum, message_id, guest_name, password, message " + "from ( " + "select * "
    + "from guestbook_message m " + "order by m.message_id desc " + ") " + "where rownum <= ? " + ") "
    + "where rnum >= ? " + "";
  pstmt = conn.prepareStatement(sql);
  pstmt.setInt(1, endRow);
  pstmt.setInt(2, firstRow);
  rs = pstmt.executeQuery();
  if (rs.next()) {
   messageList = new ArrayList<Message>();
   do {
    messageList.add(makeMessageFromResultSet(rs));
   } while (rs.next());
  } else {
   messageList = Collections.emptyList();
  }
  return messageList;
 }


 // ResultSet rs의 결과가 있다면 읽어오는 메서드.
 private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
  Message message = new Message();
  message.setId(rs.getInt("message_id"));
  message.setGuestName(rs.getString("guest_name"));
  message.setPassword(rs.getString("password"));
  message.setMessage(rs.getString("message"));
  return message;
 }


 //Delete_delete 하기 위하여 읽어 오는 메서드.
 public Message select(Connection conn, int messageId) throws SQLException {
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  Message message = null;
  String sql = "select * from guestbook_message where message_id=?";
  try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1, messageId);
   rs = pstmt.executeQuery();
   if (rs.next()) {
    message = makeMessageFromResultSet(rs);
    // message가 있다면 makeMessageFromResultSet(ResultSet rs) 메서드를 이용하여 결과 읽어온다.
   }
  } finally {
   JdbcUtil.close(rs);
   JdbcUtil.close(pstmt);
  }
  return message;
 }


 
 //Delete_delete 하는 메서드
 public int delete(Connection conn, int messageId) throws SQLException {
  
  PreparedStatement pstmt = null;
  String sql = "delete from guestbook_message where message_id = ?";
  
  
  try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1, messageId);
   pstmt.executeUpdate();
   
   
  }finally {
   JdbcUtil.close(pstmt);
  }
  return messageId;
 }
}