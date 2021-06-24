
                <h2>Edit Formulir Pre Admission Pasien</h2>

                <form class="pure-form pure-form-aligned" method="post" action="?act=tambahpasien">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="dokter">Tanggal Kedatangan</label>
                            <input  type="date" autocomplete="off" id="dokter" name="dokter" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Keluhan/kondisi terkait pasien (opsional)</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="dokter">Asal RS Rujukan (Optional)</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan asal RS" class="pure-input-1-4" required />
                        </div>

                        <p> Data Pasien </p>
                        <div class="pure-control-group">
                            <label for="no-IC">Nama Lengkap Pasien</label>
                            <input type="text" id="no-IC" name="ic-pasien" autocomplete="off" placeholder="masukkan nama pasien" class="pure-input-1-4" />
                            <span style="margin-left:2% " class="pure-form-message">Nama Lengkap (Sesuai KTP/passport)</span>
                        </div>
                        <div class="pure-control-group ">
                            <label for="jenis-kelamin">Jenis Kelamin</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>Laki - Laki</option>
                                <option>Perempuan</option>
                            </select>
                        </div>
                        <div class="pure-control-group">
                            <label for="tgl-masuk-pasien">Tanggal Lahir Pasien</label>
                            <input type="date" id="tgl-masuk-pasien" name="tgl-masuk-pasien"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="dokter">NIK</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan nomer NIK" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="jenis-kelamin">Status Pernikahan</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>Menikah</option>
                                <option>Tidak Menikah</option>
                            </select>
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat-pasien">Email</label>
                            <input type="text" id="alamat-pasien" name="alamat-pasien" autocomplete="off" placeholder="masukkan alamat email" class="pure-input-1-4" required />
                        </div>
                        
                        <div class="pure-control-group">
                            <label for="alamat-pasien">Alamat Pasien</label>
                            <input type="text" id="alamat-pasien" name="alamat-pasien" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="hp-pasien">No HP Pasien</label>
                            <input type="text" id="hp-pasien" name="hp-pasien" autocomplete="off" placeholder="masukkan no hp" class="pure-input-1-4"required />
                        </div>
                        <div class="pure-control-group">
                            <label for="jenis-kelamin">Kewarganegaraan</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>WNI</option>
                                <option>WNA</option>
                            </select>
                        </div>
                        <div class="pure-control-group">
                            <label for="jenis-kelamin">Pembayaran</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>Sendiri</option>
                                <option>BPJS</option>
                                <option>Asuransi Non BPJS</option>
                            </select>
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                        <a href="?act=detail-pre" style=" background-color:#fdca40" class="pure-button ">Batal</a>
                    </fieldset>
                </form>
