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
                if(frp.getObat() != null && !frp.getObat().trim().equals("")){
                    if(frp.getJumlahObat() != null && !frp.getJumlahObat().trim().equals("")){
                        
                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "pasien:"+ frp.getIdPasien();
                                                    JSONObject pasien = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(frp.getRev() != null){
                                                        pasien.put("_rev",frp.getRev());
                                                        for(int i=1 ;i<6;i++){
                                                            if(!pasien.has("obat"+i)){
                                                                pasien.put("obat"+i,frp.getObat());
                                                                pasien.put("jumlahObat"+i,frp.getJumlahObat());
                                                                break;
                                                            }
                                                        }
                                                        pasien.put("aptk",frp.getAptk());

                                                    }

                                                    pasienClient.setDoc(id, pasien);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan cuk!");
                                                    message.setID(frp.getIdPasien());
                                                    pasienClient = null;
                                                }
                                            }
                                    }



        return message;
    }

    public static Response editResep(Apotek frp) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Ada Error");

        if(frp.getIdPasien() != null && !frp.getIdPasien().trim().equals("")){
                
                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "pasien:"+ frp.getIdPasien();
                                                    JSONObject pasien = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(frp.getRev() != null){
                                                        pasien.put("_rev",frp.getRev());
                                                        // for(int i=1 ;i<8;i++){
                                                        //     if(!pasien.has("jumlahBeli"+i)){
                                                        //         pasien.put("jumlahBeli"+i,frp.getJumlahBeli());
                                                        //      break;
                                                        //     }
                                                           
                                                        // }
                                                        pasien.put("jumlahBeli1",frp.getJumlahBeli1());
                                                        pasien.put("jumlahBeli2",frp.getJumlahBeli2());
                                                        pasien.put("jumlahBeli3",frp.getJumlahBeli3());
                                                        pasien.put("jumlahBeli4",frp.getJumlahBeli4());
                                                        pasien.put("jumlahBeli5",frp.getJumlahBeli5());
                                                        pasien.put("jumlahBeli6",frp.getJumlahBeli6());

                                                        pasien.put("generate1", frp.getGenerate1());
                                                        pasien.put("generate2", frp.getGenerate2());
                                                        pasien.put("generate3", frp.getGenerate3());
                                                        pasien.put("generate4", frp.getGenerate4());
                                                        pasien.put("generate5", frp.getGenerate5());
                                                        pasien.put("generate6", frp.getGenerate6());

                                                        pasien.put("rsp",frp.getRsp());

                                                    }

                                                    pasienClient.setDoc(id, pasien);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan!");
                                                    message.setID(frp.getIdPasien());
                                                    pasienClient = null;
                 
                                            
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


