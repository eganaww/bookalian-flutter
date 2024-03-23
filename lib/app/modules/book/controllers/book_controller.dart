import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';

import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';

class BookController extends GetxController with StateMixin<List<DataBuku>> {
  //TODO: Implement BookController
  int selectedIndex = 1;

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

  void changePage(int index) {
    selectedIndex = index;
    update();
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.HOME);
        break;
      case 1:
        Get.offAllNamed(Routes.BOOK);
        break;
      case 2:
        Get.offAllNamed(Routes.PROFILE);
        break;
    }
  }

  // Future<void> getData(String endpoint) async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get(endpoint);
  //     if (response.statusCode == 200) {
  //       if (endpoint == Endpoint.buku) {
  //         final ResponseBook responseBook = ResponseBook.fromJson(response.data);
  //         if (responseBook.data!.isEmpty) {
  //           change(null, status: RxStatus.empty());
  //         } else {
  //           change(responseBook.data, status: RxStatus.success());
  //         }
  //       } else if (endpoint == Endpoint.kategoriRelasi) {
  //         final ResponseKategoriRelasi responseKategoriRelasi = ResponseKategoriRelasi.fromJson(response.data);
  //         if (responseKategoriRelasi.data!.isEmpty) {
  //           change(null, status: RxStatus.empty());
  //         } else {
  //           change(responseKategoriRelasi.data, status: RxStatus.success());
  //         }
  //       }
  //     } else {
  //       change(null, status: RxStatus.error("Gagal mengambil data"));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null,
  //             status: RxStatus.error("${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error(e.message ?? ""));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error(e.toString()));
  //   }
  // }

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
