/**
 * Datenbanken 1 Projekt:
 * 
 * Topic: Physiotherapie
 * 
 * @author Moritz Rohleder
 * @author Leon Michael Barratt
 * @author Bastian Litzmann
 * 
 * @version 1
 */
package dbverbindung;

import java.sql.*;

public class DBManager {
	
    private static final String url="jdbc:oracle:thin:@172.22.112.100:1521:fbpool";

    /**
     * Returns the given table as formatted String that is keeping the Table Structure
     * There is no check if the table name exists in the database in this method
     * 
     * @param	table	a name of a database table
     * @return 	a string containing the outcome of the query, formated for further use 
     */
    public static String showTable(String table){
        String sqlString = String.format("SELECT * FROM %s",table);
        String ausgabe = "";
        try(Connection con = DriverManager.getConnection(url,"C##FBPOOL148","oracle")){
            Class.forName("oracle.jdbc.driver.OracleDriver");
            PreparedStatement stmt = con.prepareStatement(sqlString);
            ResultSet rs = stmt.executeQuery();
            int columns = rs.getMetaData().getColumnCount();
            for(int i = 0; i < columns; i++) {
            	ausgabe = ausgabe + String.format("%-30s", rs.getMetaData().getColumnLabel(i+1));
            }
            ausgabe += "\n";
            while(rs.next()){
                for(int j = 0;j < columns; j++){
                    ausgabe = ausgabe + String.format("%-30s", rs.getString(j+1));
                }
                ausgabe += "\n";
            }
            rs.close();
            stmt.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return ausgabe;
    }
    
    /**
     * This method is to insert data into the given table
     * There is no check if the table exists or not.
     * The values are not checked if they fit the datatype of the database,
     * neither if there are enough values given or not.
     * That is to be handled with the interface or the backend.
     * The order of the values in the array needs to be as with a normal SQL INSERT statement.
     * 
     * @param table	A String containing the name of the table, the data is to be inserted to
     * @param values	An array of Strings that contain the values that are to be inserted into the database
     */
    public static void insert(String table, String[] values) {
    	String sqlString = String.format("INSERT INTO %s VALUES (", table);
    	for(int i = 0; i < values.length; i++) {
    		sqlString.concat(String.format("%s", values[i]));
    		if((i+1) < values.length) {
    			sqlString.concat(", ");
    		}
    	}
    	sqlString.concat(")");
    	try(Connection con = DriverManager.getConnection(url)){
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		PreparedStatement stmt = con.prepareStatement(sqlString);
    		stmt.execute();
    		stmt.close();
    	} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    /**
     * This method is to update existing data in the given table
     * The column names, and the table name are not checked if they actually exists in the database
     * The datatypes of the values is not checked if it is the correct one
     * 
     * @param table	A string containing the name of the table that is to be updated
     * @param columns	An array of Strings containing the names of the columns where values are to be updated
     * @param values	An array of Strings containing the values that are to replace the old ones
     * @param primaryKeys	An array of integers containing the ID/IDs that are being updated
     */
    public static void update(String table, String[] columns, String[] values, int[] primaryKeys) {
    	String sqlString = String.format("UPDATE ");
    }
    
    /**
     * This method is to delete data from the given table
     * 
     * @param table
     * @param primaryKeys
     */
    public static void delete(String table, int[] primaryKeys) {
    	
    }
}
