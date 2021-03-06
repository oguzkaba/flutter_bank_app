import 'package:flutter/material.dart';
import 'package:flutter_bank_app/app/common/elevated_button_widget.dart';
import 'package:flutter_bank_app/app/constants.dart';
import 'package:flutter_bank_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    TabController? tabController;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 20,
              elevation: 0,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              bottom: _tabBar(tabController)),
          body: TabBarView(
            children: [
              _tabview1(),
              Center(
                  child: Text(
                "1",
                style: TextStyle(fontSize: 40),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Column _tabview1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height * .07, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 0, color: Colors.grey, spreadRadius: 1)
                  ],
                ),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                    backgroundImage: NetworkImage(profileImage)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15),
              child: SizedBox(
                  width: 250,
                  child: Text(
                    '??yi g??nler O??uz',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  )),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Yoksa O??uz de??il misin?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryRed,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButtonWidget(
                width: Get.width * .62,
                title: 'Giri??',
                tap: () => Get.toNamed(Routes.HOME),
                textdec: TextDecoration.underline,
              ),
            ),
          ]),
        ),
        Expanded(
          child: Container(
            height: Get.height * .22,
            width: double.infinity,
            color: primaryRed,
            child: Column(
              children: [
                Expanded(
                    flex: 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var i = 0; i < circleTextList.length; i++)
                          _bottomCircleIcon(
                              circleIconList[i], circleTextList[i], i)
                      ],
                    )),
                Expanded(
                    child: Text(
                  '1 USD = 13,5440 TL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _bottomCircleIcon(IconData icon, String text, int i) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            switch (i) {
              case 0:
                Get.toNamed(Routes.DEPOSIT_MONEY);
                break;
              case 1:
                Get.toNamed(Routes.TRANSFER_WITH_QR);
                break;
              case 2:
                Get.toNamed(Routes.EXCHANGE);
                break;
              default:
                Get.toNamed(Routes.NEAREST_BANK);
            }
          },
          child: CircleAvatar(
            radius: 24,
            child: RotatedBox(
                quarterTurns: i == 0 ? 135 : 0,
                child: Icon(icon, color: primaryRed)),
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: Get.width * .15,
          height: 40,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white)),
        )
      ],
    );
  }

  _tabBar(TabController? tabController) {
    return TabBar(
        padding: EdgeInsets.symmetric(horizontal: 20),
        labelColor: Colors.black,
        indicatorColor: primaryRed,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.all(6),
        controller: tabController,
        tabs: [
          Text('Bireysel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 16)),
          Text('Kurumsal',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 16)),
        ]);
  }
}
