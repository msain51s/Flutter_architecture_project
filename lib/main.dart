import 'package:cgi_test/injection_container.dart';
import 'package:cgi_test/presentation/bloc/random_data/random_data_bloc.dart';
import 'package:cgi_test/presentation/bloc/random_data/random_data_event.dart';
import 'package:cgi_test/presentation/pages/random_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getId<RandomDataBloc>()..add(FetchRandomData()),
        child: RandomDataView(),),

    );
  }
}
