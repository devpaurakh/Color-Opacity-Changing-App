import 'package:coloropacityapp/bloc/switch_bloc/switch_bloc.dart';
import 'package:coloropacityapp/bloc/switch_bloc/switch_event.dart';
import 'package:coloropacityapp/bloc/switch_bloc/switch_state.dart';
import 'package:coloropacityapp/ui/imagepicker/image_picker.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Color Opacity Changing App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<SwitchBloc, SwitchState>(
                        buildWhen: (previous, current) =>
                            previous.isSwitched != current.isSwitched,
                        builder: (context, state) {
                          return Switch(
                              value: state.isSwitched,
                              onChanged: (newvalue) {
                                context
                                    .read<SwitchBloc>()
                                    .add(enableOrDisableSwitch());
                              });
                        })
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(state.sliderValue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
                  return Slider(
                      value: state.sliderValue,
                      onChanged: (newValue) {
                        context
                            .read<SwitchBloc>()
                            .add(slider(sliderValue: newValue));
                      });
                }),
                Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: CupertinoButton(
                        child: const Text("Image Picker"), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ImagePickerScreen()));
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
