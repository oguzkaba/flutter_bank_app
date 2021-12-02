import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_with_qr_controller.dart';

class TransferWithQrView extends GetView<TransferWithQrController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransferWithQrView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TransferWithQrView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
