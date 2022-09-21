import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sidebar_controller.dart';

class SidebarView extends GetView<SidebarController> {
  const SidebarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SidebarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SidebarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
