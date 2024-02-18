import 'package:LocateMe/src/core/base_stateless_view.dart';
import 'package:LocateMe/src/feature/map/controller/home_cubit.dart';
import 'package:LocateMe/src/feature/map/states/home_states.dart';
import 'package:LocateMe/src/feature/map/view/location_list.dart';
import 'package:LocateMe/src/feature/map/view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseStateLess {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, BaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Locate Me'),
            actions: [
              ClipOval(
                child: Material(
                  color: Colors.deepPurple, // Button color
                  child: InkWell(
                    splashColor: Colors.red, // Splash color
                    onTap: () {
                      cubit.switchViewType();
                    },
                    child: SizedBox(
                        width: 45,
                        height: 45,
                        child: Icon(
                          cubit.isMapView ? Icons.menu : Icons.map,
                          color: Colors.white,
                        )),
                  ),
                ),
              )
            ],
          ),
          body: cubit.isMapView ? MapView() : const LocationList(),
        );
      },
    );
  }
}
