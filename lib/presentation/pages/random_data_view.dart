import 'package:cgi_test/presentation/bloc/random_data/random_data_bloc.dart';
import 'package:cgi_test/presentation/bloc/random_data/random_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<RandomDataBloc, RandomDataState>(builder: (context, state) {
      if (state is RandomDataLoading) {
        return CircularProgressIndicator();
      } else if (state is RandomDataLoaded) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Container(child: Text(state.randomEntity.content))],
        );
      } else if (state is RandomDataError) {
        return Text(state.message);
      }
      return Container();
    }));
  }
}
