import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static final List<String> _cartProducts = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> get cartProducts {
    return _prefs.getStringList('cartProducts') ?? _cartProducts; 
  }

  static void addProductToCart(String key, int quantity) {
    if (_cartProducts.contains(key)) {
      int currentQuantity = getProductQuantity(key);
      _prefs.setInt(key, currentQuantity + quantity);
    } else {
      _cartProducts.add(key);
      _prefs.setInt(key, quantity);
    }
    _prefs.setStringList('cartProducts', _cartProducts);
  }

  static int getProductQuantity(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  static void removeProductFromCart(String key) {
    _cartProducts.remove(key);
    _prefs.remove(key);
    _prefs.setStringList('cartProducts', _cartProducts);
  }

  static void clearCart() {
    _cartProducts.clear();
    _prefs.clear();
  }

  static void updateProductQuantity(String key, int count) {
    _prefs.setInt(key, count);
  }
}