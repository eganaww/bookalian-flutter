class Endpoint {
  // static const String baseUrlApi = "https://api-perpustakaan.abadjayasenantiasa.com/api/v1/user/";
  // static const String baseUrlApi = "http://10.0.2.2:8000/api/";
  // Untuk Emulator
    static const String baseUrlApi = "http://localhost:8000/api/"; // Untuk Chrome
    // static const String baseUrlApi = "http://192.168.5.50:8000/api/";



  static const String register = "${baseUrlApi}register";
  static const String login = "${baseUrlApi}login";
  static const String koleksi = "${baseUrlApi}koleksi";
  static const String peminjaman = "${baseUrlApi}peminjaman";
  static const String buku = "${baseUrlApi}buku";
  static const String kategoriRelasi = "${baseUrlApi}kategoribukurelasi";
  static const String dashboard = "${baseUrlApi}dashboard";
  static const String user = "${baseUrlApi}user";

}
