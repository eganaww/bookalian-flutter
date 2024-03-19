/// data : {"BukuID":1,"Judul":"Anak-Anak Revolusi","Penulis":"Budiman Sudjatmiko","Penerbit":"Gramedia","TahunTerbit":2013,"Cover":null,"created_at":"2024-03-10T06:41:47.000000Z","updated_at":"2024-03-10T06:41:47.000000Z"}

class ResponseBookView {
  ResponseBookView({
      this.data,});

  ResponseBookView.fromJson(dynamic json) {
    data = json['data'] != null ? DataBookView.fromJson(json['data']) : null;
  }
  DataBookView? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// BukuID : 1
/// Judul : "Anak-Anak Revolusi"
/// Penulis : "Budiman Sudjatmiko"
/// Penerbit : "Gramedia"
/// TahunTerbit : 2013
/// Cover : null
/// created_at : "2024-03-10T06:41:47.000000Z"
/// updated_at : "2024-03-10T06:41:47.000000Z"

class DataBookView {
  DataBookView({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.cover, 
      this.createdAt, 
      this.updatedAt,});

  DataBookView.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    cover = json['Cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  dynamic cover;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['Cover'] = cover;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}