/// @ProjectName:    flutter_bookkeep
/// @Package:        
/// @ClassName:      lifecycle
/// @Author:         hanxu.zhao
/// @CreateDate:     2020/7/1 1:40 PM
/// @Description:     

abstract class Lifecycle {

  /// widget创建执行的第一个方法
  void onInitState();

  /// 当State对象的依赖发生变化时会被调用
  void onDidChangeDependencies();

  /// 当树rebuid的时候会调用该方法
  void onDidUpdateWidget<W>(W oldWidget);

  /// 当State对象从树中被移除时，会调用此回调
  void onDeactivate();

  /// 当State对象从树中被永久移除时调用
  void onDispose();
}