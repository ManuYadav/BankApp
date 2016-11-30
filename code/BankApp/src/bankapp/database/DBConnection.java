package bankapp.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * CSI3317_PROJECT
 * 
 * @file DBConnection.java
 * @package bankapp.database
 * @author Mohamed Mansour
 * @2005
 * @email m0.interactive@gmail.com
 * @web www.m0interactive.com
 * @date 9-Dec-2005
 * 
 */
public class DBConnection {
	Connection con;
	private int QUERIES = 0;
	private boolean conFree = true;
	private String DatabaseURL = "jdbc:postgresql://web0.site.uottawa.ca:15432/mmans039";
	private String DatabaseDRIVER = "org.postgresql.Driver";
	private String DatabaseUser = "mmans039";
	private String DatabasePassword = "m0@BLAMER68";
	
//	private String DatabaseURL = "jdbc:postgresql://acadb:/mmans039";
//	private String DatabaseDRIVER = "org.postgresql.Driver";
//	private String DatabaseUser = "mmans039";
//	private String DatabasePassword = "m0@BLAMER68";
	
//	private String DatabaseDRIVER = "com.mysql.jdbc.Driver";
//	private String DatabaseURL = "jdbc:mysql://localhost/csi";
//	private String DatabaseUser = "csi";
//	private String DatabasePassword = "csi";
	/**
	 * Constructor of the Database which instantiates the connection
	 * 
	 * @throws Exception
	 */
	public DBConnection () throws Exception {
		try  {               
			// Load the driver
			Class.forName(DatabaseDRIVER).newInstance();
			
			// Get the connection
			con = DriverManager.getConnection(DatabaseURL,DatabaseUser,DatabasePassword);
			
		} catch (Exception ex) {
			throw new Exception("Couldn't open connection to database: " + ex.getMessage());
		}       
	}
	
	/**
	 * Closing the connection
	 * 
	 */
	public void remove () {
		try {
			con.close();
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	/**
	 * Getting the current Connection from pool
	 * 
	 * @return Connection
	 */
	protected Connection getConnection() {
		this.QUERIES = ++QUERIES;
		return con;
	}
	
	/**
	 * Releasing the current Database Connection
	 * 
	 */
	protected synchronized void releaseConnection() {
		remove();
	}
	
	/*
	 * Get num of queries
	 */
	public int getNumQueries() {
		return QUERIES;
	}
}