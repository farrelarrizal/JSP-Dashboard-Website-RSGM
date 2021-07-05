package rsgm_unair.operasi_management;

import rsgm_unair.operasi_management.*;
import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import org.json.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;


public class KamarOperasi {

    public static Response assignKamar(AssignOperasi ao) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Error");

        if(ao.getNama() != null && !ao.getNama().trim().equals("")){
                if(ao.getNoKamar() != null && !ao.getNoKamar().trim().equals("")){
                    if(ao.getDokter() != null && !ao.getDokter().trim().equals("")){
                        if(ao.getTglOperasi() != null && !ao.getTglOperasi().trim().equals("")){

                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "operasi:"+ ao.getIdPasienOperasi();
                                                    JSONObject kamarOp = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(ao.getRev() != null){
                                                        kamarOp.put("_rev",ao.getRev());
                                                    }
                                                    kamarOp.put("noKamar",ao.getNoKamar());
                                                    kamarOp.put("dokter",ao.getDokter());
                                                    kamarOp.put("tglOperasi",ao.getTglOperasi());

                                                    pasienClient.setDoc(id, kamarOp);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan");
                                                    message.setID(ao.getNama());
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