import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_profile.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

class ProfileController extends GetxController with StateMixin<DataProfile> {
  //TODO: Implement ProfileController

  final count = 0.obs;
  int selectedIndex = 2;
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

  void logout() {
    StorageProvider.clearAll();
    Get.offAllNamed(Routes.LOGIN);
  }

  void changePage(int index){
    selectedIndex = index;
    update();
    switch(index) {
      case 0 :
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


  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    var idUser = StorageProvider.read(StorageKey.UserID);
    print(idUser);
    try {
      final response = await ApiProvider.instance().get("${Endpoint.user}/$idUser");
      if (response.statusCode == 200) {
        final ResponseProfile responseBook = ResponseProfile.fromJson(response.data);
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
