import 'package:flutter/material.dart';
import 'package:open_box/data/core/di/injectable.dart';
import 'package:open_box/logic/bloc/trending/trending_bloc.dart';
import 'package:open_box/view/chat_screen/g_chat_screen.dart';
import 'package:open_box/view/chat_screen/p_chat_screen.dart';
import 'package:open_box/view/discover/new_releases/new_release_detailed.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/home/home_screen.dart';
import 'package:open_box/view/notification_screen/notification_screen.dart';
import 'package:open_box/view/map_view_screen/map_view.dart';
import 'package:open_box/view/new_feed/new_post_screen.dart';
import 'package:open_box/view/profile_screen/profile_edit.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/view/register/login_screen.dart';
import 'package:open_box/view/widgets/bottom_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendingBloc>(
          create: (context) => getIt<TrendingBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Open Box",
        theme: ThemeData(
          // brightness: Brightness.dark,
          appBarTheme:
              AppBarTheme(backgroundColor: Theme.of(context).primaryColor),
          primaryColor: const Color(0xFF1C306D),
          primaryColorLight: const Color(0xFFBBC1D3),
          iconTheme: const IconThemeData(color: Color(0xFFFFAD32)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
          ),
        ),
        home: const LoginScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/personal_chat': (context) => const PChatScreen(),
          '/group_chat': (context) => GChatScreen(),
          '/new_release_detailed': (context) => const NewReleaseDetailed(),
          '/comments': (context) => const CommentsScreen(),
          '/notifications': (context) => const NotificationsScreen(),
          '/account': (context) => const ProfileScreen(),
          '/profile_edit': (context) => const ProfileEditScreen(),
          '/nearby_theatre': (context) => const NearbyTheatre(),
          '/new_post': (context) => const NewPost()
        },
      ),
    );
  }
}
