//Created by: Arif Budiarto
unit HariJawa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics,
Controls, Math;

type
  TDinaJawa = record
    JawaWindu : string;
    JawaTahun : string;
    JawaDina  : string;
    JawaPasaran : string;
    JawaWuku : string;
    JawaParingkelan : string;
  end;

function GetHariJawa(var DJawa, MJawa, YJawa: integer):TDinaJawa;

implementation

function GetHariJawa(var DJawa, MJawa, YJawa: integer):TDinaJawa;
var
  tahun : integer;
  windu, neptuDina, masaWuku, wuku : integer;
const
  arrWuku : array[0..29] of string =('Sinta','Landêp','Wukir',
            'Kurantil','Tolu','Gumbrêg',
            'Warigalit','Warigagung','Julungwangi',
            'Sungsang','Galungan','Kuningan',
            'Langkir','Mandhasiya','Julungpujud',
            'Pahang','Kuruwêlut','Marakèh',
            'Tambir','Mêdhangkungan','Maktal',
            'Wuye','Manahil','Prangbakat',
            'Bala','Wugu','Wayang',
            'Kulawu','Dhukut','Watugunung');
  arrParingkelan : array[0..5] of string = ('Tungle','Aryang','Warukung','Paningron','Uwas','Mawulu');
  arrWindu : array[0..3] of string = ('Sancaya','Adi','Kunthara','Sangara');
  nmWindu : array[0..3] of integer = (3,12,9,6);
  arrTahun : array[0..7] of string = ('Be','Wawu','Jimakir','Alip','He','Jimawal','Je','Dal');
  nmTahun : array[0..7] of integer = (3,1,11,0,10,9,7,5);
  ndTahun : array[0..7] of integer = (16,20,24,29,33,3,7,11);
  nmSasi : array[0..11] of integer = (0,0,1,2,3,4,5,5,6,7,8,9);
  ndSasi : array[0..11] of integer = (0,30,24,19,13,8,2,32,26,21,15,10);
  arrNeptuTahunA : array[0..7] of integer = (2,6,3,1,5,3,7,4);
  arrNeptuTahunB : array[0..7] of integer = (7,1,5,5,9,4,3,2);
  arrNeptuSasiA : array[0..11] of integer = (7,2,3,5,6,1,2,4,5,7,1,3);
  arrNeptuSasiB : array[0..11] of integer = (5,5,9,9,3,3,2,2,1,1,5,5);
  arrPasaran : array[0..4] of string = ('Wage','Kliwon','Legi','Pahing','Pon');
  arrDina : array[0..6] of string = ('Selasa', 'Rebo', 'Kemis','Jemuwah', 'Setu', 'Ngahad', 'Senen');
begin
  windu := ((strtoint(edTahun.Text)-2) mod 32) div 8;
  
  tahun := strtoint(edTahun.Text) mod 8;
  
  dina := (arrNeptuTahunA[tahun] + arrNeptuSasiA[comboSasi.ItemIndex] - 2 + strtoint(edTanggal.Text)) mod 7;
  
  neptuDina := ndTahun[tahun] + ndSasi[comboSasi.ItemIndex] + strtoInt(edTanggal.Text) - 1;
  masaWuku := nmWindu[windu] + nmTahun[tahun] + nmSasi[comboSasi.ItemIndex] + (neptuDina div 35);
  masaWuku := masaWuku mod 12;
  neptuDina := neptuDina mod 35;
  wuku := (masaWuku * 5 + (neptuDina + 1) div 7 + 8)mod 30;
  
  result.JawaWindu := arrWindu[windu];
  result.JawaTahun := arrTahun[tahun];
  result.JawaDina  := arrDina[dina];
  result.JawaPasaran := arrPasaran[(arrNeptuTahunB[tahun] + arrNeptuSasiB[comboSasi.ItemIndex] - 2 + strtoint(edTanggal.Text)) mod 5];
  result.JawaWuku := arrWuku[wuku];
  result.JawaParingkelan := arrParingkelan[wuku mod 6];
 end;

end.
