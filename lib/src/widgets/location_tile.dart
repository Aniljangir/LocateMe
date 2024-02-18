import 'package:LocateMe/src/core/base_stateless_view.dart';
import 'package:LocateMe/src/feature/map/controller/home_cubit.dart';
import 'package:LocateMe/src/feature/map/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationTile extends BaseStateLess {
  final LocationModel location;

  const LocationTile({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        onTap: () {
          cubit.animateToView(location);
        },
        title: Text(location.name),
        subtitle: Text("${location.latitude} , ${location.longitude}"),
      ),
    );
  }
}
