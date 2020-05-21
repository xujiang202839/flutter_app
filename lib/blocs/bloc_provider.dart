import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlocProvider({Key key, @required this.bloc, @required this.child})
      : assert(bloc != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => BlocProviderState();

//  static T of<T extends BaseBloc>(BuildContext context) =>
//      (context.ancestorWidgetOfExactType(_typeOf()) as BlocProvider).bloc;

  static T of<T extends BaseBloc>(BuildContext context){
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class BlocProviderState extends State<BlocProvider> {
  @override
  void dispose() {
    super.dispose();
    if (widget.bloc != null) widget.bloc.dispose();
  }
  @override
  Widget build(BuildContext context) => widget.child;
}
