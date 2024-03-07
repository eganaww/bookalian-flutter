import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: GetBuilder<ProfileController>(
        init: ProfileController(),
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
