package org.derrick.sqllearningsystem.connecter;

import lombok.extern.slf4j.Slf4j;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class PlaygroundConnector {
    static Connection connection = null;
    private final String DB_URL;

    public PlaygroundConnector(String dbUrl) {
        // jdbc:mysql://localhost:60001/main_db?user=root&password=123456
        this.DB_URL = dbUrl;
        connect();
    }

    public void connect() {
        try {
            if (connection.isValid(5)) {
                log.info("SqlConnecter already connected to {}", DB_URL);
            return;
        }
            connection = DriverManager.getConnection(DB_URL);
        } catch (SQLException e) {
            log.error("Error connecting to database: {}", e.getMessage());
        }
        log.info("SqlConnecter connected to {}", DB_URL);
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException e) {
            log.error("Error closing connection: {}", e.getMessage());
        }
        log.info("SqlConnecter closed connection to {}", DB_URL);
    }

    public ResultSet executeQuery(String query) {
        try {
            return connection.createStatement().executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException("Error executing Query: " + e.getMessage());
        }
    }

    public int executeUpdate(String query) {
        try {
            return connection.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException("Error executing update: " + e.getMessage());
        }
    }
    public List<List<String>> convertResultSetToList(ResultSet resultSet) throws SQLException {
        List<List<String>> resultList = new ArrayList<>();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();

        // Add the column names as the first row
        List<String> columnNames = new ArrayList<>();
        for (int i = 1; i <= columnCount; i++) {
            columnNames.add(metaData.getColumnName(i));
        }
        resultList.add(columnNames);

        // Add the data rows
        while (resultSet.next()) {
            List<String> row = new ArrayList<>();
            for (int i = 1; i <= columnCount; i++) {
                String value = resultSet.getString(i);
                row.add(value);
            }
            resultList.add(row);
        }

        return resultList;
    }
}
