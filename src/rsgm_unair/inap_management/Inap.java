package rsgm_unair.inap_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class Inap {
    private String idPasien;
    private String nama;
    private String rev;

    private int vvip;
    private int vip;
    private int reguler;
    private int currentRoom, CurrentTotal;
    private String urutan;
    private int urutanKamar;

    private String tglInap;
    private String dokterPJ;
    private String kamar, tipe;
    private String penyakit;
    private String roomNo;
    private String revPasien;


    
    
}
