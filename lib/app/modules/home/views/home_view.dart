import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        centerTitle: true,
      ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                  ElevatedButton(
                      onPressed: (){Get.toNamed(Routes.BOOK);}, child: const Text("Buku")),
                  ElevatedButton(onPressed: (){Get.toNamed(Routes.PEMINJAMAN);}, child: const Text('Peminjaman')),
                ],
              ),
            )
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
