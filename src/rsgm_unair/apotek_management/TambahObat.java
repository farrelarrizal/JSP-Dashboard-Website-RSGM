package rsgm_unair.apotek_management;


import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import org.json.*;
import rsgm_unair.apotek_management.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;

public class TambahObat {

    public static Response editObat(Apotek frp) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Ada Error");

        if(frp.getIdPasien() != null && !frp.getIdPasien().trim().equals("")){
            if(frp.getNama() != null && !frp.getNama().trim().equals("")){
                if(frp.getObat() != null && !frp.getObat().trim().equals("")){
                    if(frp.getJumlahObat() != null && !frp.getJumlahObat().trim().equals("")){
                        
                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "pasien:"+ frp.getIdPasien();
                                                    JSONObject pasien = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(frp.getRev() != null){
                                                        pasien.put("_rev",frp.getRev());
                                                    }
                                                    pasien.put("obat",frp.getObat());
                                                    pasien.put("jumlahObat",frp.getJumlahObat());

                                                    pasienClient.setDoc(id, pasien);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan cuk!");
                                                    message.setID(frp.getIdPasien());
                                                    pasienClient = null;
                                                }
                                            }
                                        }
                                    }



        return message;
    }

    public static JSONObject searchPasien(String id) throws Exception{
        String docId = "pasien:"+id;

        CouchdbClient pasienClient = CouchHelper.createClient();

        JSONObject pasien = pasienClient.getDoc(docId);
        pasienClient = null;

        if(!pasien.has("_id")){
            return null;
        }
        return pasien;
    }
}


