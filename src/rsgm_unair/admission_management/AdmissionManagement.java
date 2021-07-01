package rsgm_unair.admission_management;

import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import org.json.*;
import rsgm_unair.admission_management.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;

public class AdmissionManagement {
    
    public static Response  managePasien(FormRegisPre frp) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Ada field required yang belum diisi! Silahkan isi kembali!");

        
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
        if(frp.getAdms()!= null && frp.getAdms().equals("true")){
            CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
            String id = "pasien:"+ frp.getIdPasien();
            JSONObject pasien = pasienClient.getDoc(id);

            // buat update
            pasien.put("_rev",frp.getRev());
            
            pasien.put("adms",frp.getAdms());
            pasien.put("klinis",frp.getKlinis());
            pasien.put("tglKonsultasi",frp.getTglKonsultasi());
            pasien.put("tensi",frp.getTensi());
            pasien.put("pulse",frp.getPulse());
            pasien.put("temperature",frp.getTemperature());
            pasien.put("diagnosa",frp.getDiagnosa());
            pasien.put("alasanDiagnosa",frp.getAlasanDiagnosa());

            pasienClient.setDoc(id, pasien);

            message.setKode(Response.OK);
            message.setPesan("Data berhasil di tambahkan cuk!");
            message.setID(frp.getIdPasien());
            pasienClient = null;            
        }

        return message;
    }

    public static Paging getPasien() throws Exception{
        Paging doc = new Paging();

        CouchdbClient pasienClient = CouchHelper.createClient(); 
        String parameter = null;
        parameter = "include_docs=true";

        // execute couch db get doc
        JSONObject resultRawDoc = pasienClient.view("preAdms","all",parameter);
        JSONArray resultDoc = resultRawDoc.getJSONArray("rows");

        doc.setDebug(parameter);
        // disimpen di array
        List<JSONObject> resultArrayDoc = new ArrayList<JSONObject>();

        for (int i = 0; i < resultDoc.length(); i++) {
            JSONObject objDoc = resultDoc.getJSONObject(i);
            resultArrayDoc.add(objDoc.getJSONObject("doc"));

        }

        doc.setResultList(resultArrayDoc);
        pasienClient = null;

        return doc;
    }

    public static Paging getAdmsPasien() throws Exception{
        Paging doc = new Paging();

        CouchdbClient pasienClient = CouchHelper.createClient(); 
        String parameter = null;
        parameter = "include_docs=true";

        // execute couch db get doc
        JSONObject resultRawDoc = pasienClient.view("adms","all",parameter);
        JSONArray resultDoc = resultRawDoc.getJSONArray("rows");

        doc.setDebug(parameter);
        // disimpen di array
        List<JSONObject> resultArrayDoc = new ArrayList<JSONObject>();

        for (int i = 0; i < resultDoc.length(); i++) {
            JSONObject objDoc = resultDoc.getJSONObject(i);
            resultArrayDoc.add(objDoc.getJSONObject("doc"));

        }

        doc.setResultList(resultArrayDoc);
        pasienClient = null;

        return doc;
    }

    public static JSONObject cariPrePasien(String id) throws Exception{
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
