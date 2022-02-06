package dbtools;

import java.sql.*;

public class DataBaseHandler {
    private final String dbPass;
    private final String dbUser;
    private final String connectionString;

    public DataBaseHandler() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        connectionString = String.format("jdbc:postgresql://%s:%d/%s", "localhost", 5432, "staff");
        dbUser = "postgres";
        dbPass = "3102";
    }

    public ResultSet getAllRecords(String tableName) {
        ResultSet records = null;
        try(Connection connection = DriverManager.getConnection(connectionString, dbUser, dbPass)) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM " + tableName);
            records = statement.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return records;
    }
}
