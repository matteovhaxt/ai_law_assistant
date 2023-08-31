import 'package:flutter_app/core/core.dart';

class AppBlocObserver extends BlocObserver {
  final logger = Logger();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('${bloc.runtimeType} $error $stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.t('${bloc.runtimeType} $transition');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('${bloc.runtimeType} $event');
  }
}
