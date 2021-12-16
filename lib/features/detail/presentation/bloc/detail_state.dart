part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();  

  @override
  List<Object> get props => [];
}

class DetailEmptyState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final DetailEntity phoneDetails;
  
  const DetailLoadedState({
    required this.phoneDetails,
  });
}

class DetailErrorState extends DetailState {
  String message;
  String image;
  
  DetailErrorState({
    required this.message,
    required this.image,
  });
}

