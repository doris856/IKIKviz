/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

/**
 * @author Doris Greger
 */


import model.Odgovor;
import model.Pitanje;

import java.sql.*;
import java.util.*;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/iki?useSSL=false&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static List<Pitanje> dohvatiPitanja() {
        List<Pitanje> pitanja = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sqlPitanja = "SELECT * FROM pitanje";
            PreparedStatement stmtPitanja = conn.prepareStatement(sqlPitanja);
            ResultSet rsPitanja = stmtPitanja.executeQuery();

            while (rsPitanja.next()) {
                int sifra = rsPitanja.getInt("sifra");
                String tekst = rsPitanja.getString("tekst");
                Pitanje pitanje = new Pitanje(sifra, tekst);
                pitanje.setOdgovori(dohvatiOdgovoreZaPitanje(conn, sifra));
                pitanja.add(pitanje);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pitanja;
    }

    private static List<Odgovor> dohvatiOdgovoreZaPitanje(Connection conn, int sifraPitanja) throws SQLException {
        List<Odgovor> odgovori = new ArrayList<>();
        String sql = "SELECT * FROM odgovor WHERE pitanje = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, sifraPitanja);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            odgovori.add(new Odgovor(
                rs.getInt("sifra"),
                rs.getString("tekst"),
                rs.getBoolean("tocan")
            ));
        }
        return odgovori;
    }
}
