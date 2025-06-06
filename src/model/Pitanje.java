/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @author Doris Greger
 */

import java.util.List;

public class Pitanje {
    private int sifra;
    private String tekst;
    private List<Odgovor> odgovori;

    public Pitanje(int sifra, String tekst) {
        this.sifra = sifra;
        this.tekst = tekst;
    }

    public int getSifra() { return sifra; }
    public String getTekst() { return tekst; }
    public List<Odgovor> getOdgovori() { return odgovori; }
    public void setOdgovori(List<Odgovor> odgovori) { this.odgovori = odgovori; }
}
