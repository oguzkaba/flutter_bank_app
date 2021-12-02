import 'package:flutter/material.dart';
import 'package:flutter_bank_app/app/common/elevated_button_widget.dart';
import 'package:flutter_bank_app/app/routes/app_pages.dart';

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
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height * .07, bottom: Get.height * .1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => IntrinsicWidth(
                      child: TextField(
                        cursorColor: Colors.black,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 58),
                        maxLength: 5,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: '0',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(
                                color: controller.drawPrice.value == 0
                                    ? Colors.black.withOpacity(.3)
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 58)),
                        controller: controller.tcontroller,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => controller.drawPrice.value =
                            int.tryParse(value) ?? 0,
                      ),
                    ),
                  ),
                  // style: TextStyle(
                  //     color: controller.drawPrice.value == 0
                  //         ? Colors.black.withOpacity(.3)
                  //         : Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 60))),
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
            _selectAccountDropDown(),
          ],
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Obx(() => ElevatedButtonWidget(
                  width: Get.width * .8,
                  title: 'Devam',
                  tap: controller.drawPrice == 0
                      ? null
                      : () => Get.toNamed(Routes.HOME),
                )),
          ),
        ))
      ],
    );
  }

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
            FocusScope.of(Get.context!).requestFocus(FocusNode());
            controller.selectedChip.value = i;
            controller.drawPrice.value = priceList[i];
            controller.tcontroller.text = controller.drawPrice.value.toString();
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

  InkWell _selectAccountDropDown() {
    return InkWell(
      onTap: () => _showSelectAccountDialog(),
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
                  Obx(() => Text(controller.selectAccount.value,
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  Icon(Icons.keyboard_arrow_down)
                ],
              )
            ],
          )),
    );
  }

  Future _showSelectAccountDialog() {
    return Get.bottomSheet(
        SizedBox(
          height: Get.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: SizedBox(
                      width: Get.width * .1,
                      child: Divider(color: Colors.grey, thickness: 2))),
              Text('Lütfen bir hesap seç',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              for (var j = 0; j < accountList.length; j++)
                _accountListItem(accountList[j], j),
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }

  Padding _accountListItem(String accountName, int selected) {
    return Padding(
      padding: EdgeInsets.only(top: selected == 0 ? 30 : 0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              controller.selectAccount.value = accountList[selected];
              Get.back();
            },
            child: Text(accountName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        controller.selectAccount.value == accountList[selected]
                            ? Colors.black
                            : Colors.grey)),
          ),
          controller.selectAccount.value == accountList[selected]
              ? Icon(Icons.check_circle_rounded)
              : Container()
        ],
      ),
    );
  }
}
