package rsgm_unair.operasi_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class AssignOperasi {
    private String rev;
    private String IdPasienOperasi;
    private String nama;
    private String noKamar;
    private String dokter;
    private String tglOperasi;
    
}
