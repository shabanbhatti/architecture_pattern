import 'package:api_integration/config/injector/injectors.dart';
import 'package:api_integration/core/constants/shared_pref_keys_constants.dart';
import 'package:api_integration/core/service/shared_pref_service.dart';
import 'package:api_integration/views/initial%20feature/intro%20screen/intro_screen.dart';
import 'package:api_integration/views/initial%20feature/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';

class CommonScreen extends StatefulWidget {
  const CommonScreen({super.key});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  ValueNotifier<bool> isSplashNotifier = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    decidePage();
  }

  Future<void> decidePage() async {
    var sp = getIt<SharedPrefService>();
    var isSplash = await sp.getBool(SharedPrefKeysConstants.splashKey) ?? false;
    if (isSplash) {
      isSplashNotifier.value = true;
    } else {
      isSplashNotifier.value = false;
    }
  }

  @override
  void dispose() {
    isSplashNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSplashNotifier,
      builder: (context, isSplash, child) {
        if (isSplash) {
          return const SplashScreen();
        } else {
          return const IntroScreen();
        }
      },
    );
  }
}
