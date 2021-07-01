package rsgm_unair.admission_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class FormRegisPre {
    private String idPasien;
    private String nama;
    private String nik;
    private String tglLahir;
    private String jk;
    private String alamat;
    private String noHP;
    private String pembayaran;
    private String tglDatang;
    private String keluhan;
    private String asalRujukan;
    private String preAdms;
    private String adms;
    private String rev;
    
}
