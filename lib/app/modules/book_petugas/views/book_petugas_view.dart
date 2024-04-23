import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_petugas_controller.dart';

class BookPetugasView extends GetView<BookPetugasController> {
  const BookPetugasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookPetugasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookPetugasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
