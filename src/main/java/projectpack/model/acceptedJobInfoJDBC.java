package main.java.projectpack.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class acceptedJobInfoJDBC{
public ArrayList<AcceptedInfo> getAcceptedInfo() {
		
		ArrayList<AcceptedInfo> infoRec = new ArrayList<AcceptedInfo>();
		
		//variables
        
		String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:MySQL://localhost:3306/test12";
        
		try {
			// retrive all users information except password
			String sql_command = "select name, email, phone ,jobID , message, jobOwner from acceptedJobs";

			Class.forName(Driver);
			
			Connection con = DriverManager.getConnection(url,DBuser,DBpass);
			
			Statement statement = con.createStatement();

			ResultSet result = statement.executeQuery(sql_command);
			
			while(result.next()) {
				AcceptedInfo info = new AcceptedInfo();
				
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
