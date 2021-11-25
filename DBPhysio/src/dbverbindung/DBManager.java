package src.dbverbindung;

import java.sql.*;

public class DBManager {
    private static final String url="jdbc:oracle:thin:@172.22.112.100:1521:fbpool";

    public static String showTable(String table){
        String sqlString = String.format("SELECT * FROM %s",table);
        return "";
    }
}
