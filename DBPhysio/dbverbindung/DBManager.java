package dbverbindung;

import java.sql.*;

public class DBManager {
    private static final String url="jdbc:oracle:thin:@172.22.112.100:1521:fbpool";

    public static String showTable(String table){
        String sqlString = String.format("SELECT * FROM %s",table);
        try(Connection con = DriverManager.getConnection(url,"C##FBPOOL148","oracle")){
            Class.forName("oracle.jdbc.driver.OracleDriver");
            PreparedStatement stmt = con.prepareStatement(sqlString);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){

            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
