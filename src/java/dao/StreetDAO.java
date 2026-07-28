package dao;

import model.Street;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class StreetDAO {

    // INSERT STREET
    public boolean addStreet(Street street) {

        boolean status = false;

        String sql = "INSERT INTO streets(name, city, latitude, longitude)"
                + " VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, street.getName());
            stmt.setString(2, street.getCity());
            stmt.setDouble(3, street.getLatitude());
            stmt.setDouble(4, street.getLongitude());

            int rows = stmt.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // FETCH ALL STREETS
    public List<Street> getAllStreets() {

        List<Street> streets = new ArrayList<>();

        String sql = "SELECT * FROM streets";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Street street = new Street();

                street.setId(rs.getInt("id"));
                street.setName(rs.getString("name"));
                street.setCity(rs.getString("city"));
                street.setLatitude(rs.getDouble("latitude"));
                street.setLongitude(rs.getDouble("longitude"));

                streets.add(street);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return streets;
    }

    public Street getStreetById(int id) {

        Street street = null;

        try {

            Connection conn
                    = DBConnection.getConnection();

            String sql
                    = "SELECT * FROM streets WHERE id = ?";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet rs
                    = stmt.executeQuery();

            if (rs.next()) {

                street = new Street();

                street.setId(
                        rs.getInt("id"));

                street.setName(
                        rs.getString("name"));

                street.setLatitude(
                        rs.getDouble("latitude"));

                street.setLongitude(
                        rs.getDouble("longitude"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return street;
    }
}
