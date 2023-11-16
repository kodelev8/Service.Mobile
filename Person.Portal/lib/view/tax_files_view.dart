import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/view/tax_files_collectieve_view.dart';
import 'package:person_portal/view/tax_files_inkomsten_view.dart';
import 'package:person_portal/widget/menu_widget.dart';

class TaxFilePage extends GetView<MenuController>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Tax Details'),
      leading: MenuWidget(),

    ),
    body:DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 8,
          automaticallyImplyLeading: false,
          bottom: const TabBar(tabs: [
            Tab(text: 'Collective'),
            Tab(text: 'Inkomsten'),
          ]),
        ),
        body: TabBarView(
          children: [
            TaxFilesCollectievePage(),
            TaxFilesInkomstenPage(),
          ],
        ),
      ),
    )
  );
}