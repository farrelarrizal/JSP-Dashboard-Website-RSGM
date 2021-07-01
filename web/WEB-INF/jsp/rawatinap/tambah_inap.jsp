 <h2>Tempatkan Pasien</h2>

                <form class="pure-form pure-form-aligned" method="post" action="?act=tempatkanpasien">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="id">ID Pasien</label>
                            <input  type="text" autocomplete="off" id="id" name="idPasien" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <%-- <div class="pure-control-group ">
                            <label for="idPasien">ID Pasien</label>
                            <select id="idPasien" name="idPasien" class="pure-input-1-4" >
                                <option>Bariqi Raihan</option>
                                <option>Evan</option>
                            </select>
                        </div> --%>
                        <%-- <div class="pure-control-group">
                            <label for="nama">Nama Pasien</label>
                            <input  type="text" autocomplete="off" id="nama" name="nama" placeholder="" class="pure-input-1-4" required />
                        </div> --%>
                        <%-- <div class="pure-control-group">
                            <label for="tglLahir">Tanggal Lahir</label>
                            <input type="date" autocomplete="off" id="jeniskelamin" name="tglLahir" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglDatang">Tanggal Datang</label>
                            <input type="date" id="jeniskamar" name="tglDatang" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div> --%>
                        <div class="pure-control-group ">
                            <label for="tglIn">Tanggal Masuk Kamar Inap</label>
                            <input type="text" id="jeniskamar" name="tglIn" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group ">
                            <label for="dokterpj">Dokter Penanggung Jawab</label>
                            <input type="text" id="dokterpj" name="dokterpj" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group">
                            <label for="jKamar">Jenis Kamar</label>
                            <input type="text" id="tglmasukpasien" name="jKamar"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="noKamar">Nomor Kamar</label>
                            <input type="text" id="tglmasukpasien" name="noKamar"  class="pure-input-1-4" required />
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                    </fieldset>
                </form>