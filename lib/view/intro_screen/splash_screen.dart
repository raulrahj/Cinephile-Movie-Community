import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/logic/bloc/post/post_bloc.dart';
import 'package:open_box/logic/bloc/movie_info/movie_info_bloc.dart';

const String logo =
    'https://as1.ftcdn.net/v2/jpg/00/81/64/90/1000_F_81649086_py4My4KShiyaNNiyJWwP9l1mRolqC1Or.jpg';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  // @override
  // void initState() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: [SystemUiOverlay.bottom]);

  //   super.initState();
  // }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      print(result);
      // connectionResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieInfoBloc>().add(const MovieInfoEvent.getTrending());
      context.read<MovieInfoBloc>().add(const MovieInfoEvent.getNewReleased());
      context.read<PostBloc>().add(GetTimeline());
    });
    _navigation(context);
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: const NetworkImage(
        //         urlImg,
        //       ),
        //       colorFilter: ColorFilter.mode(
        //           Colors.black.withOpacity(0.6), BlendMode.darken),
        //       fit: BoxFit.cover),
        // ),
        child: Center(
          child: FadeTransition(
              opacity: _animation,
              child: SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: logo,
                  // placeholder: (BuildContext context, String s) {
                  //   return const ProgressCircle();
                  // },
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future _navigation(context) async {
    final isLogged = await SharedService.isLoggedIn();
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, isLogged ? '/main' : '/login', (route) => false);
    });
  }

  // import 'package:connectivity_plus/connectivity_plus.dart';
  Future<bool> isOnline() async {
    bool isOnline = false;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isOnline = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isOnline = true;
      // I am connected to a wifi network.
    }
    return isOnline;
  }
}
