# Selamat Datang di Project Kelompok 2 RBPL Kelas C Sistem Informasi ITS
Dalam repository kali ini, kami akan coba untuk merealisasikan project website berdasarkan dokumen requirement yang sdah kami bentuk sebelumnya.


## Mengunduh Repository
anda dapat mengunduh dengan mengclone repository ini ke file local anda. 
```
git clone https://github.com/farrelarrizal/RBPL-C-kelompok2.git <folder tujuan>
```

## Memperbarui Repository
Anda dapat memperbarui repository menggunakan github desktop atau dengan command `git pull` kedalam folder lokal anda
```
git pull origin <nama branch>
```

## Mengunggah Perubahan  
Anda dapat memperbarui repository menggunakan github desktop atau dengan command berikut kedalam folder lokal anda
```
git add .
```
```
git commit -m "<pesan commit>"
```
```
git push origin
```

## Konfigurasi Database
Dukungan database dalam project ini menggunakan apache couchdb. Berikut adalah panduan untuk konfigurasi database
* Membuat database baru dengan nama `rsgm_unair` no partition.
* Membuat view baru meliputi :
    1. User : Membuat Design _design/`user` dengan index name `all` dan Map Function berikut:
    ``` 
    function (doc) {
      if(doc._id.startsWith("user:")){
         emit(doc._id, null);
       }
     }
    ````
    2. Pasien : Membuat Design _design/`pasien` dengan index name `all` dan Map Function berikut:
    ``` 
    function (doc) {
      if(doc._id.startsWith("pasien:")){
        emit(doc.nama, null);
      }
     } 
    ````
     3. PreAdms : Membuat Design _design/`preAdms` dengan index name `all` dan Map Function berikut:
    ``` 
    function (doc) {
        if(doc.preAdms=="true" && doc._id.startsWith("pasien:")){
            emit(doc.nama, doc.nik);
        }
    }
    ````
    4. Adms : Membuat Design _design/`adms` dengan index name `all` dan Map Function berikut:
    ``` 
    function (doc) {
        if(doc.adms=="true" && doc._id.startsWith("pasien:")){
            emit(doc.nama, doc.nik);
        }
    }
    ````
    5. Apotek : Membuat Design _design/`aptk` dengan index name `all` dan Map function berikut
     ``` 
    function (doc) {
        if(doc.aptk=="true" && doc._id.startsWith("pasien:")){
            emit(doc.nama, doc.nik);
        }
    }
    ````
    6. Kamar Inap : Membuat Design _design/`kamar` dengan index name `all` dan Map function berikut
    ``` 
    function (doc) {
        if(doc._id.startsWith("kamar:")){
        emit(doc._id,null);
        }
    }
    ````    
    7. Operasi : Membuat Design _design/`operasi` dengan index name `all` dan Map function berikut
    ``` 
    function (doc) {
    if(doc.operasi=="true" && doc._id.startsWith("pasien:")){
       emit(doc.nama, doc.nik);
        }
    }
    ````   
    
    ## Konfigurasi Website
    Dukungan bahasa pengembangan menggunakan Java dan JSP sebagai output keluaran halaman. Sebelum memulai anda harus memastikan `apache-tomcat` sudah running. 
    
    Compile dengan menggunakan perintah `ant gas` untuk melakukan deployment ke localhost.
    
    Url website : `localhost:<port-anda>/user_management/`
