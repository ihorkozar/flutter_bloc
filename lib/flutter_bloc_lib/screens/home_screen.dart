import 'package:bloc_start/flutter_bloc_lib/custom_widgets/action_buttons.dart';
import 'package:bloc_start/flutter_bloc_lib/custom_widgets/user_list.dart';
import 'package:bloc_start/flutter_bloc_lib/servises/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  final repository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(repository: repository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Users list'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 10),
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        )
      ),
    );
  }
}
