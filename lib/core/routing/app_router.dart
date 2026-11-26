// import 'package:flutter/material.dart';
// import 'package:shopping_application/core/routing/routes.dart';
// import 'package:shopping_application/feature/auth/presentation/view/screen/otp_screen.dart';
// import 'package:shopping_application/feature/on_boarding/view/on_boarding_screen.dart';

// import '../../feature/auth/presentation/view/screen/phone_screen.dart';
// import '../../feature/cart/cart_screen.dart';
// import '../../feature/favorite/favorite_screen.dart';
// import '../../feature/home/home_screen.dart';
// import '../../feature/auth/presentation/view/screen/login_screen.dart';
// import '../../feature/profile/profile_screen.dart';
// import '../../feature/auth/presentation/view/screen/register_screen.dart';
// import '../common/app_section/custom_navigation_bar.dart';

// //!_____Centralized Navigation___

// class AppRouter {
//   Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.onBoardingScreen:
//         return MaterialPageRoute(builder: (_) => OnBoardingScreen());
//       case Routes.loginScreen:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//       case Routes.mainNavBar:
//         return MaterialPageRoute(builder: (_) => MainNavBar());
//       case Routes.phoneScreen:
//         return MaterialPageRoute(builder: (_) => PhoneScreen());
//       case Routes.otpScreen:
//         return MaterialPageRoute(builder: (_) => OtpScreen());
//       case Routes.registerScreen:
//         return MaterialPageRoute(builder: (_) => RegisterScreen());
//       case Routes.homeScreen:
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       case Routes.cartScreen:
//         return MaterialPageRoute(builder: (_) => CartScreen());
//       case Routes.favoriteScreen:
//         return MaterialPageRoute(builder: (_) => FavoriteScreen());
//       case Routes.profileScreen:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());

//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text(
//                 'No route defined for ${settings.name} please check your route name and restart the app',
//               ),
//             ),
//           ),
//         );
//     }
//   }
// }
