import 'package:flutter/material.dart';
import 'package:grocery_adminpanel/controllers/MenuController.dart';
import 'package:grocery_adminpanel/responsive.dart';

import 'package:grocery_adminpanel/services/utils.dart';
import 'package:grocery_adminpanel/widgets/grid_product.dart';
import 'package:grocery_adminpanel/widgets/header.dart';

import 'package:grocery_adminpanel/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<Menucontroller>().getgridscaffoldKey,
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
                child: Column(
                  children: [
                    Header(
                      fct: () {
                        context.read<Menucontroller>().controlProductsMenu();
                      },
                      title: 'All Products',
                      showtetxfiled: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Responsive(
                        mobile: ProductGridwidget(
                          childaspectratio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                          croxaxiscount: size.width < 650 ? 2 : 4,
                          isMain: false,
                        ),
                        desktop: ProductGridwidget(
                          childaspectratio: size.width < 1400 ? 0.9 : 1.05,
                          isMain: false,
                        )),
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
