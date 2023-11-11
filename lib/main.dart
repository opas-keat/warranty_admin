import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/constant.dart';
import 'app/shared/page_not_found.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      title: "ppsw-warranty",
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('th', 'TH'),
      ],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: GetPage(
        name: "/not-found",
        page: () => const PageNotFound(),
        transition: Transition.noTransition,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData.light().copyWith(
        // dropdownMenuTheme: DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme(),textStyle: TextStyle()),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        drawerTheme: const DrawerThemeData(
            scrimColor: Colors.transparent, elevation: 0.5),
        // dropdownMenuTheme: const DropdownMenuThemeData(
        //   textStyle: TextStyle(
        //     fontSize: 12,
        //   ),
        // ),
        textTheme: GoogleFonts.sarabunTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black87),
        canvasColor: canvasColor,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all<Color>(Colors.black26),
        ),
      ),
    );
  }
}
