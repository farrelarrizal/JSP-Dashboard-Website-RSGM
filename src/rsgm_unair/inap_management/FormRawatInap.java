package rsgm_unair.inap_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class FormRawatInap {
    private String idPasien;
    private String nama;
    private String tglLahir;
    private String tglDatang;
    private String tglIn;
    private String dokterpj;
    private String jKamar;
    private String noKamar;

    private String rev;
}

