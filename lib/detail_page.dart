import 'package:flutter/material.dart';
import 'datauser/userdata.dart';

class DetailPage extends StatelessWidget {
  final UserApi user;

  DetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    final warnaTema = Colors.blue;
    final gayaLabel = TextStyle(color: Colors.grey, fontSize: 14);
    final gayaIsi = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
        centerTitle: true,
        backgroundColor: warnaTema,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            
            Icon(Icons.person, size:70, color: warnaTema), 
            
            SizedBox(height: 25),

            Text("Nama", style: gayaLabel), 
            Text(user.name, style: gayaIsi), 
            
            SizedBox(height: 25),

            Text("Email", style: gayaLabel),
            Text(user.email, style: gayaIsi),

            SizedBox(height: 25),

            Text("Kota", style: gayaLabel),
            Text(user.city, style: gayaIsi),

            SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: warnaTema),
              onPressed: () => Navigator.pop(context),
              child: Text("KEMBALI", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}