import 'package:bloc_start/flutter_bloc_lib/bloc/user_bloc.dart';
import 'package:bloc_start/flutter_bloc_lib/bloc/user_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is EmptyState) {
          return const Center(
            child: Text('No data'),
          );
        } if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } if (state is LoadedState) {
          return ListView.builder(
            itemCount: state.loadedUsers.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: index % 2 == 0 ? Colors.white : Colors.cyanAccent,
                leading: Text('ID: ${state.loadedUsers[index].id}'),
                title: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('Name: ${state.loadedUsers[index].name}'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('email: ${state.loadedUsers[index].email}'),
                        Text('phone: ${state.loadedUsers[index].phone}')
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },
          );
        } if(state is ErrorState){
          return const Center(child: Text('Error'));
        }else {
          return const Center(
            child: Text('Error, try later'),
          );
        }
      },
    );
  }
}
