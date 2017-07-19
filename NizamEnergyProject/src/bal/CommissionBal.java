package bal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;

import connection.Connect;
import schedule.PendingMessagesThread;

public class CommissionBal {
	
	private final static Logger logger = Logger.getLogger(CommissionBal.class);

	
	public static void getFieldOfficerCommissions(){
		
		try (Connection con = Connect.getConnection();) {
			CallableStatement prepareCall = con
					.prepareCall("{call get_fo_list_for_commission()}");
			ResultSet resultSet = prepareCall.executeQuery();
			while (resultSet.next()) {	
				insertFoCommissionEntries(resultSet.getInt("fo_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void insertFoCommissionEntries(int foId){
			
			try (Connection con = Connect.getConnection()) {
				CallableStatement prepareCall = con
						.prepareCall("{call insert_fo_commission_entries(?)}");
				prepareCall.setInt(1, foId);
				prepareCall.executeQuery();
			} catch (SQLException e) {
				logger.error(e);
				e.printStackTrace();
			}
		}
	
	
	
	
	// ND Cycle for the Commission
	
	
	
	public static void getNDCommissions(){

		try (Connection con = Connect.getConnection();) {
			CallableStatement prepareCall = con
					.prepareCall("{call get_nd_list_for_commission()}");
			ResultSet resultSet = prepareCall.executeQuery();
			while (resultSet.next()) {	
				insertNDCommissionEntries(resultSet.getInt("salesman_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
	
	
	public static void insertNDCommissionEntries(int ndId){
			
			try (Connection con = Connect.getConnection()) {
				CallableStatement prepareCall = con
						.prepareCall("{call insert_nd_commission_entries(?)}");
				prepareCall.setInt(1, ndId);
				prepareCall.executeQuery();
			} catch (SQLException e) {
				logger.error(e);
				e.printStackTrace();
			}
		}
	
}
