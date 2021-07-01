package rsgm_unair.inap_management;

import rsgm_unair.pasien_management.*;
import rsgm_unair.user_management.*;
import rsgm_unair.config.*;
import rsgm_unair.shared.*;
import org.json.*;
import rsgm_unair.admission_management.*;
import rsgm_unair.inap_management.*;
import java.util.*;
import java.util.logging.*;
import radityopw.couchdbclient.*;

public class InapManagement {
    public static Response  managePasien(FormRawatInap frp) throws Exception {
        Response message = new Response();
        message.setKode(Response.ERROR);
        message.setPesan("Ada field required yang belum diisi! Silahkan isi kembali!");

        if(frp.getIdPasien() != null && !frp.getIdPasien().trim().equals("")){
            if(frp.getNama() != null && !frp.getNama().trim().equals("")){
                if(frp.getTglLahir() != null && !frp.getTglLahir().trim().equals("")){
                    if(frp.getTglDatang() != null && !frp.getTglDatang().trim().equals("")){
                        if(frp.getTglIn() != null && !frp.getTglIn().trim().equals("")){
                            if(frp.getDokter() != null && !frp.getDokter().trim().equals("")){
                                if(frp.getJKamar() != null && !frp.getJKamar().trim().equals("")){
                                    if(frp.getNoKamar() != null && !frp.getNoKamar().trim().equals("")){
                                                    CouchdbClient pasienClient = CouchHelper.createClient();
                                                    
                                                    String id = "pasien:"+ frp.getIdPasien();
                                                    JSONObject pasien = pasienClient.getDoc(id);

                                                    // buat update
                                                    if(frp.getRev() != null){
                                                        pasien.put("_rev",frp.getRev());
                                                    }
                                                    pasien.put("nama",frp.getNama());
                                                    pasien.put("tglLahir",frp.getTglLahir());
                                                    pasien.put("tglDatang",frp.getTglDatang());
                                                    pasien.put("tglIn",frp.getTglIn());
                                                    pasien.put("dokter",frp.getDokter());
                                                    pasien.put("jKamar",frp.getJKamar());
                                                    pasien.put("noKamar",frp.getNoKamar());

                                                    pasienClient.setDoc(id, pasien);

                                                    message.setKode(Response.OK);
                                                    message.setPesan("Data berhasil di tambahkan!");
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
        return message;
    }
}