<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.rekam_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%  
    // Get all doc
    String action = null ;
    action = request.getParameter("action");
    
    String delete = null;
    delete = request.getParameter("delete");

    if(action != null && action.equals("searchPasien")){
        session.setAttribute("searchPasien",request.getParameter("searchPasien"));
    }

    String searchPasien = request.getParameter("searchPasien");
    if(searchPasien == null){
        searchPasien = "";
    }
    

    PagingPasien pp = new PagingPasien();
    pp.setPerPage(10);
    if(request.getParameter("offset") != null && !request.getParameter("offset").trim().equals("")){
        pp.setOffset(Integer.parseInt(request.getParameter("offset")));
        if(searchPasien != null && !searchPasien.trim().equals("")){
            pp.setSearchPasien(searchPasien);

        }
    }
    
    Paging pagePasien = PasienManagement.getPagingPasien(pp);
    

    String idTemp = null;
    String [] idPasien = new String[2];
%>

<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Rekam Medis </h1>

        <form class="pure-form pure-form-aligned pure-u-1-2" style="margin-top:10px">
            <fieldset >
                <div class="pure-control-group">
                    <label for="aligned-name">Cari Data:</label>
                    <input type="text" id="aligned-name"  />
                </div>
            </fieldset>
        </form>
        <table class="pure-table pure-table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama Pasien</th>
                    <th>Tanggal Lahir</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < pagePasien.getResultList().size(); i++) { %>
                <%
                    idTemp = pagePasien.getResultList().get(i).getString("_id");
                    idPasien = idTemp.split("pasien:") ;
                    
                %>
                
                <tr class="<%if((i+1) %2 == 1){out.print("pure-table-odd");}%>" >
                    <td ><%=(pagePasien.getResultFrom()+i )%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("nama")%></td>
                    <td><%=idPasien[1]%></td>
                    <td><%=pagePasien.getResultList().get(i).getString("keluhan") %></td>
                    <td> <a style="font-size:70% ; color:rgb(255, 255, 255) ; background-color:#fc9a08" class=" pure-button" href="?act=detail-rekammedis"><b>Detail</b></a> </td>
                </tr>
            </tbody>
        </table>

        <div style="margin-top:25px; font-size:1.2em">
                    <a class="pure-button pure-button-primary" href="?act=default" style="margin-right:5px;" >Kembali</a>
                    </div>

	</div>
</div>