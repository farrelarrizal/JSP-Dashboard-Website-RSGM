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
                if(frp.getNik() != null && !frp.getNik().trim().equals("")){
                    if(frp.getTglLahir() != null && !frp.getTglLahir().trim().equals("")){
                        if(frp.getJk() != null && !frp.getJk().trim().equals("")){
                            if(frp.getAlamat() != null && !frp.getAlamat().trim().equals("")){
                                if(frp.getNoHP() != null && !frp.getNoHP().trim().equals("")){
                                    if(frp.getPembayaran () != null && !frp.getPembayaran  ().trim().equals("")){
                                        if(frp.getTglDatang() != null && !frp.getTglDatang().trim().equals("")){
                                            if(frp.getKeluhan() != null && !frp.getKeluhan().trim().equals("")){
                                                if(frp.getAsalRujukan() != null && !frp.getAsalRujukan().trim().equals("")){

                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "pasien:"+ frp.getIdPasien();
                                                    JSONObject pasien = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(frp.getRev() != null){
                                                        pasien.put("_rev",frp.getRev());
                                                    }
                                                    pasien.put("preAdms",frp.getPreAdms());
                                                    pasien.put("nama",frp.getNama());
                                                    pasien.put("nik",frp.getNik());
                                                    pasien.put("tglLahir",frp.getTglLahir());
                                                    pasien.put("jk",frp.getJk());
                                                    pasien.put("alamat",frp.getAlamat());
                                                    pasien.put("noHP",frp.getNoHP());
                                                    pasien.put("pembayaran",frp.getPembayaran());
                                                    pasien.put("tglDatang",frp.getTglDatang());
                                                    pasien.put("keluhan",frp.getKeluhan());
                                                    pasien.put("asalRujukan",frp.getAsalRujukan());

                                                    pasienClient.setDoc(id, pasien);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan cuk!");
                                                    message.setID(frp.getIdPasien());
                                                    pasienClient = null;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if(frp.getAptk()!= null && frp.getAptk().equals("true")){
            CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
            String id = "pasien:"+ frp.getIdPasien();
            JSONObject pasien = pasienClient.getDoc(id);

            // buat update
            pasien.put("_rev",frp.getRev());
            
            pasien.put("aptk",frp.getAptk());
            pasien.put("obat",frp.getObat());
            pasien.put("jumlahObat",frp.getJumlahObat());

            pasienClient.setDoc(id, pasien);

            message.setKode(Response.OK);
            message.setPesan("Data berhasil di tambahkan cuk!");
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


