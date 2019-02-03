package anonymous;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Chatbox {

	static Connection connection = null;
	static PreparedStatement statement = null;
	static int count = 1;
	
	public static void insertMessage(String username, String message) {
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			Date date = new Date();
			
			java.sql.Timestamp time = new java.sql.Timestamp(date.getTime());
			
			statement = connection.prepareStatement("INSERT INTO messages VALUES(?,?,?,?)");
			statement.setInt(1, count);
			statement.setString(2, username);
			statement.setString(3, message);
			statement.setTimestamp(4, time);
			
			statement.execute();
			count++;
			
			//connection.commit();
			connection.close();
			
		} catch(Exception e) {
			System.out.println(e + "a");
		}

	}
	
	static String[] username = new String[21];
	static String[] message = new String[21];
	static String[] time = new String[21];
	static int mcount;
	
	public static String[] getUsername() {
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			statement = connection.prepareStatement("SELECT username, message, time FROM messages ORDER BY time DESC LIMIT 12");
			
			ResultSet rs = statement.executeQuery();
			mcount = 0;
			while(rs.next()) {
				username[mcount] = rs.getString(1);
				message[mcount] = rs.getString(2);
				time[mcount] = rs.getTimestamp(3).toString();
				mcount++;
			}
			
			int j = mcount-1;
			int i = 0;
			String temp;
			while(i<j)
			{
		  	   temp = username[i];
			   username[i] = username[j];
			   username[j] = temp;
			   
			   temp = message[i];
			   message[i] = message[j];
			   message[j] = temp;
			   
			   temp = time[i];
			   time[i] = time[j];
			   time[j] = temp;
			   
			   i++;
			   j--;
			}
			
			//connection.commit();
			connection.close();
			
		} catch(Exception e) {
			System.out.println(e + "b");
		}
		
		return username;

	}
	
	public static String[] getMessage() {
		return message;
	}
	
	public static String[] getTime() {
		return time;
	}
	
	public static int getmcount() {
		return mcount;
	}
	
	public static void insertOnlineUser(String username) {
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			statement = connection.prepareStatement("INSERT INTO online VALUES('" + username + "') on conflict (name) do nothing;");
			statement.execute();
			
			System.out.println("inserted");
			connection.close();
		} catch(Exception e) {
			System.out.println(e + "c");
		}
	}
	
	static int onlineUsersCount;
	public static String[] getOnlineUsers() {
		String[] users = new String[50];
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			statement = connection.prepareStatement("SELECT name FROM online");
			ResultSet rs = statement.executeQuery();
			onlineUsersCount = 0;
			while(rs.next()) {
				users[onlineUsersCount] = rs.getString(1);
				onlineUsersCount++;
			}
			
			connection.close();
		} catch(Exception e) {
			System.out.println(e + "d");
		}
		return users;
	}
	
	public static int getOnlineUsersCount() {
		return onlineUsersCount;
	}
	
	public static void deleteOfflineUser(String user) {
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			statement = connection.prepareStatement("delete from online where name = '" + user + "'");
			statement.execute();
			System.out.println("deleted");
			connection.close();
		} catch(Exception e) {
			System.out.println(e + "e");
		}
	}
	
	public static void refreshList() {
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			statement = connection.prepareStatement("delete from online");
			System.out.println("refreshed.");
			statement.execute();
			connection.close();
		} catch(Exception e) {
			System.out.println(e + "e");
		}
	}

}
