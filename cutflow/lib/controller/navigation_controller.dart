import 'package:get/get.dart';

class NavigationController extends GetxController {
  void navigateTo(String routeName) {
    Get.toNamed(routeName);
  }

  void goBack() {
    Get.back();
  }

  void replacePage(String routeName) {
    Get.offNamed(routeName);
  }

  void clearAndNavigateTo(String routeName) {
    Get.offAllNamed(routeName);
  }
}
