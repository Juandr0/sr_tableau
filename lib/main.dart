import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_sr_tableau/router/go_router_scaffold.dart';
import 'package:school_sr_tableau/app_theme.dart';
import 'package:school_sr_tableau/pages/channel_list_page.dart';
import 'package:school_sr_tableau/pages/tableau_list_page.dart';

void main() {
  runApp(MyApp());
}

enum Channels { p1, p2, p3, p4 }

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/p1',
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return GoRouterScaffold(child: child);
          },
          routes: [
            GoRoute(
              path: '/p1',
              builder: (context, state) => TableauListPage(channel: 'p1'),
            ),
            GoRoute(
              path: '/p2',
              builder: (context, state) => TableauListPage(channel: 'p2'),
            ),
            GoRoute(
              path: '/p3',
              builder: (context, state) => TableauListPage(channel: 'p3'),
            ),
            GoRoute(
              path: '/p4ChannelsList',
              builder: (context, state) => const ChannelListPage(),
            ),
            GoRoute(
              path: '/p4Channel',
              builder: (context, state) {
                final channelId = state.extra as int;
                return TableauListPage(channel: 'p4', channelId: channelId);
              },
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      routerConfig: router,
    );
  }
}


// extension Colors on Color {
//   Color get p1 => const Color.fromARGB(255, 74, 148, 177);
//   Color get p2 => const Color.fromARGB(255, 233, 91, 39);
//   Color get p3 => const Color.fromARGB(255, 70, 157, 107);
//   Color get p4 => const Color.fromARGB(255, 170, 43, 154);
// }
