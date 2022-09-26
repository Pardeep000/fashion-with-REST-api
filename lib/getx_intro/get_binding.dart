import 'package:get/get.dart';
import 'package:pk_practice/get_class.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(GetClass());
  }
}
