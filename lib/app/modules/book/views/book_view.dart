import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${state[index].judul}"),
              subtitle: Text("Penulis ${state[index].penulis}"),
              trailing: ElevatedButton(
                child: Text("Pinjam"),
                onPressed: ()=> Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                  'id': (state[index].bukuID??0).toString(),
                  'judul': state[index].judul??"-",
                }),
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        ),
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
