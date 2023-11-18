// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_adminpanel/responsive.dart';
// import 'package:grocery_adminpanel/services/utils.dart';

import 'package:grocery_adminpanel/widgets/orders_list.dart';
import 'package:grocery_adminpanel/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../widgets/header.dart';

class AllOrder_Screen extends StatelessWidget {
  const AllOrder_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<Menucontroller>().getOrderScaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    Header(
                      showtetxfiled: false,
                      fct: () {
                        context.read<Menucontroller>().controlAllorder();
                      },
                      title: 'All Orders',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(padding: EdgeInsets.all(8.0), child: OrdersList())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
