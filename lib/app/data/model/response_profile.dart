/// data : {"UserID":1,"Username":"eganaww","Email":"egaku@example.com","Password":"$2y$12$QCcMblEsHQf/eMRe9PhR5Oh3OrwZpP.oKQKNi5rMlnuod9X1OwXFS","NamaLengkap":"Ega Naww","Alamat":"Surakarta","Role":"user","created_at":"2024-03-28T00:36:36.000000Z","updated_at":"2024-03-28T00:36:36.000000Z"}

class ResponseProfile {
  ResponseProfile({
      this.data,});

  ResponseProfile.fromJson(dynamic json) {
    data = json['data'] != null ? DataProfile.fromJson(json['data']) : null;
  }
  DataProfile? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// UserID : 1
/// Username : "eganaww"
/// Email : "egaku@example.com"
/// Password : "$2y$12$QCcMblEsHQf/eMRe9PhR5Oh3OrwZpP.oKQKNi5rMlnuod9X1OwXFS"
/// NamaLengkap : "Ega Naww"
/// Alamat : "Surakarta"
/// Role : "user"
/// created_at : "2024-03-28T00:36:36.000000Z"
/// updated_at : "2024-03-28T00:36:36.000000Z"

class DataProfile {
  DataProfile({
      this.userID, 
      this.username, 
      this.email, 
      this.password, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  DataProfile.fromJson(dynamic json) {
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