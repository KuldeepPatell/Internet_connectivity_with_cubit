import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_with_cubit/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Connected) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Connected"),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Lost"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetState.Connected) {
              return Text(
                "Connected!",
                style: TextStyle(color: Colors.green.shade400),
              );
            } else if (state == InternetState.Lost) {
              return Text(
                "Device not connected to internet",
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Text("Loading...!");
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        // if (state is InternetConnectState) {
        //   return Text(
        //     "Connected!",
        //     style: TextStyle(color: Colors.green.shade400),
        //   );
        // } else if (state is InternetLostState) {
        //   return Text(
        //     "Device not connected to internet",
        //     style: TextStyle(color: Colors.red),
        //   );
        // } else {
        //   return Text("Loading...!");
        // }
        //   },
        // ),
      )),
    );
  }
}
