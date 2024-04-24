import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            color: Color(0xff009E60),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset('assets/img/icon-profile.png'),
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: controller.obx((state) => Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Lengkap',
                            style: TextStyle(
                                color: Color(0xff009E60),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${state?.namaLengkap}',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                                color: Color(0xff009E60),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${state?.username}',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-Mail',
                            style: TextStyle(
                                color: Color(0xff009E60),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${state?.email}',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alamat',
                            style: TextStyle(
                                color: Color(0xff009E60),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${state?.alamat}',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ],
            ),)
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<ProfileController>(
        init: ProfileController(),
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Buku'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
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
