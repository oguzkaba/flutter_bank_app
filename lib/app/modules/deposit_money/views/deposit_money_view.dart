import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/deposit_money_controller.dart';

class DepositMoneyView extends GetView<DepositMoneyController> {
  @override
  Widget build(BuildContext context) {
    TabController? tabController;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xfff1f1f1),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Para çek/yatır'),
          ),
          body: Column(
            children: <Widget>[
              _stackTabbar(tabController),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }

  Stack _stackTabbar(TabController? tabController) {
    return Stack(children: [
      Column(
        children: [
          SizedBox(height: 30, child: Container(color: primaryRed)),
          SizedBox(
              height: 100,
              child: AppBar(
                backgroundColor: Color(0xfff1f1f1),
                elevation: 0,
                bottom: _tabBar(tabController),
              )),
        ],
      ),
      Positioned(
        left: Get.width / 2 - 24,
        top: 6,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 2)
            ],
          ),
          child: CircleAvatar(
            radius: 24,
            child: RotatedBox(
                quarterTurns: 135,
                child: Icon(Icons.format_indent_decrease, color: primaryRed)),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    ]);
  }

  Column _tabview1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: Get.height * .07, bottom: Get.height * .1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text(controller.drawPrice.value.toString(),
                  style: TextStyle(
                      color: controller.drawPrice.value == 0
                          ? Colors.black.withOpacity(.3)
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 60))),
              SizedBox(width: 10),
              Obx(() => Text('TL',
                  style: TextStyle(
                      color: controller.drawPrice.value == 0
                          ? Colors.black.withOpacity(.3)
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)))
            ],
          ),
        ),
        SizedBox(height: 50, child: Obx(() => _buildChips()!)),
        SizedBox(height: 10),
        InkWell(
          onTap: () => Get.bottomSheet(
              SizedBox(
                height: Get.height / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Lütfen bir hesap seç',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('İzmit e5 ( **** 4527)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Icon(Icons.check)
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white),
          child: Container(
              padding: EdgeInsets.all(20),
              width: Get.width * .9,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GÖNDEREN',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('İzmit e5 ( **** 4527)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }

  _selectAccountDialog() {}

  _tabBar(TabController? tabController) {
    return TabBar(
        isScrollable: false,
        padding: EdgeInsets.symmetric(horizontal: 20),
        labelColor: Colors.black,
        indicatorColor: primaryRed,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.all(6),
        controller: tabController,
        tabs: [
          Text('Para Çek',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 18)),
          Text('Para Yatır',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 18)),
        ]);
  }

  Widget? _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < priceList.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: controller.selectedChip.value == i,
        padding: EdgeInsets.symmetric(horizontal: 20),
        label: Text(priceList[i].toString(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        backgroundColor: Colors.grey[300],
        selectedColor: Colors.grey[300],
        onSelected: (bool selected) {
          if (selected) {
            controller.selectedChip.value = i;
            controller.drawPrice.value = priceList[i];
          }
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
}
