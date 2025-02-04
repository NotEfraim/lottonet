import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData<T>(String key, T value) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  
  if (value is String) {
    await pref.setString(key, value);
  } else if (value is bool) {
    await pref.setBool(key, value);
  } else if (value is int) {
    await pref.setInt(key, value);
  } else if (value is double) {
    await pref.setDouble(key, value);
  } else {
    throw ArgumentError("Unsupported type"); // Handle unsupported types
  }
}

Future<T?> getData<T>(String key) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  
  if (T == String) {
    return pref.getString(key) as T?;
  } else if (T == int) {
    return pref.getInt(key) as T?;
  } else if (T == bool) {
    return pref.getBool(key) as T?;
  } else if (T == double) {
    return pref.getDouble(key) as T?;
  } else {
    throw ArgumentError("Unsupported type");
  }
}

