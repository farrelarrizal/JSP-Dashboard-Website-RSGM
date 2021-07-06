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
}
