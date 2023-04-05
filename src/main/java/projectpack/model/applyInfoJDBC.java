package main.java.projectpack.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class applyInfoJDBC{
public ArrayList<ApplyInfo> getApplyInfo() {
		
		ArrayList<ApplyInfo> infoRec = new ArrayList<ApplyInfo>();
		
		//variables
        
		String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:MySQL://localhost:3306/test12";
        
		try {
			// retrive all users information except password
			String sql_command = "select name, email, phone ,jobID , message, jobOwner from applyJob";

			Class.forName(Driver);
			
			Connection con = DriverManager.getConnection(url,DBuser,DBpass);
			
			Statement statement = con.createStatement();

			ResultSet result = statement.executeQuery(sql_command);
			
			while(result.next()) {
				ApplyInfo info = new ApplyInfo();
				
                info.setFullname(result.getString("name"));
                info.setEmail(result.getString("email"));
                info.setPhone(result.getString("phone"));
                info.setJobID(result.getString("jobID"));
                info.setMessage(result.getString("message"));
				info.setJobOwner(result.getString("jobOwner")); //jobOwner's email
				infoRec.add(info);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return infoRec;
	}
}
