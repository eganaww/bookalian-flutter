import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController {
  //TODO: Implement AddPeminjamanController
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalPinjamController = TextEditingController();
  final TextEditingController tanggalKembaliController =
      TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formKey.currentState!.validate()) {
        final response =
            await ApiProvider.instance().post(Endpoint.pinjam, data: {
          "UserID": int.parse(StorageProvider.read(StorageKey.UserID)),
          "BukuID": int.parse(Get.parameters['id'].toString()),
          "TanggalPeminjaman": tanggalPinjamController.text.toString(),
          "TanggalPengembalian": tanggalKembaliController.text.toString()
        });
        log("Response API$response");
        if (response.statusCode == 200) {
          Get.offAllNamed(Routes.INVOICE, parameters: {
            'judul': Get.parameters['judul']??'',
            'nama': StorageProvider.read(StorageKey.UserName),
            'tgl_peminjaman': tanggalPinjamController.text.toString(),
            'tgl_pengembalian': tanggalKembaliController.text.toString(),
          });
        } else {
          Get.snackbar("Sorry", "Anda gagal meminjam buku",
              backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
