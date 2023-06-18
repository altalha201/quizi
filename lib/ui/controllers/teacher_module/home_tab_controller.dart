import 'package:get/get.dart';

class HomeTabController extends GetxController {
  int _selectedTab = 1;

  int get selectedTab => _selectedTab;

  void changeTab(int newTabIndex) {
    _selectedTab = newTabIndex;
    update();
  }
}