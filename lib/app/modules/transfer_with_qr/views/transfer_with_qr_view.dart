import 'package:flutter/material.dart';
import 'package:flutter_bank_app/app/common/elevated_button_widget.dart';
import 'package:flutter_bank_app/app/modules/transfer_with_qr/views/qr_code_scanner.dart';

import 'package:get/get.dart';

import '../controllers/transfer_with_qr_controller.dart';

class TransferWithQrView extends GetView<TransferWithQrController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRScannerWidget(),
          Positioned(
            child: AppBar(
              title: Text("QR ile öde"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
          ),
          Positioned(
              bottom: 20,
              left: Get.width * .1,
              child: ElevatedButtonWidget(
                  color: Colors.transparent,
                  title: 'Galeriden seçeceğim',
                  width: Get.width * .8,
                  tap: () {}))
        ],
      ),
    );
  }
}
