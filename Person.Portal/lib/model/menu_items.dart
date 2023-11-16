import 'package:flutter/material.dart';
import 'package:person_portal/model/menu_item.dart' as menu_item;



class MenuItems {
  static const home = menu_item.MenuItem('Home', Icons.house);
  static const profile = menu_item.MenuItem('Profile', Icons.person);
  static const adresBinnenland = menu_item.MenuItem('Address Binnenland', Icons.house);
  static const adresBuitenland = menu_item.MenuItem('Address Buitenland', Icons.house);
  static const taxfiles = menu_item.MenuItem('TaxFiles', Icons.euro);
  static const daywage = menu_item.MenuItem('Daywage', Icons.account_balance_wallet);
  static const cumulatieve = menu_item.MenuItem('Cumulatieves', Icons.calculate_sharp);
  static const about = menu_item.MenuItem('About Us', Icons.info);
  static const help = menu_item.MenuItem('Help', Icons.help);
  static const logout = menu_item.MenuItem('LogOut', Icons.exit_to_app);

  static const allItems = <menu_item.MenuItem>[
    // home,
    profile,
    adresBinnenland,
    adresBuitenland,
    taxfiles,
    daywage,
    cumulatieve,
    about,
    // help,
    // logout,
  ];
}