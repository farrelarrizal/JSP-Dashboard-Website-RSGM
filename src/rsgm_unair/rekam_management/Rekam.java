package rsgm_unair.rekam_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;
    
@Data public class Rekam {
    private String nama;
    private String idPasien;
    private String rev;
    private String tglDatang;
    private String tglLahir;
    private String tglKonsultasi;
    private String jk;
    private String diagnosa;

    private String pembayaran;

}
