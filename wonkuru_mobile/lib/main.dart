import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:let/core/routes/router_config.dart';
// import 'package:let/features/splash/splash.dart';
import 'package:let/core/injections/injection.dart' as di;
import 'package:let/core/utils/multiple_bloc_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    const MultipleBlocProvider(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: AppRouter.router(false),
            // home: const SplashScreen(),
          );
        });
  }
}


// Future main() async {
//   MpesaFlutterPlugin.setConsumerKey(mConsumerKey);
//   MpesaFlutterPlugin.setConsumerSecret(mConsumerSecret);

//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   final localDataSource = di.sl<AuthenticationLocalDataSource>();
//   final user = await localDataSource.getUserCredentials();
//   String? role;
//   if (user == null) {
//     role = '';
//   } else {
//     role = user.role;
//   }

//   final prefs = await SharedPreferences.getInstance();
//   final onboarding = prefs.getBool('onboarding') ?? false;
//   runApp(MultipleBlocProvider(
//     child: MyApp(
//       onboarding: onboarding,
//       role: role,
//     ),
//   ));
// }

// class MyApp extends StatelessWidget {
//   final bool onboarding;
//   final String? role;
//   const MyApp({
//     super.key,
//     this.onboarding = false,
//     this.role,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         ScreenUtil.init(
//           context,
//           designSize:
//               Size(375, 812), // Set the design size according to your design
//           minTextAdapt: true,
//           splitScreenMode: true,
//         );

//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//             fontFamily: 'Laila',
//           ),
//           routerConfig: AppRouter.router(onboarding, role),
//         );
//       },
//     );
//   }
// }
