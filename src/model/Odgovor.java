/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * @author Doris Greger
 */

public class Odgovor {
    private int sifra;
    private String tekst;
    private boolean tocan;

    public Odgovor(int sifra, String tekst, boolean tocan) {
        this.sifra = sifra;
        this.tekst = tekst;
        this.tocan = tocan;
    }

    public int getSifra() { return sifra; }
    public String getTekst() { return tekst; }
    public boolean isTocan() { return tocan; }
}
