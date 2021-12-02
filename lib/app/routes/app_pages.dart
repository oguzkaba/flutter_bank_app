import 'package:get/get.dart';

import 'package:flutter_bank_app/app/modules/deposit_money/bindings/deposit_money_binding.dart';
import 'package:flutter_bank_app/app/modules/deposit_money/views/deposit_money_view.dart';
import 'package:flutter_bank_app/app/modules/exchange/bindings/exchange_binding.dart';
import 'package:flutter_bank_app/app/modules/exchange/views/exchange_view.dart';
import 'package:flutter_bank_app/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_bank_app/app/modules/home/views/home_view.dart';
import 'package:flutter_bank_app/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_bank_app/app/modules/login/views/login_view.dart';
import 'package:flutter_bank_app/app/modules/nearest_bank/bindings/nearest_bank_binding.dart';
import 'package:flutter_bank_app/app/modules/nearest_bank/views/nearest_bank_view.dart';
import 'package:flutter_bank_app/app/modules/transfer_with_qr/bindings/transfer_with_qr_binding.dart';
import 'package:flutter_bank_app/app/modules/transfer_with_qr/views/transfer_with_qr_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT_MONEY,
      page: () => DepositMoneyView(),
      binding: DepositMoneyBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER_WITH_QR,
      page: () => TransferWithQrView(),
      binding: TransferWithQrBinding(),
    ),
    GetPage(
      name: _Paths.EXCHANGE,
      page: () => ExchangeView(),
      binding: ExchangeBinding(),
    ),
    GetPage(
      name: _Paths.NEAREST_BANK,
      page: () => NearestBankView(),
      binding: NearestBankBinding(),
    ),
  ];
}
