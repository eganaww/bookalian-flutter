import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_book_view.dart';

import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';

class DetailBookController extends GetxController with StateMixin<DataBookView> {
  //TODO: Implement DetailBookController

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

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    var idBuku = Get.parameters['id'];
    print(idBuku);
    try {
      final response = await ApiProvider.instance().get("${Endpoint.buku}/$idBuku");
      if (response.statusCode == 200) {
        final ResponseBookView responseBook = ResponseBookView.fromJson(response.data);
        if(responseBook.data == null){
          change(null, status:  RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }

    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
