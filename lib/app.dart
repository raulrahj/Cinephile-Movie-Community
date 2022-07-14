import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/movie_info/movie_info_bloc.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/logic/cubit/auth/authentication_cubit.dart';
import 'package:open_box/view/home/home_screen.dart';
import 'package:open_box/data/core/di/injectable.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/intro_screen/splash_screen.dart';
import 'package:open_box/view/register/login_screen.dart';
import 'package:open_box/view/new_feed/new_post_screen.dart';
import 'package:open_box/view/map_view_screen/map_view.dart';
import 'package:open_box/view/chat_screen/g_chat_screen.dart';
import 'package:open_box/view/chat_screen/p_chat_screen.dart';
import 'package:open_box/view/profile_screen/profile_edit.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/notification_screen/notification_screen.dart';
import 'package:open_box/view/discover/movie_detailed.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/user_screen/user_screen.dart';
import 'package:open_box/view/widgets/bottom_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieInfoBloc>(
          create: (context) => getIt<MovieInfoBloc>(),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (context) => getIt<AuthenticationCubit>(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(UserRepo()),
        )
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
        home: const SplashScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/main': (context) => const NavController(),
          '/personal_chat': (context) => const PChatScreen(),
          '/group_chat': (context) => const GChatScreen(),
          '/movie_detailed': (context) => const MovieDetailed(),
          '/comments': (context) => const CommentsScreen(),
          '/notifications': (context) => const NotificationsScreen(),
          '/account': (context) => const ProfileScreen(),
          '/profile_edit': (context) => const ProfileEditScreen(),
          '/nearby_theatre': (context) => const NearbyTheatre(),
          '/new_post': (context) => const NewPost(),
          '/login': (context) => const LoginScreen(),
          '/sign_up': (context) => const SignUpScreen(),
          '/user_screen': (context) => const UserScreen(),
        },
      ),
    );
  }
}
