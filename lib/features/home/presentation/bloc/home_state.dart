part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();  

  @override
  List<Object> get props => [];
}
class HomeEmptyState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<HomeStorePhoneEntity> phones;
  final List<BestSellerPhoneEntity> bestPhones;
  
  const HomeLoadedState({
    required this.phones,
    required this.bestPhones,
  });
}

class HomeErrorState extends HomeState {
  final String message;
  final String image;
  
  const HomeErrorState({
    required this.message,
    required this.image,
  });
}
