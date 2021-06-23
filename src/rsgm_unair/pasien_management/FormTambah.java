package rsgm_unair.pasien_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class FormTambah {
    private String nama;
    private String idPasien;
    private String jk;
    private String umur;
    private String tglMasuk;
    private String diagnosaMedis;
    private String noIC;
    private String alamat;
    private String noHp;
    private String title;
    private String rev;
    private String keluhan;
    private String dokter;
    
}
