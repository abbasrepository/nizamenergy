package Tester;

public class Hello {
	
	public static void insertAppliance(Integer applianceId,Integer userId,String imeiNo,String applianceName,String applianceproductNo,
			String applianceGSMNo,Integer applianceStatus,Integer powerConsumed,Integer loadConsumed,Integer healthStatus,Integer healthFlag,
			Integer is_signal_Catching){
		try(Connection con = Connect.getConnection()){
			CallableStatement ps = con
					.prepareCall("{Call insertAppliance(?,?,?,?,?,?,?,?,?,?,?,?)}");
			ps.setInt(1, applianceId);
			ps.setInt(2, userId);
			ps.setString(3, imeiNo);
			ps.setString(4, applianceName);
			ps.setString(5, applianceproductNo);
			ps.setString(6, applianceGSMNo);
			ps.setInt(7, applianceStatus);
			ps.setInt(8, powerConsumed);
			ps.setInt(9, loadConsumed);
			ps.setInt(10, healthStatus);
			ps.setInt(11, healthFlag);
			ps.setInt(12, is_signal_Catching);
			ps.execute();
		} catch(Exception ex){
			ex.printStackTrace();
		}
	}
}







