/// message : "Login Successfully"
/// data : {"UserID":1,"Username":"egaismine","Email":"nonoyaega@gmail.com","Password":"$2y$12$fWIFvDntDirSa20Z5IlPl.qWe1th4yl6zCOcaVhlO94jeSF7R25OO","NamaLengkap":"Ega Naww","Alamat":"Surakarta","Role":"user","created_at":"2024-03-04T06:28:14.000000Z","updated_at":"2024-03-04T06:28:14.000000Z"}

class ResponseLogin {
  ResponseLogin({
      this.message, 
      this.data,});

  ResponseLogin.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
  }
  String? message;
  DataLogin? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// UserID : 1
/// Username : "egaismine"
/// Email : "nonoyaega@gmail.com"
/// Password : "$2y$12$fWIFvDntDirSa20Z5IlPl.qWe1th4yl6zCOcaVhlO94jeSF7R25OO"
/// NamaLengkap : "Ega Naww"
/// Alamat : "Surakarta"
/// Role : "user"
/// created_at : "2024-03-04T06:28:14.000000Z"
/// updated_at : "2024-03-04T06:28:14.000000Z"

class DataLogin {
  DataLogin({
      this.userID, 
      this.username, 
      this.email, 
      this.password, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  DataLogin.fromJson(dynamic json) {
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