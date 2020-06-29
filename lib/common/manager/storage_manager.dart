import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      storage_manager
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/6/29 3:58 PM
/// @Description:     

class StorageManager {
  static SharedPreferences sharedPreferences;

  /// https://pub.dev/packages/localstorage#-example-tab- 示例
  static LocalStorage localStorage;

  static init() async {
    // async 异步操作
    // sync 同步操作
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage('KintoLocalStorage');
    await localStorage.ready;
  }

  static clear() async {
//    await sharedPreferences.clear();
//    await localStorage.clear();
  }

  static saveLocalizationsName(String name) {
    sharedPreferences.setString(SPKey.LOCALIZATIONS_NAME_KEY, name);
  }

  static String getLocalizationsName() =>
      sharedPreferences.getString(SPKey.LOCALIZATIONS_NAME_KEY) ?? '';

  static saveLocalizationsIndex(int index) {
    sharedPreferences.setInt(SPKey.LOCALIZATIONS_INDEX_KEY, index);
  }

  static int getLocalizationsIndex() =>
      sharedPreferences.getInt(SPKey.LOCALIZATIONS_INDEX_KEY);

  /// 此为localStorage写法示例 根据业务自行调整
  static dynamic getJson(String key) => localStorage.getItem(key);

  /// 此为localStorage写法示例 根据业务自行调整
  static deleteJson(String key) => localStorage.deleteItem(key);
}

/// sp存储key值常量类 根据业务自行添加
class SPKey {
  static const String LOCALIZATIONS_NAME_KEY = "LOCALIZATIONS_NAME_KEY";
  static const String LOCALIZATIONS_INDEX_KEY = "LOCALIZATIONS_INDEX_KEY";
}

/// ls存储key值常量类 根据业务自行添加
class LSKey {
  static const String KEY = "KEY";
}