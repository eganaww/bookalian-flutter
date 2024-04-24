import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_peminjaman.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';

class PeminjamanPetugasController extends GetxController with StateMixin<List<DataPinjam>> {
  //TODO: Implement PeminjamanPetugasController


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
    try{
      final response = await ApiProvider.instance().get(Endpoint.peminjaman);
      if (response.statusCode == 200) {
        final ResponsePeminjaman responsePeminjaman = ResponsePeminjaman.fromJson(response.data);
        if(responsePeminjaman.data!.isEmpty){
          change(null, status: RxStatus.empty());
        } else {
          change(responsePeminjaman.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data peminjaman"));
      }

    } on DioException catch (e) {
      if(e.response != null) {
        if(e.response?.data != null){
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
