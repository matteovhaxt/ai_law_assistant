import 'dart:async';

import 'package:flutter/foundation.dart';

class StreamListenable<T> extends ChangeNotifier {
  StreamListenable(Stream<T> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (T _) => notifyListeners(),
        );
  }

  late final StreamSubscription<T> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
