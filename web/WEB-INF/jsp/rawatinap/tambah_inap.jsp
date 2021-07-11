<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%  
    String action = request.getParameter("action");
    String no = request.getParameter("id");
    String tipe = request.getParameter("tipe");
    String id = tipe+no;
    Response resp = null;
    JSONObject detailKamar = InapManagement.cariKamar(tipe);
    out.print(detailKamar);
        int urutan =1;
        int flag=0;
    

     if(action != null && action.equals("addPasienToRoom")){
        Inap fr = new Inap();
        while(detailKamar.has("kamar"+no+urutan)){
            if(detailKamar.getString("kamar"+no+urutan).equals("")){
                flag = urutan;
                break;
            }
            urutan++;
        }
        if(flag == 0){
            fr.setUrutanKamar(urutan);
        } else{
            fr.setUrutanKamar(flag);
        }
        fr.setRev(request.getParameter("rev"));
        fr.setIdPasien(request.getParameter("idPasien"));
        fr.setTglInap(request.getParameter("tglInap"));
        fr.setDokterPJ(request.getParameter("dokterPJ"));
        
        fr.setTipe(tipe);
        fr.setRoomNo(no);
        int temp = detailKamar.getInt(id) - 1;
        fr.setCurrentRoom(temp);
        int temp2 = detailKamar.getInt("bedKosong") - 1;
        fr.setCurrentTotal(temp2);
        JSONObject detailPasien = AdmissionManagement.cariPrePasien(request.getParameter("idPasien"));
        fr.setRevPasien(detailPasien.getString("_rev")) ;

        resp = InapManagement.assignRoom(fr);
        %>
        <script>
            window.location.href="?act=tipe-inap&id=<%=tipe%>&resp=<%=resp.getKode()%>"
        </script>
        <%
    }
%>


<h2>Tempatkan Pasien</h2>

                <form class="pure-form pure-form-aligned" method="post" action="?act=tambah-inap&tipe=<%=tipe%>&id=<%=no%>">
                    <fieldset>
                        <input type="hidden" id="action" name="action" value="addPasienToRoom">
                        <input type="hidden" id="rev" name="rev" value="<%=(detailKamar.getString( "_rev"))%>">
                        <div class="pure-control-group">
                            <label for="id">ID Pasien</label>
                            <input  type="text" autocomplete="off" id="id" name="idPasien" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group ">
                            <label for="tglInap">Tanggal Masuk Kamar Inap</label>
                            <input type="date" id="tglInap" name="tglInap" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group ">
                            <label for="dokterPJ">Dokter Penanggung Jawab</label>
                            <input type="text" id="dokterPJ" name="dokterPJ" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group">
                            <label for="jKamar">Jenis Kamar</label>
                            <input type="text" id="tipe" value="<%=tipe.toUpperCase() %>" name="jKamar"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="noKamar">Nomor Kamar</label>
                            <input type="text" id="noKamar" name="noKamar" value="<%=no %>" class="pure-input-1-4" required />
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                    </fieldset>
                </form>