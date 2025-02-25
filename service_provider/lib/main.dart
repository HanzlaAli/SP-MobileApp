import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Presentation/helper/BlocRegister.dart';
import 'Presentation/helper/ReusedFunctions.dart';
import 'Presentation/Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import 'Presentation/helper/materialApp.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setNotifications();
  runApp(RegisterBloc.startUp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    localNotificationInit(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        BlocProvider.of<ActiveNotActiveUserBloc>(context).add(UserActive());
        break;
      case AppLifecycleState.inactive:
        BlocProvider.of<ActiveNotActiveUserBloc>(context).add(UserNonActive());
        break;
      case AppLifecycleState.paused:
        BlocProvider.of<ActiveNotActiveUserBloc>(context).add(UserNonActive());
        break;
      case AppLifecycleState.detached:
        BlocProvider.of<ActiveNotActiveUserBloc>(context).add(UserNonActive());
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MyMaterialApp.myMeaterialApp();
  }
}
