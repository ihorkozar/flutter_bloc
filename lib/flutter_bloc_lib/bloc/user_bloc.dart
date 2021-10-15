import 'package:bloc_start/flutter_bloc_lib/bloc/user_event.dart';
import 'package:bloc_start/flutter_bloc_lib/bloc/user_states.dart';
import 'package:bloc_start/flutter_bloc_lib/models/users.dart';
import 'package:bloc_start/flutter_bloc_lib/servises/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UsersRepository repository = UsersRepository();

  UserBloc({required this.repository}) : super(EmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if(event is LoadEvent) {
      yield LoadingState();
      try {
        List<User> _loadedUserList = await repository.getAllUsers();
        yield LoadedState(loadedUsers: _loadedUserList);
      } catch (_) {
        yield ErrorState();
      }
    } else if (event is ClearEvent) {
      yield EmptyState();
    }
  }}
