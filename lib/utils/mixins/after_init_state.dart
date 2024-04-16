import 'package:flutter/widgets.dart';
// This mixin is called after initState and before didChangeDependencies

mixin AfterInitMixin<T extends StatefulWidget> on State<T> {
    bool _didInitState = false;
  
    @override
    @mustCallSuper
    void didChangeDependencies() {
      if (!_didInitState) {
        afterInitState();
        _didInitState = true;
      }
      super.didChangeDependencies();
    }
  
    void afterInitState();
  }