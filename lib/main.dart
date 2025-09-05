import 'package:arz8/Screens/Details/bloc/detail_screen_bloc.dart';
import 'package:arz8/Screens/Home/bloc/homebloc_bloc.dart';
import 'package:arz8/Screens/Home/home.dart';
import 'package:arz8/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
ValueNotifier<bool> isthemDark = ValueNotifier(false);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  sharedPreferences = await SharedPreferences.getInstance();
  isthemDark.value = sharedPreferences.getBool('isdark') ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeblocBloc()),
        BlocProvider(create: (context) => DetailScreenBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isthemDark,
      builder: (context, value, child) {
        return MaterialApp(
          theme: lighttheme,
          darkTheme: darkheme,
          themeMode: isthemDark.value ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,

          home: HomeScreen(),
        );
      },
    );
  }
}
