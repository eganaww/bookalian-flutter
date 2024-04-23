import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_login.dart';
import 'dart:developer';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkLoginStatus(); // Memeriksa status login saat controller siap
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // Method untuk memeriksa status login dan navigasi sesuai keadaan
  void checkLoginStatus() async {
    String? status = await StorageProvider.read(StorageKey.status); // Mengambil status dari storage
    log("status : $status");
    if (status == "logged") {
      // Jika status adalah 'logged', navigasi ke halaman HOME atau DASHBOARD
      String? role = await StorageProvider.read(StorageKey.Role);
      if (role == 'user') {
        Get.offAllNamed(Routes.HOME); // Navigasi ke halaman HOME
      } else {
        Get.offAllNamed(Routes.DASHBOARD); // Navigasi ke halaman DASHBOARD
      }
    }
  }

  // Method untuk melakukan proses login
  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.login,
          data: {
            "Username": usernameController.text.toString(),
            "Password": passwordController.text.toString(),
          },
        );

        if (response.statusCode == 200) {
          ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(
            StorageKey.UserID,
            responseLogin.data!.userID!.toString(),
          );
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(
            StorageKey.UserName,
            responseLogin.data!.username.toString(),
          );
          await StorageProvider.write(
            StorageKey.Role,
            responseLogin.data!.role.toString(),
          );

          // Setelah login berhasil, navigasi ke halaman HOME atau DASHBOARD
          if (responseLogin.data!.role.toString() == 'user') {
            Get.offAllNamed(Routes.HOME); // Navigasi ke halaman HOME
          } else {
            Get.offAllNamed(Routes.DASHBOARD); // Navigasi ke halaman DASHBOARD
          }
        } else {
          Get.snackbar(
            "Sorry",
            "Login Gagal",
            backgroundColor: Colors.orange,
          );
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar(
            "Sorry",
            "${e.response?.data['message']}",
            backgroundColor: Colors.orange,
          );
        }
      } else {
        Get.snackbar(
          "Sorry",
          e.message ?? "",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      loading(false);
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}



