import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/components/error_screen.dart';
import 'package:teststore/components/load_indicator.dart';
import 'package:teststore/features/home/presentation/pages/home_screen.dart';

import '../bloc/home_bloc.dart';
import 'home_screen.dart';

class HomeBLoCScreen extends StatelessWidget {
  const HomeBLoCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoadingState) {
            return const LoadIndicator();
          }
          if (state is HomeLoadedState) {
            return HomeScreen(
              homeStorePhones: state.phones,
              bestSellerPhones: state.bestPhones,
            );
          }
          if (state is HomeErrorState) {
            return ErrorScreen(
              message: state.message,
              image: state.image,
            );
          }
          return const ErrorScreen();
        },),
      ),
    );
  }
}
