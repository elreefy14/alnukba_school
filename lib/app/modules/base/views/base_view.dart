import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_view.dart';

import 'package:icons_plus/icons_plus.dart';
import '../controllers/base_controller.dart';
import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../../settings/views/settings_view.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: controller.currentIndex,
            children: [
              HomeView(),
              CommandeView(),
              CartView(),
              const NotificationsView(),
              SettingsView()
            ],
          ),
        ),
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              child: BottomNavigationBar(
                currentIndex: controller.currentIndex,
                type: BottomNavigationBarType.fixed,
                elevation: 0.0,
                backgroundColor: theme.scaffoldBackgroundColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0.0,
                items: [
                  _mBottomNavItem(
                    label: 'Home',
                    icon: EvaIcons.home,
                  ),
                  _mBottomNavItem(
                    label: 'Commandes',
                    icon: Icons.history,
                  ),
                  _mBottomNavItem(
                    label: 'Cart',
                    icon: EvaIcons.shopping_cart,
                  ),
                  _mBottomNavItem(
                    label: 'Notifications',
                    icon: Icons.payment_outlined,
                  ),
                  _mBottomNavItem(
                    label: 'Settings',
                    icon: EvaIcons.settings_2,
                  ),
                ],
                onTap: controller.changeScreen,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _mBottomNavItem({required String label, required IconData icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon, color: Get.theme.iconTheme.color),
      activeIcon: Icon(
        icon,
        color: Get.theme.primaryColor,
        size: 30.w,
      ),
    );
  }
}
