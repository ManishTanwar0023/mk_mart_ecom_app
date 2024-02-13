import 'package:get/get.dart';
import 'package:mk_mart_ecom_app/Model/Images.dart';

import '../Core/ApiService.dart';

class ImageController extends GetxController {
  final ApiService _apiService = ApiService();
  var data = <imageset>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      data.value = await _apiService.fetchData();
    } catch (e) {
      print('Exception : $e');
    }
  }
}
