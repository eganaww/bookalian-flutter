import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  const InvoiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('InvoiceView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("Anda Berhasil",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Mengajukan Peminjaman!",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/img/Ilustrasi_2.png', // Ganti dengan path gambar Anda
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                  boxShadow: [
                    BoxShadow(offset: Offset(1,1),blurStyle: BlurStyle.normal, blurRadius: 5, color: Colors.grey),
                  ]
                ),
                height: 210,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
                      child: Center(child: Text("Bukti Peminjaman", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                    ),
                    Container(padding: EdgeInsets.all(10),
                      height: 150,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Nama Peminjam"),
                              Text(Get.parameters['nama']??''),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Judul Buku"),
                              Text(Get.parameters['judul']??''),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tanggal Peminjaman"),
                              Text(Get.parameters['tgl_peminjaman']??''),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tanggal Pengembalian"),
                              Text(Get.parameters['tgl_pengembalian']??''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text("Mohon Pergi ke Perpustakaan untuk",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("verifikasi ulang.",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ElevatedButton(onPressed: () {
                Get.offAllNamed(Routes.BOOK);
              }, child: Text('Kembali', style: TextStyle(color: Colors.white),
              ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff009E60), // Warna latar belakang
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
