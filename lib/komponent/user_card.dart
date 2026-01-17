import 'package:flutter/material.dart';
import '../datauser/userdata.dart';
import '../detail_page.dart';

class UserCard extends StatelessWidget {
  final UserApi user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(user.name[0]), 
        ),
        title: Text(user.name),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(user: user),
            ),
          );
        },
      ),
    );
  }
}