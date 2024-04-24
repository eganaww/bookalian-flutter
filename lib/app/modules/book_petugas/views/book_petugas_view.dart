import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/widget/base64/base64widget.dart';

import '../controllers/book_petugas_controller.dart';

class BookPetugasView extends GetView<BookPetugasController> {
  const BookPetugasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.offAllNamed(Routes.DASHBOARD);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: SingleChildScrollView(
          child: controller.obx((state) => ListView.separated(
            shrinkWrap: true, // Agar ListView hanya memakan ruang yang diperlukan
            physics: NeverScrollableScrollPhysics(), // Agar ListView tidak bisa di-scroll
            itemCount: state!.length,
            itemBuilder: (context, index){
              return InkWell(
                // onTap: () {
                //   Get.toNamed(Routes.DETAIL_BOOK,
                //       parameters: {
                //         'id': state[index].bukuID.toString(),
                //         'judul': state[index].judul ?? ' ',
                //       }
                //   );
                // },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    child: Container(
                      height: 175,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Container(
                            width: 75,
                            height: 100,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: state[index].cover == 'NONE'
                                  ? Image.asset('assets/img/not-found.png')  // Ganti dengan gambar not-found.png
                                  : Image(image: base64widget(state[index].cover!))
                            ), // Ubah dari base64 menjadi Image.memory
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "${state[index].judul}",
                                ),
                                Text(
                                  "Pengarang  : ${state[index].penulis}",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Penerbit   : ${state[index].penerbit}",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.delete(state[index].bukuID).then((value) {
                                            if (value) {
                                              // Refresh the list after successful deletion
                                              controller.getData();
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Ubah warna latar belakang
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                                          minimumSize: MaterialStateProperty.all<Size>(Size(20.0, 30.0)), // Mengatur tinggi minimum
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        backgroundColor: Colors.green.shade900, // Warna background merah
        child: Icon(Icons.add, color: Colors.white,)
    ),
    );

  }
}
