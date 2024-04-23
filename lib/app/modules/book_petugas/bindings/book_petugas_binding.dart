import 'package:get/get.dart';

import '../controllers/book_petugas_controller.dart';

class BookPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookPetugasController>(
      () => BookPetugasController(),
    );
  }
}
