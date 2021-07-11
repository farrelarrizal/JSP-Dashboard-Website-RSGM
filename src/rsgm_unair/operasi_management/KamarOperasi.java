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

        if(ao.getIdPasien() != null && !ao.getIdPasien().trim().equals("")){
                if(ao.getNoKamar() != null && !ao.getNoKamar().trim().equals("")){
                    if(ao.getDokterOperasi() != null && !ao.getDokterOperasi().trim().equals("")){
                        if(ao.getTglOperasi() != null && !ao.getTglOperasi().trim().equals("")){

                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "pasien:"+ ao.getIdPasien();
                                                    JSONObject pasien = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(ao.getRev() != null){
                                                        pasien.put("_rev",ao.getRev());
                                                    }
                                                    pasien.put("noKamar",ao.getNoKamar());
                                                    pasien.put("dokterOperasi",ao.getDokterOperasi());
                                                    pasien.put("tglOperasi",ao.getTglOperasi());
                                                    pasien.put("operasi",ao.getOperasi());

                                                    pasienClient.setDoc(id, pasien);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan");
                                                    message.setID(ao.getIdPasien());
                                                    pasienClient = null;
                        }
                    }
                }
            }
        return message;
    }

    public static  Paging getPasienOperasi() throws Exception{
        Paging doc = new Paging();
        
        CouchdbClient pasienClient = CouchHelper.createClient(); 
        String parameter = null;

        parameter = "include_docs=true";
        

        // execute couch db get doc
        JSONObject resultRawDoc = pasienClient.view("operasi","all",parameter);
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
        
    public static  Paging getDaftarKamarOp() throws Exception{
        Paging doc = new Paging();
        
        CouchdbClient pasienClient = CouchHelper.createClient(); 
        String parameter = null;

        parameter = "include_docs=true";
        

        // execute couch db get doc
        JSONObject resultRawDoc = pasienClient.view("kamarOp","all",parameter);
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
}