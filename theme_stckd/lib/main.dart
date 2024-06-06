import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:theme_stckd/app/app.bottomsheets.dart';
import 'package:theme_stckd/app/app.dialogs.dart';
import 'package:theme_stckd/app/app.locator.dart';
import 'package:theme_stckd/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await ThemeManager.initialise();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.dark,
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      builder: (context, lightTheme, darkTheme, themeMode) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        );
      },
    );
  }
}


// ///CORE stuff; check docs for more
// //1 -> add to pubspec.yaml and import package
// stacked_themes: ^0.3.12
// import 'package:stacked_themes/stacked_themes.dart';

// ///2a Setup stacked theme under dependency in app.dart
// Singleton(
//   classType: ThemeService,
//   resolveUsing: ThemeService.getInstance,
// ),

// //2b Register as service locator in app.locator.dart
// locator.registerSingleton(ThemeService.getInstance());

// //3 Initialise ThemeManager
// Future main() async {
//   await ThemeManager.initialise();
//   runApp(MyApp());
// }

// //4 Wrap our MaterialApp with "ThemeBuilder" from StackedTheme
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ThemeBuilder(
//      //pass in default / custom app theme
//         lightTheme: ThemeData.light(),
//          darkTheme: ThemeData.dark(),
//       builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
//         title: 'Flutter Demo',
//         theme: regularTheme,
//         darkTheme: darkTheme,
//         themeMode: themeMode,

//       ),
//     );
//   }
// }

// //5 Start playing by calling ur locator in VM and using the various theme methods
// final _themeService = locator<ThemeService>();

// void toggleTheme() {
//   _themeService.toggleDarkLightTheme();
// }