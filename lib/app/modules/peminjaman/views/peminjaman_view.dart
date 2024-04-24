import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/widget/base64/base64widget.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: controller.obx((state) => ListView.separated(
            shrinkWrap: true, // Agar ListView hanya memakan ruang yang diperlukan
            physics: NeverScrollableScrollPhysics(), // Agar ListView tidak bisa di-scroll
            itemCount: state!.length,
            itemBuilder: (context, index){
              return InkWell(

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
                                child: state[index].bukus?.cover == 'NONE'
                                    ? Image.asset('assets/img/not-found.png')  // Ganti dengan gambar not-found.png
                                    : Image(image: base64widget(state[index].bukus?.cover??''))
                            ), // Ubah dari base64 menjadi Image.memory
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "${state[index].bukus?.judul}",
                                ),
                                Text(
                                  "Penerbit  : ${state[index].bukus?.penulis}",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Penerbit   : ${state[index].bukus?.penerbit}",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // isi disini
                                        },
                                        child: Text(state[index]?.statusPeminjaman??''),
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
        )
    );
  }
}
