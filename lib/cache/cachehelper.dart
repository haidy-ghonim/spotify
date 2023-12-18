//sharedpreference store data key:value
// save - get - delete - clear
import 'package:shared_preferences/shared_preferences.dart';

class CacheDate {
  static late SharedPreferences sharedPreferences; //declare
  static void cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance(); //assigment
  }

//methods
//1.set (save data)
  static Future<bool> setData(
      {required String Key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(Key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(Key, value);
      return true;
    }
    if (value is bool) {
      await sharedPreferences.setBool(Key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(Key, value);
      return true;
    }
    return false;
  }

  //get data = > key
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key); //string bool work in both
  }

  //delete item = > key
  static void deleteItem({required String key}) {
    sharedPreferences.remove(key);
  }
}
