/// message : "Buku found successfully"
/// total : 1
/// data : [{"BukuID":1,"Judul":"Anak-Anak Revolusi","Penulis":"Budiman Sudjatmiko","Penerbit":"Gramedia","TahunTerbit":2013,"Cover":"NONE","created_at":"2024-03-10T06:41:47.000000Z","updated_at":"2024-03-10T06:41:47.000000Z"}]

class ResponseBook {
  ResponseBook({
      this.message, 
      this.total, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataBuku>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 1
/// Judul : "Anak-Anak Revolusi"
/// Penulis : "Budiman Sudjatmiko"
/// Penerbit : "Gramedia"
/// TahunTerbit : 2013
/// Cover : "NONE"
/// created_at : "2024-03-10T06:41:47.000000Z"
/// updated_at : "2024-03-10T06:41:47.000000Z"

class DataBuku {
  DataBuku({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.cover, 
      this.createdAt, 
      this.updatedAt,});

  DataBuku.fromJson(dynamic json) {
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
  String? cover;
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