import 'package:get/get.dart';

import '../controllers/exchange_controller.dart';

class ExchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExchangeController>(
      () => ExchangeController(),
    );
  }
}
