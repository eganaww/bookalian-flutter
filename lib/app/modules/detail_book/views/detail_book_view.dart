import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_book_controller.dart';

class DetailBookView extends GetView<DetailBookController> {
  const DetailBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBookView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
