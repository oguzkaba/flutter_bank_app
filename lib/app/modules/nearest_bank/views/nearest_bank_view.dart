import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nearest_bank_controller.dart';

class NearestBankView extends GetView<NearestBankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NearestBankView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NearestBankView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
