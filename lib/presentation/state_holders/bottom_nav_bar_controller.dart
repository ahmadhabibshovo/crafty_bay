import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  changeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  goToCategory() {
    changeIndex(1);
  }

  backToHome() {
    changeIndex(0);
  }
}
