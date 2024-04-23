import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_petugas_controller.dart';

class PeminjamanPetugasView extends GetView<PeminjamanPetugasController> {
  const PeminjamanPetugasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanPetugasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PeminjamanPetugasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
