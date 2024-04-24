import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';
import 'package:quickalert/quickalert.dart';

class BookPetugasController extends GetxController with StateMixin<List<DataBuku>>{
  //TODO: Implement BookPetugasController
  String role = StorageProvider.read(StorageKey.Role);

  final loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> refreshData() async {
    change(null, status: RxStatus.loading());
    await getData();
  }

  delete(int? bukuID) async {
    try {
      final response = await ApiProvider.instance().delete("${Endpoint.buku}/$bukuID");
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.confirm,
          title: 'Hapus Buku?',
          confirmBtnText: 'Ya',
          cancelBtnText: 'Tidak',
          onConfirmBtnTap: () {
            Get.back();
            if (response.statusCode == 200) {
              getData();
              QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.success,
                confirmBtnText: 'Ok',
                title: 'Berhasil',
                text: 'Berhasil Menghapus Buku',
                titleColor: Colors.green,
              );
            } else {
              QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.error,
                confirmBtnText: 'Ok',
                title: 'Gagal',
                text: 'Gagal Menghapus Koleksi',
                titleColor: Colors.red,
              );
            }
          }
      );
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response =
      await ApiProvider.instance().get(Endpoint.buku);
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data buku"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
