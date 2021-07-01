<%@ page import="rsgm_unair.pasien_management.*" %>
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

<div class="pure-u" style="">
    <h2>Daftar Pasien RSGM UNAIR</h2>
</div>


<div class="pure-u-1" style=" ">
    <div class="pure-g">
        <div class="pure-u-1-3"> </div>
        <form style="font-size:80%" class="pure-form pure-u-1-3" action="?act=pasien" method="post">
            <input type="hidden" value="searchPasien" name="action" />
            <input type="text" class="pure-input-rounded" value="<%=searchPasien %>" name="searchPasien" placeholder="masukkan nama pasien..."/>
            <button type="submit" style="background-color:#ff6600; color:white" class="pure-button pure-button-secondary"><i class="fa fa-search" style="font-size:17px"></i></button>
            
            <a href="?act=tambahpasien" style="background-color:#0062ff" class="pure-button-primary pure-button"> + Tambah data </a>
        </form>
        <div class="pure-u-1-3"> </div>
    </div>

</div>


<%if(delete != null){%>
<p style="background: <%out.print("#28a745");%>;color:white"><b><%="Data Berhasil di hapus!"%></b></p>
<%}%>

<div style="margin-top:20px" class="pure-u-*">
    <table class="pure-table">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Pasien</th>
                <th>Jenis Kelamin</th>
                <th>Keluhan</th>
                <th><center>Aksi</center></th>
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
                <td><%=pagePasien.getResultList().get(i).getString("jk") %></td>
                <td><%=pagePasien.getResultList().get(i).getString("keluhan") %></td>
                
                <td>
                        <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=detail-pasien&id=<%=idPasien[1]%>"><b>Detail</b></a>
						|
						<a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=edit-pasien&id=<%=idPasien[1]%>"><b>Edit</b></a>
						|
						<a style="font-size:70% ; color:white ; background-color:#cf0000" class=" pure-button" href="?act=delete-pasien&id=<%=idPasien[1]%>"><b>Delete</b></a>
				</td>
            </tr>
            <% } %>
            
        </tbody>
    </table>
</div>

<div class="pure-g pure-2-1">
    <div class="pure-u-1-3">
        <p style="text-align:right">
			<% if(pagePasien.isHasPrevious()){ %>
			<a style="text-decoration:none ; text-align:right" href="?act=pasien&offset=<%=pagePasien.getPreviousOffset()%>"><<< Previous </a>
			<% } %>
        </p>
    </div>
    <div class="pure-u-1-3"><p>Menampilkan <%=pagePasien.getResultFrom()%> - 10 dari <%=pagePasien.getTotalResults()%> data.</p></div>
    <div class="pure-u-1-3">
        <p>
			<% if(pagePasien.isHasNext()){ %>
			<a style="text-decoration:none ; text-align:left" href="?act=pasien&offset=<%=pagePasien.getNextOffset()%>">>>> Next </a>
			<% } %>
		</p>
    </div>
</div>



