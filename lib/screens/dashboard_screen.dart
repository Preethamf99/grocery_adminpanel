// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_adminpanel/consts/constants.dart';
import 'package:grocery_adminpanel/inner_screen/add_prod.dart';
import 'package:grocery_adminpanel/responsive.dart';
import 'package:grocery_adminpanel/services/utils.dart';
import 'package:grocery_adminpanel/widgets/buttons.dart';
import 'package:grocery_adminpanel/widgets/grid_product.dart';
import 'package:grocery_adminpanel/widgets/header.dart';
import 'package:grocery_adminpanel/controllers/MenuController.dart';
import 'package:grocery_adminpanel/widgets/orders_list.dart';
import 'package:grocery_adminpanel/widgets/text_widget.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                context.read<Menucontroller>().controlDashboarkMenu();
              },
              title: 'Dashboard',
              showtetxfiled: false,
            ),
            TextWidget(text: 'latest Products', color: color),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonsWidget(
                  onPressed: () {},
                  text: 'View All',
                  icon: Icons.store,
                  backgroundColor: Colors.blue,
                ),
                ButtonsWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadProductForm(),
                        ));
                  },
                  text: 'Add Products',
                  icon: Icons.add,
                  backgroundColor: Colors.blue,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Responsive(
                          mobile: ProductGridwidget(
                            childaspectratio:
                                size.width < 650 && size.width > 350
                                    ? 1.1
                                    : 0.8,
                            croxaxiscount: size.width < 650 ? 2 : 4,
                          ),
                          desktop: ProductGridwidget(
                              childaspectratio:
                                  size.width < 1400 ? 0.9 : 1.05)),
                      OrdersList()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
