package rsgm_unair.pasien_management;

import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import org.json.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;


public class PasienManagement {

    public static Response  tambahPasien(FormTambah ft) throws Exception {
        Response ftr = new Response();
        ftr.setKode(Response.ERROR);
        ftr.setPesan("Ada field required yang belum diisi! Silahkan isi kembali!");

        if(ft.getNama() != null && !ft.getNama().trim().equals("")){
            if(ft.getJk() != null && !ft.getJk().trim().equals("")){
                if(ft.getUmur() != null && !ft.getUmur().trim().equals("")){

                        if(ft.getKeluhan() != null && !ft.getKeluhan().trim().equals("")){
                            if(ft.getDokter() != null && !ft.getDokter().trim().equals("")){
                                if(ft.getAlamat() != null && !ft.getAlamat().trim().equals("")){
                                    if(ft.getNoHp() != null && !ft.getNoHp().trim().equals("")){
                                        
                                        CouchdbClient pasienClient = CouchHelper.createClient();
                                        
                                        String id = "pasien:"+ ft.getIdPasien();
                                        JSONObject pasien = pasienClient.getDoc(id);
                                        
                                        // buat update
                                        if(ft.getRev() != null){
                                            pasien.put("_rev",ft.getRev());
                                        }
                                        pasien.put("nama",ft.getNama());
                                        pasien.put("jk",ft.getJk());
                                        pasien.put("umur",ft.getUmur());
                                        pasien.put("tgl-masuk",ft.getTglMasuk());
                                        pasien.put("diagnosa",ft.getDiagnosaMedis());
                                        pasien.put("no-IC",ft.getNoIC());
                                        pasien.put("alamat",ft.getAlamat());
                                        pasien.put("hp-pasien",ft.getNoHp());
                                        pasien.put("title", ft.getTitle());
                                        pasien.put("keluhan", ft.getKeluhan());
                                        pasien.put("dokter", ft.getDokter());
                                        pasienClient.setDoc(id, pasien);
                                        
                                        ftr.setKode(Response.OK);
                                        ftr.setPesan("Data berhasil di tambahkan!");
                                        pasienClient = null;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        return ftr;
    }
    
    public static  Paging getPagingPasien(PagingPasien pp) throws Exception{
        Paging doc = new Paging();
        CouchdbClient pasienClient = CouchHelper.createClient(); 
        String parameter = null;

        parameter = "include_docs=true";
        parameter += "&limit="+pp.getPerPage();
        parameter += "&skip="+pp.getOffset();
        
        if(pp.getSearchPasien() != null){
            String [] tempSearch = pp.getSearchPasien().split(" ");
            String temp = tempSearch[0];
            for (int i = 1; i < tempSearch.length; i++) {
                temp+="%20"+tempSearch[i];
            }
            parameter += "&key=\""+ temp + "\"";
        }
        

        // execute couch db get doc
        JSONObject resultRawDoc = pasienClient.view("pasien","all",parameter);
        JSONArray resultDoc = resultRawDoc.getJSONArray("rows");
        
        doc.setDebug(parameter);
        // disimpen di array
        List<JSONObject> resultArrayDoc = new ArrayList<JSONObject>();

        for (int i = 0; i < resultDoc.length(); i++) {
            JSONObject objDoc = resultDoc.getJSONObject(i);
            resultArrayDoc.add(objDoc.getJSONObject("doc"));

        }

        doc.setResultList(resultArrayDoc);

        // pagination
        int totalRowsDoc = resultRawDoc.getInt("total_rows");
        int resultDocFrom = pp.getOffset()+1;
        int resultDocTo = resultDocFrom + pp.getPerPage() - 1;

        doc.setTotalResults(totalRowsDoc);
        doc.setResultFrom(resultDocFrom);
        doc.setResultTo(resultDocTo);

        boolean hasNext = true;
        boolean hasPrev = true;
        if(resultDocFrom <= pp.getPerPage()) hasPrev = false;
        if(resultDocTo >= totalRowsDoc) hasNext= false;

        int prevOffset = pp.getOffset() - pp.getPerPage();
        int nextOffset = pp.getOffset() + pp.getPerPage();

        doc.setHasNext(hasNext);
        doc.setHasPrevious(hasPrev);
        doc.setPreviousOffset(prevOffset);
        doc.setNextOffset(nextOffset);

        pasienClient = null;
        return doc;
    }

    public static JSONObject cariPasien(String id) throws Exception{
        String docId = "pasien:"+id;

        CouchdbClient pasienClient = CouchHelper.createClient();

        JSONObject pasien = pasienClient.getDoc(docId);
        pasienClient = null;

        if(!pasien.has("_id")){
            return null;
        }
        return pasien;
    }

    public static void deletePasien(String id) throws Exception{
        
        CouchdbClient pasienClient = CouchHelper.createClient();

        if(id != null){
            // delete doc
            pasienClient.delDoc(id);
            pasienClient = null;
            
        }

    }

    public static JSONObject searchPasien (String id) throws Exception{
        String docId = "pasien:"+id;

        CouchdbClient pasienClient = CouchHelper.createClient();

        JSONObject pasien = pasienClient.getDoc(docId);
        pasienClient = null;

        if(!pasien.has("_id")){
            return null;
        }
        return pasien;
    }

    public static JSONObject createNewPasien(){
        JSONObject pasien = new JSONObject();
        pasien.put("nama","");
        pasien.put("jk","");
        pasien.put("umur","");
        pasien.put("tgl-masuk","");
        pasien.put("diagnosa","");
        pasien.put("no-IC","");
        pasien.put("kamar", "");
        pasien.put("alamat","");
        pasien.put("hp-pasien","");
        pasien.put("hp-keluarga","");
        pasien.put("title", "");

        return pasien;
    }

}
