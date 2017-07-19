package schedule;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;



import connection.Connect;

public class PendingMessagesThread {
	
	private final static Logger logger = Logger.getLogger(PendingMessagesThread.class);

	
	public static void updatePendingMsgStatus(int id){
		
		try (Connection con = Connect.getConnection()) {
			
			com.mysql.jdbc.PreparedStatement updateStatement = (com.mysql.jdbc.PreparedStatement) con
			.prepareStatement("UPDATE pending_messages pm set pm.status = 1 where pm.message_id = ?");
			updateStatement.setInt(1, id);
			updateStatement.executeUpdate();
			

		} catch (SQLException e) {
			logger.error(e);
			e.printStackTrace();
		}
		
	}

	public static ArrayList<HashMap<String, String>> getPendingMessages(){
		HashMap<String, String> map = null;
		ArrayList<HashMap<String, String>> list = new ArrayList<>();
		
		try (Connection con = Connect.getConnection();) {
			CallableStatement prepareCall = con
					.prepareCall("{call get_pending_messages()}");
			ResultSet resultSet = prepareCall.executeQuery();
			while (resultSet.next()) {
				map = new HashMap<>();
				
				String reciever_no = resultSet.getString("reciever_no");
				String message = resultSet.getString("message");
				
				map.put("customerPhone", reciever_no + "");
				map.put("message", message + "");
				
				System.err.println("=========== "+map);
				list.add(map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}
	
	
	public static void main(String[] a){
//		getPendingMessages();
		updatePendingMsgStatus(38);
	}
}
