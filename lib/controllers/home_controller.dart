import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  ///
  /// Loading animation gif
  bool _hideAnim = false;
  bool get hideAnim => _hideAnim;

  updateHomeAnim(value) {
    _hideAnim = value;
    update();
  }

  /// ITEM DETAIL PAGE ///
  /// CHOICE VARIABLES ///
  /// --- STARTS --- ///

  /// Coffee 1 unit price
  int price = 3;

  ///
  /// Coffee Name
  String _coffeeName = "";
  String get coffeeName => _coffeeName;

  updateCoffeeName(value) {
    _coffeeName = value;
    update();
  }

  ///
  /// Item Image
  String _image = "";
  String get image => _image;

  updateImage(value) {
    _image = value;
    update();
  }

  ///
  /// Detail Item Count
  int _count = 0;
  int get count => _count;

  ///
  /// Update Counter for item
  updateCount(value) {
    if (value > 0) {
      _count = value;
      updateItemTotal(_count * price);
    }

    update();
  }

  /// Reset Count
  resetCountAndDetail() {
    _count = 0;
    resetDetail();
  }

  /// Reset Detail
  resetDetail() {
    _shotType = '';
    _servingType = '';
    _size = '';
    _cubes = '';
  }

  ///
  /// Shot Type
  String _shotType = "";
  String get shotType => _shotType;

  updateShotType(value) {
    _shotType = value;
    update();
  }

  ///
  /// Serving Type
  String _servingType = "";
  String get servingType => _servingType;

  updateServingType(value) {
    _servingType = value;
    update();
  }

  ///
  /// Size
  String _size = "";
  String get size => _size;

  updateSize(value) {
    _size = value;
    update();
  }

  ///
  /// Ice Cubes
  String _cubes = "";
  String get cubes => _cubes;

  updateCubes(value) {
    _cubes = value;
    update();
  }

  ///
  /// Item Total
  int _itemTotal = 0;
  int get itemTotal => _itemTotal;

  updateItemTotal(value) {
    _itemTotal = value;
    update();
  }

  /// Get Item Detail Summary

  getItemSummary() {
    String iceCount = ' $cubes' == '1'
        ? 'little ice'
        : cubes == '2'
            ? 'medium ice'
            : cubes == '3'
                ? 'full ice'
                : 'no ice';
    return '${shotType.toLowerCase()} | ${servingType.toLowerCase()} | ${size.toLowerCase()} | $iceCount';
  }

  /// ITEM DETAIL PAGE ///
  /// CHOICE VARIABLES ///
  /// --- ENDS--- ///
}
