import 'package:get/get.dart';

import '../controllers/transfer_with_qr_controller.dart';

class TransferWithQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferWithQrController>(
      () => TransferWithQrController(),
    );
  }
}
