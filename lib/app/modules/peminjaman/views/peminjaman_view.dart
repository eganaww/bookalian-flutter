import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_peminjaman.dart';

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
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            DataPinjam dataPinjam = state[index];
            return ListTile(
              title: Text("Peminjaman"),
              subtitle: Text("Buku: ${dataPinjam.bukus?.judul}\nTanggal Pinjam: ${dataPinjam.tanggalPeminjaman}\nTanggal Kembali: ${dataPinjam.tanggalPengembalian}\nStatus: ${dataPinjam.statusPeminjaman} "),
            );
          },
          separatorBuilder: (context,index)=> Divider(),
        ))
    );
  }
}
