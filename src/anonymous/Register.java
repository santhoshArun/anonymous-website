package anonymous;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Register {

	static Connection connection = null;
	static PreparedStatement statement = null;
	
	public static int registerUser(String username, String ip) {
		
		int status = 0;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss.SSS");
		Date date = new Date();
		String dateTime = format.format(date);
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			statement = connection.prepareStatement("INSERT INTO LOGIN VALUES(?,?,?)");
			statement.setString(1, username);
			statement.setString(2, ip);
			statement.setString(3, dateTime);
			
			statement.execute();
			
			status = 1;
			
			System.out.println("new user logged in..." + status);
			
			
			//connection.commit();
			
		} catch(Exception e) {
			status = 0;
		}
		
		return status;

	}
	
	public static String getIP() throws Exception {
		URL whatismyip = new URL("http://checkip.amazonaws.com");
		BufferedReader in = new BufferedReader(new InputStreamReader(whatismyip.openStream()));

		String ip = in.readLine();
		
		return ip;
	}

}
