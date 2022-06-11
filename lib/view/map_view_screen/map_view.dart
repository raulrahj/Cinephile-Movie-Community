import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_box/app.dart';
import 'package:open_box/view/widgets/common.dart';

class NearbyTheatre extends StatefulWidget {
  const NearbyTheatre({Key? key}) : super(key: key);

  @override
  State<NearbyTheatre> createState() => _NearbyTheatreState();
}

class _NearbyTheatreState extends State<NearbyTheatre> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(9.9312, 76.2673), zoom: 14.0);
  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(33.15478, -132.78945),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby Theatres',
        ),
        leading: pop(context),
      ),
      body: Column(children: [
        AspectRatio(
          aspectRatio: 1.9 / 3,
          child: GoogleMap(
            initialCameraPosition: initialPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        )
      ]),
    );
  }

  Future<void> gotoLake() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
