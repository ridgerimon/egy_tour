import 'package:egy_tour/layout/cubit/cubit.dart';
import 'package:egy_tour/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutAppCubit, HomeLayoutStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = HomeLayoutAppCubit.get(context);
        return Scaffold(
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: cubit.items,
          ),
        );
      },
    );
  }
}
