import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),*/
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0, 0.3],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff2ECC71), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/Logo-apk.png', // Ganti dengan path menuju gambar logo
                  width: 300, // Sesuaikan dengan ukuran yang diinginkan
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Masuk",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                // Spasi antara gambar dan form
                Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            controller: controller.usernameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Username",
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            obscureText: true,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Password",
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        Obx(() => controller.loading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  controller.login();
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Color(0xff3BB765)), // Background hijau
                                ),
                                child: Text(
                                  "Masuk",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Tidak punya akun?"),
                              SizedBox(width: 10,),
                              GestureDetector(child: Text("Daftar Sekarang", style: TextStyle(
                                color: Color(0xff3BB765)
                              )), onTap: () {
                                Get.toNamed(Routes.REGISTER);
                              },),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
