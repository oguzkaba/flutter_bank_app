import 'package:get/get.dart';

import '../controllers/deposit_money_controller.dart';

class DepositMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepositMoneyController>(
      () => DepositMoneyController(),
    );
  }
}
