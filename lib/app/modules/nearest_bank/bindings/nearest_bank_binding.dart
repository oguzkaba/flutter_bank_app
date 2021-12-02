import 'package:get/get.dart';

import '../controllers/nearest_bank_controller.dart';

class NearestBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearestBankController>(
      () => NearestBankController(),
    );
  }
}
