/// data : {"bukuid":1,"judul_buku":"Rickey","penulis":"Krystina","penerbit":"Dewitt","tahun_terbit":1974,"created_at":"2024-02-29T05:33:24.000000Z","updated_at":"2024-02-29T05:33:24.000000Z"}

class ResponseBukuView {
  ResponseBukuView({
    this.data,});

  ResponseBukuView.fromJson(dynamic json) {
    data = json['data'] != null ? DataBukuView.fromJson(json['data']) : null;
  }
  DataBukuView? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// bukuid : 1
/// judul_buku : "Rickey"
/// penulis : "Krystina"
/// penerbit : "Dewitt"
/// tahun_terbit : 1974
/// created_at : "2024-02-29T05:33:24.000000Z"
/// updated_at : "2024-02-29T05:33:24.000000Z"

class DataBukuView {
  DataBukuView({
    this.bukuid,
    this.judulBuku,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.createdAt,
    this.updatedAt,});

  DataBukuView.fromJson(dynamic json) {
    bukuid = json['bukuid'];
    judulBuku = json['judul_buku'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? bukuid;
  String? judulBuku;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bukuid'] = bukuid;
    map['judul_buku'] = judulBuku;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}