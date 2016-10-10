# HariJawa
Unit _HariJawa.pas_ berisi fungsi untuk mencari hari, pasaran, wuku, paringkelan, jenis tahun, dan jenis windu dari suatu tanggal Jawa.

__Contoh cuplikan kode penggunaan:__
```pascal
uses Harijawa;
...
var
  hari, pasaran, wuku, paringkelan, tahun, windu: integer;
  jawa: TDinaJawa;
begin
  jawa := GetHariJawa(1, 1, 1949);
  hari := jawa.JawaDina;
  pasaran := jawa.JawaPasaran;
  wuku := jawa.JawaWuku;
  paringkelan := jawa.JawaParingkelan;
  tahun := jawa.JawaTahun;
  windu := jawa.JawaWindu;
end;
```
