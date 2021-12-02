import 'package:flutter/material.dart';
import 'package:flutter_bank_app/app/constants.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('home page'))));
  }
}
