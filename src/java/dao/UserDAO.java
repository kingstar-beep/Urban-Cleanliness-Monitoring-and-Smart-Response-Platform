package dao;

import model.User;

import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User login(

            String email,

            String password){

        User user = null;

        try{

            Connection conn =
                    DBConnection
                    .getConnection();

            String sql =
            "SELECT * FROM users " +
            "WHERE email=? " +
            "AND password=?";

            PreparedStatement stmt =
                    conn.prepareStatement(
                            sql);

            stmt.setString(1, email);

            stmt.setString(2, password);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()){

                user = new User();

                user.setId(
                        rs.getInt("id"));

                user.setFullName(
                        rs.getString(
                                "full_name"));

                user.setEmail(
                        rs.getString(
                                "email"));

                user.setRole(
                        rs.getString(
                                "role"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return user;
    }
}