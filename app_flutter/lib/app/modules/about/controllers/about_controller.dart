import 'package:get/get.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController
  final RxBool _isLoading = true.obs;

  RxBool get isLoading => _isLoading;
  
  @override
  void onInit() {
    super.onInit();
    _isLoading.value = false;
  }


  @override
  void onClose() {}
}
