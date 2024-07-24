import 'package:flutter/material.dart';

class PlayersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlayersAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff191F1A),
      centerTitle: true,
      title: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Pla',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            TextSpan(
              text: ' yers',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff6BDF70),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
