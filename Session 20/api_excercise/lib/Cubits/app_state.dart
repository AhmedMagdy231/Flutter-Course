part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class GetUserLoading extends AppState {}
class GetUserSuccess extends AppState {}
class GetUserError extends AppState {}
class ChangeFollowing extends AppState{}
