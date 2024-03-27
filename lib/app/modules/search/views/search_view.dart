import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart' as SearchControllerr;

class SearchView extends GetView<SearchControllerr.SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kembali'),
      ),
      body:Center(
        child: Container(
          width: 420,
          child: Form(
            // key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Cari Buku',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  // controller: controller.tanggalPinjamController,
                  decoration:
                  InputDecoration(
                    hintText: "Masukkan Nama Buku",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff009E60),width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tanggal Pinjam tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                // Obx(() => controller.loading.value
                //     ? CircularProgressIndicator()
                //     : ElevatedButton(
                //   onPressed: () {
                //     controller.post();
                //   },
                //   child: Text("Cari"),
                //   style: ButtonStyle(
                //     backgroundColor:
                //     MaterialStateProperty.all<Color>(Color(0xff009E60)),
                //     foregroundColor:
                //     MaterialStateProperty.all<Color>(Colors.white),
                //   ),
                // ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
