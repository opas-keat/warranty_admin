import 'package:flutter/material.dart';

import '../../../../../responsive.dart';
import '../../../../shared/custom_text.dart';
import '../../../../shared/main_drawer.dart';
import 'warranty_list.dart';

class WarrantyView extends StatelessWidget {
  const WarrantyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !Responsive.isLargeScreen(context)
          ? AppBar(
              centerTitle: true,
              title: const CustomText(
                text: "การรับประกัน",
                color: Colors.white,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_sharp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_sharp,
                  ),
                ),
              ],
            )
          : null,
      drawer: !Responsive.isLargeScreen(context) ? const MainDrawer() : null,
      body: SafeArea(
        child: Responsive(
          // smallScreen: Container(
          //   padding: const EdgeInsets.all(defaultPadding / 2),
          //   // color: Colors.amber,
          //   child: const SingleChildScrollView(
          //     primary: true,
          //     child: WarrantyList(),
          //   ),
          // ),
          // mediumScreen: Container(
          //   padding: const EdgeInsets.all(defaultPadding),
          //   // color: Colors.amber,
          //   child: const SingleChildScrollView(
          //     primary: true,
          //     child: WarrantyList(),
          //   ),
          // ),
          smallScreen: const WarrantyList(),
          mediumScreen: const WarrantyList(),
          largeScreen: Row(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => const MainDrawer(),
                ),
              ),
              Expanded(
                flex: Responsive.isLargeScreen(context) ? 6 : 1,
                child: const WarrantyList(),
                // child: LayoutBuilder(
                //   builder: (context, constraints) => Container(
                //     color: Colors.white,
                //     child: const Align(
                //       alignment: Alignment.topCenter,
                //       child: Column(
                //         children: [
                //           Header(moduleName: "การรับประกัน"),
                //           SizedBox(height: defaultPadding / 2),
                //           WarrantyList(),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
