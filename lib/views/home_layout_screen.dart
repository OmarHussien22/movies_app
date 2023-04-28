import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      buildWhen: (previous, current) => current is BottomNavBarchangeState,
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: cubit.currentIndex,
            onTap: (value) => cubit.changeIndex(value),
            items: cubit.items,
          ),
        );
      },
    );
  }
}
