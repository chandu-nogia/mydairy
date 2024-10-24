import 'dart:developer';

import 'package:flutter/material.dart';
import 'add_payment_screen.dart';
import 'package:mydairy/export.dart';

class KhataScreen extends StatefulWidget {
  const KhataScreen({super.key});

  @override
  State<KhataScreen> createState() => KhataScreenState();
}

class KhataScreenState extends State<KhataScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(":::?:::${_tabController.animation?.value}");

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.appColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'Payment',
          style: TextStyle(
            color: AppColor.whiteClr,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          CustomAppBarBtn(
            title: _tabController.animation?.value == 0.0
                ? "Add Receive"
                : "Add Pay",
            onTap: () => navigationTo(const AddPaymentScreen()),
          )
        ],
        bottom: TabBar(
          indicatorPadding: EdgeInsets.only(bottom: 10.h),
          dividerColor: AppColor.whiteClr,
          unselectedLabelColor: AppColor.whiteClr,
          indicatorColor: AppColor.whiteClr,
          labelStyle: const TextStyle(color: AppColor.whiteClr),
          controller: _tabController,
          onTap: (value) {
            setState(() {
              _tabController.animation?.value;
            });
          },
          tabs: const <Widget>[
            Tab(text: "PAY"),
            Tab(text: "RECEIVE"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[const PayScreen(), Container()],
      ),
    );
  }
}

class PayScreen extends ConsumerStatefulWidget {
  const PayScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PayScreenState();
}

class _PayScreenState extends ConsumerState<PayScreen>
    with SingleTickerProviderStateMixin {
  // late Animation animation;
  // late AnimationController animationController;
  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // animationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 4))
    //       ..repeat();
    // animation = Tween(begin: 200.0, end: 10.0).animate(animationController);
    // animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //   }
    // });
    // animationController.addListener(() {
    //   // print(" value3 ${animation.value}");
    //   setState(() {});
    // });

    // animationController.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0.r),
      child: Column(
        children: [
          const TxtField(
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            hintText: "Search Here",
          ),

          // Container(
          //   height: animation.value,
          //   width: animation.value,
          //   // color: AppColor.redClr,
          // ),

          AnimatedContainer(
            decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(item),
            ),
            duration: const Duration(seconds: 2),
            width: _width,
            height: _hight,
          ),

          const SizedBox(height: 10),

          buttonContainer(
              onTap: () {
                log("Hellow ");
                if (_hight == 50) {
                  _hight = 300;
                  _width = 300;
                  item = 1.0;
                  colors = AppColor.appColor;
                } else {
                  _width = 50;
                  _hight = 50;
                  item = 0.0;
                  colors = AppColor.yellowClr;
                }
                setState(() {});
              },
              txt: "Animated"),
        ],
      ),
    );
  }

  double item = 1.0;
  Color colors = AppColor.greenClr;
  double _hight = 50.0;
  double _width = 50.0;
}

class Responsive {
  static final context = Keys.navigatorKey().currentState!.context;
  static width(double p) {
    return MediaQuery.of(context).size.width * (p / 100) / 4.1;
  }

  static height(double p) {
    return MediaQuery.of(context).size.height * (p / 100) / 8.9;
  }

  static font_size(double p) {
    return MediaQuery.of(context).size.height * (p / 100) / 8.9;
  }
}
