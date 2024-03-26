import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
        foregroundColor: Color(0xff009E60),
      ),
      body: Center(
        child: Container(
          width: 420,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Form Pinjam Buku',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.tanggalPinjamController,
                  decoration:
                      InputDecoration(
                        hintText: "Masukkan Tanggal Pinjam",
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
                TextFormField(
                  controller: controller.tanggalKembaliController,
                  decoration:
                      InputDecoration(
                        hintText: "Masukkan Tanggal Kembali",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff009E60),width: 2),
                        ),
                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tanggal Kembali tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          controller.post();
                        },
                        child: Text("Pinjam"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xff009E60)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
