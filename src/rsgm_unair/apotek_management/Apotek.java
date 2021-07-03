package rsgm_unair.apotek_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class Apotek {
    private String idPasien;
    private String nama;

    private String obat;
    private String jumlahObat;
    private String generateResep;
    private String aptk;
    
    private String rev;
    
}
