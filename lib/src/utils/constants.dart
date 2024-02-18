import 'package:LocateMe/src/feature/map/model/location_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition initialPosition = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

 List<LocationModel> listOfLocation =  [
      LocationModel(
        name: 'Paris',
        latitude: 48.83579746243093,
        longitude: 2.3291015625000004,
      ),
      LocationModel(
        name: 'Britain',
        latitude: 54.50832650029076,
        longitude: -2.1313476562500004,
      ),
      LocationModel(
        name: 'United States',
        latitude: 36.03133177633189,
        longitude: -100.01953125000001,
      ),
      LocationModel(
        name: 'Brazil',
        latitude: -14.944784875088372,
        longitude: -49.39453125000001,
      ),
      LocationModel(
        name: 'India',
        latitude: 19.311143355064655,
        longitude: 77.34375000000001,
      ),
    ];
