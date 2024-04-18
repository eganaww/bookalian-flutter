import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff34A5D5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white), textAlign: TextAlign.left,),
                            Text('Buku   ', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left,)
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.book,
                              size: 57,
                              color: Color(0xff264870),// Ubah ukuran ikon sesuai kebutuhan
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffD53495),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white), textAlign: TextAlign.left,),
                            Text('User   ', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left,)
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.supervisor_account_rounded,
                              size: 57,
                              color: Color(0xff751C51),// Ubah ukuran ikon sesuai kebutuhan
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffF6C71D),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white), textAlign: TextAlign.left,),
                            Text('Selesai', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left,)
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.verified,
                              size: 57,
                              color: Color(0xff866B0C),// Ubah ukuran ikon sesuai kebutuhan
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff34D54E),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white), textAlign: TextAlign.left,),
                            Text('Pinjam', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left,)
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.featured_play_list_rounded,
                              size: 57,
                              color: Color(0xff196E27),// Ubah ukuran ikon sesuai kebutuhan
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff5D5D5D),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white), textAlign: TextAlign.left,),
                            Text('Ditunda', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left,)
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.timelapse,
                              size: 57,
                              color: Color(0xff2D2D2D),// Ubah ukuran ikon sesuai kebutuhan
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffD53434),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white), textAlign: TextAlign.left,),
                            Text('Ditolak', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left,)
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.dangerous,
                              size: 57,
                              color: Color(0xff841E1E),// Ubah ukuran ikon sesuai kebutuhan
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff009E60),
              ),
              child: Text(
                'Menu Petugas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                // Update UI based on item selected
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Buku'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Peminjaman'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Laporan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Add more ListTile widgets for additional items
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lakukan proses logout di sini
        },
        backgroundColor: Colors.red.shade800, // Warna background merah
        child: Text(
          'Logout',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
      ),
    );
  }
}
