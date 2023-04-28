import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/services/dio_helper.dart';
import 'package:movies/services/ob_server.dart';
import 'package:movies/splach_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeLayoutCubit()),
      ],
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: HomeLayoutCubit.get(context).mode
                ? lightTheme(context)
                : darkTheme(context),
            home: const SplachScreen(),
          );
        },
      ),
    );
  }
}
