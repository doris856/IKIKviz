package gui;

/**
 * @author Doris Greger
 */

import db.Database;
import model.Pitanje;
import model.Odgovor;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.List;

import static javax.swing.WindowConstants.EXIT_ON_CLOSE;

public class KvizFrame extends JFrame {

    private List<Pitanje> pitanja;
    private int indeksPitanja = 0;

    private JLabel lblPitanje;
    private JButton[] btnOdgovori;
    private JLabel lblInfo;
    private JPanel panelOdgovori;

    private final Font kvizFont = new Font("Segoe UI", Font.PLAIN, 16);
    private final Font naslovFont = new Font("Segoe UI", Font.BOLD, 20);
    private final Font infoFont = new Font("Segoe UI", Font.ITALIC, 15);

    public KvizFrame() {
        pitanja = Database.dohvatiPitanja();

        setTitle("Kviz: Dan sigurnijeg interneta");
        setSize(800, 500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        getContentPane().setBackground(new Color(240, 248, 255)); // Svijetloplava pozadina

        lblPitanje = new JLabel("Pitanje", SwingConstants.CENTER);
        lblPitanje.setFont(naslovFont);
        lblPitanje.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        add(lblPitanje, BorderLayout.NORTH);

        panelOdgovori = new JPanel(new GridLayout(4, 1, 10, 10));
        panelOdgovori.setBorder(BorderFactory.createEmptyBorder(10, 40, 10, 40));
        panelOdgovori.setBackground(new Color(240, 248, 255));
        btnOdgovori = new JButton[4];

        for (int i = 0; i < 4; i++) {
            btnOdgovori[i] = new JButton();
            btnOdgovori[i].setFont(kvizFont);
            btnOdgovori[i].setBackground(new Color(220, 230, 241));
            int finalI = i;
            btnOdgovori[i].addActionListener((ActionEvent e) -> provjeriOdgovor(finalI));
            panelOdgovori.add(btnOdgovori[i]);
        }

        add(panelOdgovori, BorderLayout.CENTER);

        lblInfo = new JLabel("Odaberi točan odgovor.", SwingConstants.CENTER);
        lblInfo.setFont(infoFont);
        lblInfo.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        add(lblInfo, BorderLayout.SOUTH);

        prikaziPitanje();
    }

    private void prikaziPitanje() {
        if (indeksPitanja >= pitanja.size()) {
            prikaziZavrsniZaslon();
            return;
        }

        lblInfo.setText("Odaberi točan odgovor.");

        Pitanje p = pitanja.get(indeksPitanja);
        lblPitanje.setText((indeksPitanja + 1) + ". " + p.getTekst());

        List<Odgovor> original = p.getOdgovori();
        List<Odgovor> prikazani = new ArrayList<>();

        for (Odgovor o : original) {
            if (o.isTocan()) {
                prikazani.add(o);
                break;
            }
        }

        for (Odgovor o : original) {
            if (!o.isTocan() && prikazani.size() < 4) {
                prikazani.add(o);
            }
        }

        for (int i = 0; i < prikazani.size(); i++) {
            btnOdgovori[i].setText((char) ('a' + i) + ") " + prikazani.get(i).getTekst());
            btnOdgovori[i].putClientProperty("tocan", prikazani.get(i).isTocan());
            btnOdgovori[i].setEnabled(true);
            btnOdgovori[i].setBackground(new Color(220, 230, 241));
        }
    }

    private void provjeriOdgovor(int indeks) {
        boolean tocan = (boolean) btnOdgovori[indeks].getClientProperty("tocan");

        if (tocan) {
            btnOdgovori[indeks].setBackground(new Color(144, 238, 144)); // Svijetlozelena
            lblInfo.setText("Točno! Bravo!");
        } else {
            btnOdgovori[indeks].setBackground(new Color(255, 160, 122)); // Crvenkasta
            lblInfo.setText("Netočno. Pokušaj ponovno!");
            return;
        }

        for (JButton btn : btnOdgovori) {
            btn.setEnabled(false);
        }

        indeksPitanja++;
        Timer timer = new Timer(1500, e -> prikaziPitanje());
        timer.setRepeats(false);
        timer.start();
    }

    private void prikaziZavrsniZaslon() {
        lblPitanje.setText("Čestitamo! Završio/la si kviz!");
        for (JButton btn : btnOdgovori) {
            btn.setVisible(false);
        }
        lblInfo.setText("Sada znaš više o sigurnosti na internetu. Budi pametan i zaštićen na mreži!");
    }
}
