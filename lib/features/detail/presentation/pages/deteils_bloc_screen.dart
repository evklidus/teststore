import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/components/error_screen.dart';
import 'package:teststore/components/load_indicator.dart';
import 'package:teststore/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:teststore/features/detail/presentation/widgets/detail_screen.dart';

class DetailsBLoCScreen extends StatelessWidget {
  const DetailsBLoCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailBloc>(context).add(LoadDetailScreenEvent());
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
          if (state is DetailEmptyState) {
            return const LoadIndicator();
          }
          if (state is DetailLoadingState) {
            return const LoadIndicator();
          }
          if (state is DetailLoadedState) {
            return DetailsScreen(
              phone: state.phoneDetails,
            );
          }
          if (state is DetailErrorState) {
            return ErrorScreen(
              message: state.message,
              image: state.image,
            );
          }
          return const ErrorScreen();
        }),
      ),
    );
  }
}
