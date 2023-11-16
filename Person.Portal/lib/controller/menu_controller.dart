import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:person_portal/model/menu_items.dart' as menu_items;

class MenuController extends GetxController {
  var currentMenuItem = menu_items.MenuItems.profile.obs;
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}