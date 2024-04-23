import 'package:get/get.dart';

import '../controllers/peminjaman_petugas_controller.dart';

class PeminjamanPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanPetugasController>(
      () => PeminjamanPetugasController(),
    );
  }
}
