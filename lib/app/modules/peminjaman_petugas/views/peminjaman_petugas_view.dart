import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/widget/base64/base64widget.dart';

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
      body:SingleChildScrollView(
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "${state[index].bukus?.judul}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff009E60)
                                ),
                              ),
                              Text(
                                "Peminjam : ${state[index].users?.username}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff009E60)
                                ),
                              ),
                              Text(
                                "Tanggal Peminjaman  : ${state[index]?.tanggalPeminjaman}",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "Tanggal Pengembalian   : ${state[index]?.tanggalPengembalian}",
                                style: TextStyle(fontSize: 12),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // controller.delete(state[index].bukuID).then((value) {
                                        //   if (value) {
                                        //     // Refresh the list after successful deletion
                                        //     controller.getData();
                                        //   }
                                        // });
                                      },
                                      child: Text(
                                        'Ditolak'
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffB54040)), // Ubah warna latar belakang
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                                        minimumSize: MaterialStateProperty.all<Size>(Size(20.0, 35.0)), // Mengatur tinggi minimum
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    ElevatedButton(
                                      onPressed: () {
                                        // controller.delete(state[index].bukuID).then((value) {
                                        //   if (value) {
                                        //     // Refresh the list after successful deletion
                                        //     controller.getData();
                                        //   }
                                        // });
                                      },
                                      child: Text(
                                          'Diterima'
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009E60)), // Ubah warna latar belakang
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                                        minimumSize: MaterialStateProperty.all<Size>(Size(20.0, 35.0)), // Mengatur tinggi minimum
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                    ),
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
    );
  }
}
