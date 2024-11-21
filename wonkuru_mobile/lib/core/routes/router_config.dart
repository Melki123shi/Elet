import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let/core/routes/route_name.dart';
import 'package:let/features/authentication/presentation/pages/login.dart';
import 'package:let/features/authentication/presentation/pages/signup.dart';
import 'package:let/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static GoRouter router(bool onboarding) => GoRouter(
        // initialLocation: onboarding ? AppPath.login : AppPath.onboarding,
        initialLocation: AppPath.login,
        routes: <RouteBase>[
          // StatefulShellRoute.indexedStack(
          //   builder: (BuildContext context, GoRouterState state,
          //           StatefulNavigationShell navigationShell) =>
          //       ScaffoldWithNavBar(navigationShell: navigationShell),
          //   branches: [
          //     StatefulShellBranch(
          //       routes: <RouteBase>[
                  GoRoute(
                    path: AppPath.home,
                    name: AppPath.home,
                    builder: (BuildContext context, GoRouterState state) {
                      return const HomePage();
                    },
                  ),
              //   ],
              // ),
          //     StatefulShellBranch(
          //       routes: <RouteBase>[
          //         GoRoute(
          //           path: AppPath.myRoute,
          //           name: AppPath.myRoute,
          //           builder: (BuildContext context, GoRouterState state) {
          //             return const MyRoute();
          //           },
          //         ),
          //       ],
          //     ),
          //     StatefulShellBranch(
          //       routes: <RouteBase>[
          //         GoRoute(
          //           path: AppPath.ticket,
          //           name: AppPath.ticket,
          //           builder: (BuildContext context, GoRouterState state) {
          //             return const TicketPage();
          //           },
          //         ),
          //       ],
          //     ),
          //     StatefulShellBranch(
          //       routes: <RouteBase>[
          //         GoRoute(
          //           path: AppPath.profile,
          //           name: AppPath.profile,
          //           builder: (BuildContext context, GoRouterState state) {
          //             return const ProfilePage();
          //           },
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          // GoRoute(
          //   path: AppPath.onboarding,
          //   name: AppPath.onboarding,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const OnboardingPage();
          //   },
          // ),

          GoRoute(
            path: AppPath.login,
            name: AppPath.login,
            builder: (BuildContext context, GoRouterState state) {
              return const LogInPage();
            },
          ),

          GoRoute(
            path: AppPath.signup,
            name: AppPath.signup,
            builder: (BuildContext context, GoRouterState state) {
              return const SignupPage();
            },
          ),

          // GoRoute(
          //   path: AppPath.changePassword,
          //   name: AppPath.changePassword,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const ChangePasswordPage();
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.notification,
          //   name: AppPath.notification,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const NotificationPage();
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.realTimeVehicleTracking,
          //   name: AppPath.realTimeVehicleTracking,
          //   builder: (BuildContext context, GoRouterState state) {
          //     final Map<String, dynamic> extra =
          //         state.extra as Map<String, dynamic>;
          //     final BusEntity bus = extra['bus'] as BusEntity;
          //     return RealTimeVehicleTrackingPage(bus: bus);
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.payment,
          //   name: AppPath.payment,
          //   builder: (BuildContext context, GoRouterState state) {
          //     final Map<String, dynamic> extra =
          //         state.extra as Map<String, dynamic>;
          //     final Ticket ticket = extra['ticket'] as Ticket;
          //     final InitiatePaymentUsecase initiatePaymentUsecase =
          //         extra['initiatePaymentUsecase'] as InitiatePaymentUsecase;
          //     final handleCallbackUsecase =
          //         extra['handleCallbackUsecase'] as HandleCallbackUseCase;
          //     return PaymentPage(
          //       ticket: ticket,
          //       initiatePaymentUsecase: initiatePaymentUsecase,
          //       handleCallbackUsecase: handleCallbackUsecase,
          //     );
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.driverTracking,
          //   name: AppPath.driverTracking,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const DriverTrackingPage();
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.qrPage,
          //   name: AppPath.qrPage,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const QRCodePage();
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.sendFeedback,
          //   name: AppPath.sendFeedback,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const SendFeedbackPage();
          //   },
          // ),
          // GoRoute(
          //   path: AppPath.paymentHistory,
          //   name: AppPath.paymentHistory,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const PaymentHistoryPage();
          //   },
          // ),
        ],
      );
}
