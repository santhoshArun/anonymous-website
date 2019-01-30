package anonymous;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Collections;

public class Trail {

	static Connection connection = null;
	static PreparedStatement statement = null;

	public static void main(String[] args) {
		
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:33335/anonymous", "postgres", "Stonebraker");
			
			statement = connection.prepareStatement("delete from online where name = 'santhosh'");
			statement.execute();
			connection.close();
		} catch(Exception e) {
			System.out.println(e + "e");
		}

	}

}
