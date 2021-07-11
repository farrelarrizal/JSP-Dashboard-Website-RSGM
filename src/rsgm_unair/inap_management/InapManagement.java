package rsgm_unair.inap_management;

import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.inap_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import org.json.*;
import rsgm_unair.admission_management.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;


public class InapManagement {
    public static Paging getKamar() throws Exception{
        Paging doc = new Paging();

        CouchdbClient pasienClient = CouchHelper.createClient(); 
        String parameter = null;
        parameter = "include_docs=true";

        // execute couch db get doc
        JSONObject resultRawDoc = pasienClient.view("kamar","all",parameter);
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

    public static JSONObject cariKamar(String id) throws Exception{
        String docId = "kamar:"+id;

        CouchdbClient pasienClient = CouchHelper.createClient();

        JSONObject kamar = pasienClient.getDoc(docId);
        pasienClient = null;

        if(!kamar.has("_id")){
            return null;
        }
        return kamar;
    }

    public static Response  assignRoom(Inap frp) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Ada field required yang belum diisi! Silahkan isi kembali!");
        
        
        if(frp.getIdPasien() != null && !frp.getIdPasien().trim().equals("")){
            if(frp.getTglInap() != null && !frp.getTglInap().trim().equals("")){
                if(frp.getDokterPJ() != null && !frp.getDokterPJ().trim().equals("")){
                    
                        
                        
                        CouchdbClient kamarClient = CouchHelper.createClient();
                        CouchdbClient pasienClient = CouchHelper.createClient();
                        
                        String idKamar = "kamar:"+frp.getTipe();
                        String id = "pasien:"+frp.getIdPasien();
                        
                        JSONObject kamar = kamarClient.getDoc(idKamar);
                        JSONObject pasien = pasienClient.getDoc(id);
                        
                        // buat update
                        if(frp.getRev() != null){
                            kamar.put("_rev",frp.getRev());
                        }else{
                            message.setPesan("Rev Tidak ada!");
                            message.setKode(Response.ERROR);
                        }
                        
                        // menentukan urutan kamar
                        // int urutan =1;
                        // while(kamar.has("kamar"+frp.getRoomNo()+urutan)){
                        //     urutan++;
                        // }
                        
                        kamar.put("bedKosong", frp.getCurrentTotal());
                        kamar.put("kamar"+frp.getRoomNo()+frp.getUrutanKamar(), frp.getIdPasien());
                        kamar.put(frp.getTipe()+frp.getRoomNo(), frp.getCurrentRoom());

                        //insert dokter pj ke pasien
                        pasien.put("dokterPJ",frp.getDokterPJ());
                        pasien.put("_rev",frp.getRevPasien());
                        pasien.put("tglInap",frp.getTglInap());
                        
                        kamarClient.setDoc(idKamar, kamar);
                        pasienClient.setDoc(id, pasien);

                        
                        message.setKode(Response.OK);
                        message.setPesan("Data berhasil di tambahkan!");
                        message.setID(frp.getIdPasien());
                        kamarClient = null;
                        pasienClient= null;
                        
                    }
                }
                message.setPesan(frp.getRevPasien());
            
        }
        
        return message;
    }

    public static Response  removePasien(Inap frp) throws Exception {
    
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Gagal dihapus!");


        CouchdbClient kamarClient = CouchHelper.createClient();
        String idKamar = "kamar:"+frp.getTipe();
        JSONObject kamar = kamarClient.getDoc(idKamar);

        kamar.put("_rev",frp.getRev());
        kamar.put("kamar"+frp.getRoomNo()+frp.getUrutan(),"");
        kamar.put("bedKosong", frp.getCurrentTotal());
        kamar.put(frp.getTipe()+frp.getRoomNo(), frp.getCurrentRoom());

        kamarClient.setDoc(idKamar, kamar);
        
        message.setKode(Response.OK);
        message.setPesan("Data berhasil di tambahkan!");
        message.setID(frp.getIdPasien());
        kamarClient = null;


        return message;
    }
}
