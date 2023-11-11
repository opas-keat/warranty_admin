import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../data/models/module.dart';
import '../routes/app_pages.dart';
import 'constant.dart';
import 'custom_text.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Center(
                  child: SvgPicture.network(
                      'assets/icons/undraw_sweet_home_dkhr.svg')),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listModule.length,
                itemBuilder: (context, index) {
                  return (html.window.sessionStorage["roles"]
                              .toString()
                              .contains('user') &&
                          listModule[index].nameEn.contains('config'))
                      ? Container()
                      : Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            horizontalTitleGap: defaultPadding / 4,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2,
                            ),
                            hoverColor: primaryColor.withOpacity(0.2),
                            leading: Icon(
                              listModule[index].icon,
                            ),
                            title: CustomText(
                              text: listModule[index].nameTH,
                              scale: 0.8,
                            ),
                            onTap: () {
                              // talker.debug("edit: ${listModule[index].nameEn}");
                              if (listModule[index].nameEn.contains('logout')) {
                                Get.offAllNamed(Routes.SIGNIN);
                              } else {
                                Get.toNamed(listModule[index].url);
                              }
                            },
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
