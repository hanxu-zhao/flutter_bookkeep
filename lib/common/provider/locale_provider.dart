import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterbookkeep/common/manager/storage_manager.dart';

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      locale_provider
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/6/29 3:57 PM
/// @Description:     

class LocaleProvider extends ChangeNotifier {
  static const localeValueList = ['en', 'ja', 'zh'];
  static const localeNameList = ['en_US', 'ja-JP', 'zh-CN'];

  int get localeIndex => StorageManager.getLocalizationsIndex();

  Locale get locale {
    if (localeIndex != null) {
      var value = localeValueList[localeIndex ?? 0];
      return Locale(value);
    }
    return Locale(localeValueList[0]);
  }

  switchLocale(int index) {
    saveLocaleIndex(index);
    notifyListeners();
  }

  saveLocaleIndex(int index) {
    StorageManager.saveLocalizationsIndex(index);
    StorageManager.saveLocalizationsName(localeNameList[index]);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return 'English';
      case 1:
        return '日本語';
      case 2:
        return '中文';
      default:
        return '';
    }
  }
}