package main.java.projectpack.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class jobsJDBC{
// method --> getJobsResultSet()
public ArrayList<Jobs> getjobsResultSet() {
		
		ArrayList<Jobs> jobRecSet = new ArrayList<Jobs>();
		
		//variables
		String DBuser = "root";
        String DBpass = "password123";
        String Driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:MySQL://localhost:3306/test12";
        
		try {
			String sql_command = "select id, title ,truckType , description, price, jobOwner from jobList";

			Class.forName(Driver);
			
			Connection con = DriverManager.getConnection(url,DBuser,DBpass);
			
			Statement statement = con.createStatement();

			ResultSet result = statement.executeQuery(sql_command);
			
			while(result.next()) {
				Jobs job = new Jobs();
				
				job.setId(result.getInt("id"));
				job.setTitle(result.getString("title"));
				job.setTruckType(result.getString("truckType"));
				job.setPrice(result.getString("price"));
				job.setDescription(result.getString("description"));
				job.setJobOwner(result.getString("jobOwner"));
				
				jobRecSet.add(job);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		//return
		return jobRecSet;
	}
}
