import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_peminjaman_user.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPeminjamanUser>> {
  //TODO: Implement PeminjamanController

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


  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.peminjaman+"/${StorageProvider.read(StorageKey.UserID)}" );
      if (response.statusCode == 200) {
        final ResponsePeminjamanUser responsePinjam = ResponsePeminjamanUser.fromJson(response.data);
        if (responsePinjam.data!. isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(response.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        } else {
          change(null, status: RxStatus.error("Sorry ${e.response?.statusMessage}"));
        }
      } else {
        change(null, status: RxStatus.error("Sorry ${e.message}"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
