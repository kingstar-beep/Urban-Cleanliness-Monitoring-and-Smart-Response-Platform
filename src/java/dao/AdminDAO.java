package dao;

import model.Admin;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    public Admin login(
            String username,
            String password){

        Admin admin = null;

        try{

            Connection conn =
                    DBConnection.getConnection();

            String sql =
            "SELECT * FROM admins "
            + "WHERE username=? "
            + "AND password=?";

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1, username);

            stmt.setString(2, password);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()){

                admin = new Admin();

                admin.setId(
                        rs.getInt("id"));

                admin.setUsername(
                        rs.getString(
                                "username"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return admin;
    }
}