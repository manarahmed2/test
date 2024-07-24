import 'package:flutter/material.dart';
import 'package:sports_app/data/models/player.dart'; // تأكد من تحديث المسار إذا لزم الأمر
import 'package:sports_app/widgets/player_image.dart'; // تأكد من تحديث المسار إذا لزم الأمر
import 'package:share_plus/share_plus.dart';

class PlayersList extends StatelessWidget {
  final List<Player> players;

  const PlayersList({required this.players, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          leading: PlayerImage(imageUrl: player.imageUrl),
          title: Text(player.name, style: const TextStyle(color: Colors.white)),
          subtitle: Text(player.type, style: const TextStyle(color: Color(0xff6BDF70))),
          onTap: () => _showPlayerDetailsDialog(context, player),
        );
      },
    );
  }

  void _showPlayerDetailsDialog(BuildContext context, Player player) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.green, width: 2),
        ),
        title: Text(player.name, style: const TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PlayerImage(imageUrl: player.imageUrl),
            Text('Number: ${player.number}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            Text('Country: ${player.country}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            Text('Type: ${player.type}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            Text('Age: ${player.age}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            Text('Yellow Cards: ${player.yellowCards}', style: const TextStyle(color: Colors.white)),
            Text('Red Cards: ${player.redCards}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            Text('Goals: ${player.goals}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            Text('Assists: ${player.assists}', style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.black),
                ),
                textStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () {
                Share.share('The player: ${player.name} from ${player.country}!');
              },
              child: const Text('Share Player'),
            ),
          ],
        ),
      ),
    );
  }
}
