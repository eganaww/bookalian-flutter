// BookView.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/widget/base64/base64widget.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
        Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Buku',
                style: TextStyle(
                  color: Color(0xff009E60),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.green),
              onPressed: () {
                Get.toNamed(Routes.SEARCH); // Navigasi ke halaman pencarian
              },
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Rekomendasi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
      Container(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.obx((state) => ListView.builder(
            itemCount: state?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigasi ke halaman detail buku dengan mengirim parameter yang diperlukan
                  Get.toNamed(
                    Routes.DETAIL_BOOK,
                    parameters: {
                      'id': state![index].bukuID.toString(),
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            base64widget(state![index].cover ?? ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        state[index].judul ?? '',
                        style: TextStyle(
                            fontSize: 12, color: Colors.black),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ),
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Pelajaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
      Container(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.obx((state) => ListView.builder(
            itemCount: state?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigasi ke halaman detail buku dengan mengirim parameter yang diperlukan
                  Get.toNamed(
                    Routes.DETAIL_BOOK,
                    parameters: {
                      'id': state![index].bukuID.toString(),
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            base64widget(state![index].cover ?? ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        state[index].judul ?? '',
                        style: TextStyle(
                            fontSize: 12, color: Colors.black),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ),
      ),

          // controller.obx((state) => ListView.builder(
          //       itemCount: state?.length,
          //       scrollDirection: Axis.vertical,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           child: Column(
          //             children: [
          //               Text(state[index].kategori_bukus.namaKategori),
          //               Container(
          //                 height: 240,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: controller.obx((state) => ListView.builder(
          //                     itemCount: state?.length,
          //                     scrollDirection: Axis.horizontal,
          //                     itemBuilder: (context, index) {
          //                       return InkWell(
          //                         onTap: () {
          //                           // Navigasi ke halaman detail buku dengan mengirim parameter yang diperlukan
          //                           Get.toNamed(
          //                             Routes.DETAIL_BOOK,
          //                             parameters: {
          //                               'id': state![index].bukuID.toString(),
          //                             },
          //                           );
          //                         },
          //                         child: Container(
          //                           margin: const EdgeInsets.only(right: 10),
          //                           child: Column(
          //                             children: [
          //                               Container(
          //                                 width: 120,
          //                                 height: 200,
          //                                 decoration: BoxDecoration(
          //                                   image: DecorationImage(
          //                                     image:
          //                                     base64widget(state![index].cover ?? ''),
          //                                     fit: BoxFit.cover,
          //                                   ),
          //                                   borderRadius: BorderRadius.circular(10),
          //                                   color: Colors.white,
          //                                 ),
          //                               ),
          //                               Text(
          //                                 state[index].judul ?? '',
          //                                 style: TextStyle(
          //                                     fontSize: 12, color: Colors.black),
          //                               )
          //                             ],
          //                           ),
          //                         ),
          //                       );
          //                     },
          //                   )),
          //                 ),
          //               )
          //             ],
          //           ),
          //         );
          //       },
          //     ))
        ],
      ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            currentIndex: controller.selectedIndex,
            onTap: (index) {
              controller.changePage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Buku',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
