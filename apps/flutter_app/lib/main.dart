import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/app/app_wrapper.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (Env.useFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  Bloc.observer = AppBlocObserver();

  runApp(
    const AppWrapper(),
  );
}
