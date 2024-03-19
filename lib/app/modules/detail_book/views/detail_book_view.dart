// DetailBookView.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/widget/base64/base64widget.dart';

import '../controllers/detail_book_controller.dart';

class DetailBookView extends GetView<DetailBookController> {
  const DetailBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan nilai parameter dari BookView

    return controller.obx((state) => Scaffold(
          appBar: AppBar(
            title: Text(
                'Pinjam Buku ${state?.judul}'), // Menggunakan judul buku dari parameter
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar cover buku
                  Container(
                    width: 120,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: base64widget(state
                            ?.cover), // Menggunakan cover buku dari parameter
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(width: 16), // Spacer
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul Buku
                        Text(
                          state?.judul ?? '-',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // Spacer
                        // Nama Penulis
                        Text(
                          'Penulis: ${state?.penulis}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        // Nama Penerbit
                        Text(
                          'Penerbit: ${state?.penerbit}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 16), // Spacer
                        // Tombol Pinjam
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                              'id': state?.bukuID.toString()?? '',
                              'judul': state?.judul.toString() ?? '',
                            });
                          },
                          child: Text('Pinjam'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
