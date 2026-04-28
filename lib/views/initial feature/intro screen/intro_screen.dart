import 'package:api_integration/config/injector/injectors.dart';
import 'package:api_integration/core/constants/shared_pref_keys_constants.dart';
import 'package:api_integration/core/service/shared_pref_service.dart';
import 'package:api_integration/core/widgets/app%20btns/custom_app_btn.dart';
import 'package:api_integration/views/home%20feature/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Intro Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.apple, size: 70, color: Colors.white),
            ),
            Text(
              "Apple Store is based in UK, we have all cetagories of ipHone",
              textAlign: TextAlign.center,
            ),

            CustomAppBtn(
              onTap: () {
                var sp = getIt<SharedPrefService>();
                sp.setBool(SharedPrefKeysConstants.splashKey, true);
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
