import 'package:bloc_start/flutter_bloc_lib/bloc/user_bloc.dart';
import 'package:bloc_start/flutter_bloc_lib/bloc/user_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            bloc.add(LoadEvent());
          },
          child: const Text('Load'),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            bloc.add(ClearEvent());
          },
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
