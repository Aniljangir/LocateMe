import 'dart:async';

import 'package:LocateMe/src/core/base_stateless_view.dart';
import 'package:LocateMe/src/feature/map/controller/home_cubit.dart';
import 'package:LocateMe/src/utils/constants.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends BaseStateLess {
  MapView({super.key});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    cubit.controller = _controller;

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialPosition,
      markers: cubit.markers.values.toSet(),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        cubit.completeMap(controller);
      },
    );

  }
}
