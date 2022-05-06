import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;

  @override
  void onClose() {}

  void setCurrentIndex(index) => _currentIndex.value = index;
}
