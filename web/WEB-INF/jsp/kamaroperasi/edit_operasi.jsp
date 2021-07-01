<h2>Edit Kamar Operasi</h2>

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
            <label for="umur">Umur Pasien</label>
            <input  type="text" autocomplete="off" id="umur" name="umur" placeholder="" class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group">
            <label for="jeniskelamin">Jenis Kelamin</label>
            <input  type="text" autocomplete="off" id="jeniskelamin" name="jeniskelamin" placeholder="" class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group ">
            <label for="nokamar">No Kamar Operasi</label>
            <input type="text" id="nokamar" name="nokamar" autocomplete="off" placeholder="" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group ">
            <label for="dokter">Dokter</label>
            <input type="text" id="dokter" name="dokter" autocomplete="off" placeholder="" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="tgloperasi">Tanggal Operasi</label>
            <input type="date" id="tgloperasi" name="tgloperasi"  class="pure-input-1-4" required />
        </div>
        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
        <a href="?act=kamar-operasi" style="background:#ffee07; color: rgb(70, 64, 64)" class="pure-button"><b>Kembali</b></a>
    </fieldset>
</form>