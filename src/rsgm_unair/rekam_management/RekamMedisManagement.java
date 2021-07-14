package rsgm_unair.rekam_management;

import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import rsgm_unair.rekam_management.*;
import org.json.*;
import rsgm_unair.admission_management.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;

public class RekamMedisManagement {

    public static Response  editPasien(FormRegisPre frp) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Ada field required yang belum diisi! Silahkan isi kembali!");

        if(frp.getRev()!= null){
            CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
            String id = "pasien:"+ frp.getIdPasien();
            JSONObject pasien = pasienClient.getDoc(id);

            // buat update
            pasien.put("_rev",frp.getRev());
            pasien.put("nama",frp.getNama());
            pasien.put("tglKonsultasi",frp.getTglKonsultasi());
            pasien.put("tglDatang",frp.getTglDatang());
            pasien.put("tglLahir",frp.getTglLahir());
            pasien.put("jk",frp.getJk());
            pasien.put("diagnosa",frp.getDiagnosa());
            pasien.put("pembayaran",frp.getPembayaran());
            

            pasienClient.setDoc(id, pasien);

            message.setKode(Response.OK);
            message.setPesan("Data berhasil diperbarui!");
            message.setID(frp.getRev());
            pasienClient = null;            
        }
        return message;
    }
}
