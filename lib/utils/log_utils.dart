import 'package:flutterbookkeep/common/Constant.dart';
import 'dart:convert' as convert;

/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      log_utils
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/6/29 4:41 PM
/// @Description:    日志工具类

class Log {
  static const String tag = 'DEBUG_LOG';

  static bool debuggable = false;

  static init() {
    debuggable = !Constant.inProduction;
  }

  static d(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      v(msg, tag: tag);
    }
  }

  static e(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      _printLog(tag, '  e  ', msg);
    }
  }

  static json(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      var data = convert.json.decode(msg);
      if (data is Map) {
        _printMap(data);
      } else if (data is List) {
        _printList(data);
      } else
        v(msg, tag: tag);
    }
  }

  static void _printMap(Map data,
      {tag: tag, int tabs = 1, bool isListItem = false, bool isLast = false}) {
    final bool isRoot = tabs == 1;
    final initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) v('$initialIndent{', tag: tag);

    data.keys.toList().asMap().forEach((index, key) {
      final isLast = index == data.length - 1;
      var value = data[key];
      if (value is String) value = '\"$value\"';
      if (value is Map) {
        if (value.length == 0)
          v('${_indent(tabs)} $key: $value${!isLast ? ',' : ''}', tag: tag);
        else {
          v('${_indent(tabs)} $key: {', tag: tag);
          _printMap(value, tabs: tabs);
        }
      } else if (value is List) {
        if (value.length == 0) {
          v('${_indent(tabs)} $key: ${value.toString()}', tag: tag);
        } else {
          v('${_indent(tabs)} $key: [', tag: tag);
          _printList(value, tabs: tabs);
          v('${_indent(tabs)} ]${isLast ? '' : ','}', tag: tag);
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        v('${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}', tag: tag);
      }
    });

    v('$initialIndent}${isListItem && !isLast ? ',' : ''}', tag: tag);
  }

  static void _printList(List list, {tag: tag, int tabs = 1}) {
    list.asMap().forEach((i, e) {
      final isLast = i == list.length - 1;
      if (e is Map) {
        if (e.length == 0)
          v('${_indent(tabs)}  $e${!isLast ? ',' : ''}', tag: tag);
        else
          _printMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
      } else
        v('${_indent(tabs + 2)} $e${isLast ? '' : ','}', tag: tag);
    });
  }

  static String _indent([int tabCount = 1]) => '  ' * tabCount;

  static void v(Object object, {String tag}) {
    if (debuggable) {
      _printLog(tag, '  v  ', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    String da = object.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("$tag $stag ${da.substring(0, 512)}");
        da = da.substring(512, da.length);
      } else {
        print("$tag $stag $da");
        da = "";
      }
    }
  }
}
