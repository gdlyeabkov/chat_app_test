import 'dart:html' as html;
import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var appCubit = AppCubit();

  @override
  void initState() {
    super.initState();
    appCubit.init();
    html.window.onBeforeUnload.listen((event) async{
      // do something
      if (appCubit.state.selectedChat.id > -1)
        appCubit.saveData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (appCubit.state.timer != null)
      appCubit.state.timer?.cancel();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat app test',
      home: BlocProvider(
        create: (BuildContext context) => appCubit,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (BuildContext context, state) {
            return MyHomePage(
              appCubit: appCubit!,
            );
          },
        ),
      ),
    );
  }
}
