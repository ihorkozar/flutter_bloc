import 'package:bloc_start/flutter_bloc_lib/models/users.dart';
import 'package:bloc_start/flutter_bloc_lib/servises/users_api.dart';

class UsersRepository {
  final UsersApiProvider _apiProvider = UsersApiProvider();

  Future<List<User>> getAllUsers() => _apiProvider.getUserList();
}
