import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  int selectedIndex = 2;
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

}
