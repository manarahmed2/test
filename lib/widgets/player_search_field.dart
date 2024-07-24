import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/data/cubits/player_cubit.dart'; // تأكد من تحديث المسار إذا لزم الأمر

class PlayerSearchField extends StatelessWidget {
  const PlayerSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Search Player',
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6BDF70)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6BDF70)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        onChanged: (query) {
          context.read<PlayersCubit>().searchPlayers(query);
        },
      ),
    );
  }
}
