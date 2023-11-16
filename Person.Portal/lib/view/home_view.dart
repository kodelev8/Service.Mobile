import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/view/about_view.dart';
import 'package:person_portal/view/address_binnenland_view.dart';
import 'package:person_portal/view/address_buitenland_view.dart';
import 'package:person_portal/view/cumulatieves_view.dart';
import 'package:person_portal/view/daywage_view.dart';
import 'package:person_portal/view/help_view.dart';
import 'package:person_portal/view/logout_view.dart';
import 'package:person_portal/view/main_view.dart';
import 'package:person_portal/view/menu_view.dart';
import 'package:person_portal/model/menu_items.dart' as menu_items;
import 'package:person_portal/view/profile_view.dart';
import 'package:person_portal/view/tax_files_view.dart';

class HomePage extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        controller: controller.zoomDrawerController,
        moveMenuScreen: true,
        showShadow: true,
        drawerShadowsBackgroundColor: Colors.lightBlue,
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        style: DrawerStyle.defaultStyle,
        angle: 0,
        menuBackgroundColor: Colors.indigo,
        menuScreen: Builder(builder: (context) {
          return MenuPage(
            currentItem: controller.currentMenuItem.value,
            onSelectedItem: (item) {
              controller.currentMenuItem.value = item;
              controller.toggleDrawer();
            },
          );
        }),
        mainScreen: Obx(() => getScreen()),
      );

  Widget getScreen() {
    switch (controller.currentMenuItem.value) {
      case menu_items.MenuItems.about:
        return AboutPage();
      case menu_items.MenuItems.profile:
        return ProfilePage();
      case menu_items.MenuItems.taxfiles:
        return TaxFilePage();
      case menu_items.MenuItems.cumulatieve:
        return CumulatievePage();
      case menu_items.MenuItems.help:
        return HelpPage();
      case menu_items.MenuItems.logout:
        return LogOutPage();
      case menu_items.MenuItems.adresBinnenland:
        return BinnenlandPage();
      case menu_items.MenuItems.adresBuitenland:
        return BuitenlandPage();
      case menu_items.MenuItems.daywage:
        return DaywagePage();
      default:
        return MainPage();
    }
  }
}
