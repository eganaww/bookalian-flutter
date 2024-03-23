/// data : {"BukuID":1,"Judul":"Anak-Anak Revolusi","Penulis":"Budiman Sudjatmiko","Penerbit":"Gramedia","TahunTerbit":2013,"Cover":null,"created_at":"2024-03-10T06:41:47.000000Z","updated_at":"2024-03-10T06:41:47.000000Z","ulasan_bukus":[{"UlasanID":1,"BukuID":1,"UserID":1,"Ulasan":"Wah buku ini jelek!","Rating":1,"created_at":"2024-03-22T02:32:25.000000Z","updated_at":"2024-03-22T02:32:25.000000Z"}],"users":[{"UserID":1,"Username":"eganaww","Email":"egakiw@gmail.com","Password":"$2y$12$GyRP9yRIqZvKj6zeeG6Kmuvd/cshujyKBvuyL89HI44qlg9Q6ariK","NamaLengkap":"Ega Nawwarasa H","Alamat":"Surakarta","Role":"user","created_at":"2024-03-10T06:41:38.000000Z","updated_at":"2024-03-10T06:41:38.000000Z"}]}

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
/// ulasan_bukus : [{"UlasanID":1,"BukuID":1,"UserID":1,"Ulasan":"Wah buku ini jelek!","Rating":1,"created_at":"2024-03-22T02:32:25.000000Z","updated_at":"2024-03-22T02:32:25.000000Z"}]
/// users : [{"UserID":1,"Username":"eganaww","Email":"egakiw@gmail.com","Password":"$2y$12$GyRP9yRIqZvKj6zeeG6Kmuvd/cshujyKBvuyL89HI44qlg9Q6ariK","NamaLengkap":"Ega Nawwarasa H","Alamat":"Surakarta","Role":"user","created_at":"2024-03-10T06:41:38.000000Z","updated_at":"2024-03-10T06:41:38.000000Z"}]

class DataBookView {
  DataBookView({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.cover, 
      this.createdAt, 
      this.updatedAt, 
      this.ulasanBukus, 
      this.users,});

  DataBookView.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    cover = json['Cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ulasan_bukus'] != null) {
      ulasanBukus = [];
      json['ulasan_bukus'].forEach((v) {
        ulasanBukus?.add(UlasanBukus.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  dynamic cover;
  String? createdAt;
  String? updatedAt;
  List<UlasanBukus>? ulasanBukus;
  List<Users>? users;

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
    if (ulasanBukus != null) {
      map['ulasan_bukus'] = ulasanBukus?.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UserID : 1
/// Username : "eganaww"
/// Email : "egakiw@gmail.com"
/// Password : "$2y$12$GyRP9yRIqZvKj6zeeG6Kmuvd/cshujyKBvuyL89HI44qlg9Q6ariK"
/// NamaLengkap : "Ega Nawwarasa H"
/// Alamat : "Surakarta"
/// Role : "user"
/// created_at : "2024-03-10T06:41:38.000000Z"
/// updated_at : "2024-03-10T06:41:38.000000Z"

class Users {
  Users({
      this.userID, 
      this.username, 
      this.email, 
      this.password, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  Users.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    email = json['Email'];
    password = json['Password'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['Role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? userID;
  String? username;
  String? email;
  String? password;
  String? namaLengkap;
  String? alamat;
  String? role;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Username'] = username;
    map['Email'] = email;
    map['Password'] = password;
    map['NamaLengkap'] = namaLengkap;
    map['Alamat'] = alamat;
    map['Role'] = role;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// UlasanID : 1
/// BukuID : 1
/// UserID : 1
/// Ulasan : "Wah buku ini jelek!"
/// Rating : 1
/// created_at : "2024-03-22T02:32:25.000000Z"
/// updated_at : "2024-03-22T02:32:25.000000Z"

class UlasanBukus {
  UlasanBukus({
      this.ulasanID, 
      this.bukuID, 
      this.userID, 
      this.ulasan, 
      this.rating, 
      this.createdAt, 
      this.updatedAt,});

  UlasanBukus.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    bukuID = json['BukuID'];
    userID = json['UserID'];
    ulasan = json['Ulasan'];
    rating = json['Rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? ulasanID;
  int? bukuID;
  int? userID;
  String? ulasan;
  int? rating;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['BukuID'] = bukuID;
    map['UserID'] = userID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}