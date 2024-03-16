import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Beranda'),
      //   centerTitle: true,
      // ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Beranda',
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
                      // Navigasi ke halaman pencarian ketika ikon ditekan
                      Get.toNamed(Routes.BOOK); // Pastikan Anda memiliki rute bernama 'SEARCH' dalam AppPages
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20), // Tambahkan padding di sini
                      child: Text(
                        'Informasi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Menambahkan border radius
                    child: Container(
                      margin: EdgeInsets.all(10), // Menambahkan margin
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Warna border
                          width: 1, // Ketebalan border
                        ),
                        borderRadius: BorderRadius.circular(10), // Border radius untuk container
                      ),
                      child: AnotherCarousel(
                        images: const [
                          AssetImage("assets/img/Info-1.png"),
                          AssetImage("assets/img/Info-2.png"),
                          AssetImage("assets/img/Info-3.png"),
                        ],
                        dotSize: 6,
                        indicatorBgPadding: 5.0,
                        // Menyesuaikan latar belakang carousel
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),

      bottomNavigationBar: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller){
          return BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            currentIndex: controller.selectedIndex,
            onTap: (index){
              controller.changePage(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Beranda'
              ),
              BottomNavigationBarItem(icon: Icon(Icons.book),
              label: 'Buku'
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person),
              label: 'Profile'
              ),
            ],

          );
        },
      ),
    );
  }
}
