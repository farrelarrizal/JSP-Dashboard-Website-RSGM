 <h2>Tempatkan Pasien</h2>

                <form class="pure-form pure-form-aligned" method="post" action="?act=tempatkanpasien">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="nama">Nama Pasien</label>
                            <input  type="text" autocomplete="off" id="nama" name="nama" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="id">ID Pasien</label>
                            <input  type="text" autocomplete="off" id="id" name="id" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="jeniskelamin">Jenis Kelamin</label>
                            <input type="text" autocomplete="off" id="jeniskelamin" name="jeniskelamin" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="jeniskamar">Jenis Kamar</label>
                            <input type="text" id="jeniskamar" name="jeniskamar" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group ">
                            <label for="nokamar">No Kamar</label>
                            <input type="text" id="jeniskamar" name="jeniskamar" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group ">
                            <label for="dokterpj">Dokter Penanggung Jawab</label>
                            <input type="text" id="dokterpj" name="dokterpj" autocomplete="off" placeholder="" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglmasukpasien">Tanggal Masuk Pasien</label>
                            <input type="date" id="tglmasukpasien" name="tglmasukpasien"  class="pure-input-1-4" required />
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                    </fieldset>
                </form>