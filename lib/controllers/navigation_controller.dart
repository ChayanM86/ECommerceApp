import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavigationController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  RxInt get currentIndexObs => _currentIndex;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }
}
