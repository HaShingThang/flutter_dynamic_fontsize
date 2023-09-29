import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeController extends GetxController {
  final RxString selectedFontSize = "Medium".obs;
  final Map<String, Map<String, double>> fontSizes = {
    "Large": {"2xl": 26, "xl": 24, "lg": 22, "base": 20, "sm": 18, "xs": 16},
    "Medium": {"2xl": 22, "xl": 20, "lg": 18, "base": 16, "sm": 14, "xs": 12},
    "Small": {"2xl": 18, "xl": 16, "lg": 14, "base": 12, "sm": 10, "xs": 8},
  };

  @override
  void onInit() {
    super.onInit();
    loadSelectedFontSize();
  }

  void changeFontSize(String size) {
    selectedFontSize.value = size;
    saveSelectedFontSize(size);
    update();
  }

  Future<void> saveSelectedFontSize(String size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFontSize', size);
  }

  Future<void> loadSelectedFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedSize = prefs.getString('selectedFontSize');
    if (savedSize != null) {
      selectedFontSize.value = savedSize;
      update();
    }
  }
}
