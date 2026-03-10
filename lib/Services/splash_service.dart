import 'dart:async';
import '../Controllers/functionality_controller.dart';
import '../Controllers/setup_controller.dart';
import '../Models/user_model.dart';
import '../Utils/preferences.dart';
import '../views/screens/dashboard_screen.dart';
import '../views/screens/login_screen.dart';
import '../views/splash.dart';
import 'package:flutter/material.dart';
import '../Utils/utils.dart';
import 'get_services.dart';
import 'package:provider/provider.dart';

// class SplashServices {
//   Future<void> _checkFirstLaunch(BuildContext context) async {
//     UserResponseModel? user = await Preferences.init().then(
//       (onValue) => onValue.getUser(),
//     );

//     final cont = Provider.of<SetupController>(context, listen: false);
//     final functController = Provider.of<FunctionalityController>(
//       context,
//       listen: false,
//     );
//     print(user ?? "not login");
//     if (user == null) {
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) {
//       //       return LoginPage();
//       //     },
//       //   ),
//       // );
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//         (route) => false, // removes all previous routes
//       );
//     } else {
//       print("token : ${user.logindata.beareartoken}");
//       // await functController.getCheckEmployeeStatus(context);
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) {
//       //       return const DashboardScreen();
//       //     },
//       //   ),
//       // );
//       bool? isErp = await Preferences.init().then(
//         (onValue) => onValue.getisErp(),
//       );
//       if (isErp != null) {
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (_) => DashboardScreen(isERP: isErp)),
//           (route) => false, // removes all previous routes
//         );
//       } else {
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (_) => const LoginPage()),
//           (route) => false, // removes all previous routes
//         );
//       }
//     }
//   }

//   CheckConnectionService checkConnectionService = CheckConnectionService();
//   void islogin(BuildContext context) async {
//     Timer(const Duration(seconds: 3), () async {
//       await checkConnectionService.checkConnection().then((internet) async {
//         if (!internet) {
//           Utils.showconnectivityDialog(context, () {
//             // Navigator.pushReplacement(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) {
//             //       return Splash();
//             //     },
//             //   ),
//             // );
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (_) => const Splash()),
//               (route) => false, // removes all previous routes
//             );
//           });
//         } else {
//           await _checkFirstLaunch(context);
//         }
//       });
//     });
//   }
// }
class SplashServices {
  final CheckConnectionService checkConnectionService =
      CheckConnectionService();

  void islogin(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      if (!context.mounted) return;

      final internet = await checkConnectionService.checkConnection();
      if (!internet) {
        if (!context.mounted) return;
        Utils.showconnectivityDialog(context, () {});
        return;
      }

      await _checkFirstLaunch(context);
    });
  }

  Future<void> _checkFirstLaunch(BuildContext context) async {
    if (!context.mounted) return;

    final prefs = await Preferences.init();
    final user = prefs.getUser();
    // final isErp = prefs.getisErp();

    if (!context.mounted) return;

    if (user == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => DashboardScreen()),
        (route) => false,
      );
    }
  }
}
