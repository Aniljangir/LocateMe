import 'dart:async';
import 'dart:developer';

import 'package:LocateMe/src/feature/map/model/location_model.dart';
import 'package:LocateMe/src/feature/map/states/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeCubit extends Cubit<BaseState> {
  HomeCubit() : super(ViewTypeState(isMapView: true));

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Completer<GoogleMapController>? controller;
  bool isMapView = true;
  bool isMapCreated = false;
  LocationModel? model;

  // Function to change view types
  void switchViewType() {
    isMapView = !isMapView;
    emit(ViewTypeState(isMapView: isMapView));
  }

  // function to redirect to specific location
  void animateToView(LocationModel model) {
    createMarker(model);
    this.model = model;
    isMapView = true;
    emit(ViewTypeState(isMapView: isMapView));
  }

  // for creating a marker
  void createMarker(LocationModel model) {
    final marker = Marker(
      markerId: MarkerId(model.name),
      position: LatLng(model.latitude, model.longitude),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: model.name,
        // snippet: 'address',
      ),
    );

    markers.clear();
    markers[MarkerId(model.name)] = marker;
  }

  // animate map to specified location
  Future<void> _goToTheLocation(LocationModel model) async {
    if (controller == null) return;
    log("_goToTheLocation $model");
    CameraPosition position = CameraPosition(
        target: LatLng(model.latitude, model.longitude),
        zoom: 15.151926040649414);
    final GoogleMapController controller1 = await controller!.future;
    await controller1.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  void completeMap(GoogleMapController controller) {
    if (model != null) {
      _goToTheLocation(model!);
    }
  }
}
