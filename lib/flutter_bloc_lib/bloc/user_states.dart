import 'package:bloc_start/flutter_bloc_lib/models/users.dart';

abstract class UserState{}

class EmptyState extends UserState{}

class LoadingState extends UserState{}

class LoadedState extends UserState{
  List<User> loadedUsers;
  LoadedState({required this.loadedUsers});
}

class ErrorState extends UserState{}