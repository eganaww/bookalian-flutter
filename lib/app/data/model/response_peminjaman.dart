/// data : [{"PeminjamanID":1,"BukuID":1,"UserID":1,"TanggalPeminjaman":"2024-02-01","TanggalPengembalian":"2024-02-02","StatusPeminjaman":"ditunda","created_at":"2024-03-16T14:33:46.000000Z","updated_at":"2024-03-16T14:33:46.000000Z","bukus":null,"users":null}]

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }
  List<DataPinjam>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// PeminjamanID : 1
/// BukuID : 1
/// UserID : 1
/// TanggalPeminjaman : "2024-02-01"
/// TanggalPengembalian : "2024-02-02"
/// StatusPeminjaman : "ditunda"
/// created_at : "2024-03-16T14:33:46.000000Z"
/// updated_at : "2024-03-16T14:33:46.000000Z"
/// bukus : null
/// users : null

class DataPinjam {
  DataPinjam({
      this.peminjamanID, 
      this.bukuID, 
      this.userID, 
      this.tanggalPeminjaman, 
      this.tanggalPengembalian, 
      this.statusPeminjaman, 
      this.createdAt, 
      this.updatedAt, 
      this.bukus, 
      this.users,});

  DataPinjam.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    bukuID = json['BukuID'];
    userID = json['UserID'];
    tanggalPeminjaman = json['TanggalPeminjaman'];
    tanggalPengembalian = json['TanggalPengembalian'];
    statusPeminjaman = json['StatusPeminjaman'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bukus = json['bukus'];
    users = json['users'];
  }
  int? peminjamanID;
  int? bukuID;
  int? userID;
  String? tanggalPeminjaman;
  String? tanggalPengembalian;
  String? statusPeminjaman;
  String? createdAt;
  String? updatedAt;
  dynamic bukus;
  dynamic users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['BukuID'] = bukuID;
    map['UserID'] = userID;
    map['TanggalPeminjaman'] = tanggalPeminjaman;
    map['TanggalPengembalian'] = tanggalPengembalian;
    map['StatusPeminjaman'] = statusPeminjaman;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['bukus'] = bukus;
    map['users'] = users;
    return map;
  }

}