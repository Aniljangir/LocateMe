import 'package:LocateMe/src/core/base_stateless_view.dart';
import 'package:LocateMe/src/utils/constants.dart';
import 'package:LocateMe/src/widgets/location_tile.dart';
import 'package:flutter/material.dart';

class LocationList extends BaseStateLess {
  const LocationList({super.key});

  @override
  Widget build(BuildContext context) {
    final locationList = listOfLocation;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: locationList.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LocationTile(
          location: locationList[index],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
