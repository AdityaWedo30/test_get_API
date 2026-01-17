import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datauser/userdata.dart';
import 'komponent/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserApi> allUsers = [];   
  List<UserApi> filteredUsers = []; 
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  
  void fetchData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      setState(() {
        allUsers = data.map((item) => UserApi.fromJson(item)).toList();
        filteredUsers = allUsers; 
        isLoading = false;
      });
    }
    else{
      setState(() {
        errormessage = 'Gagal memuat data dari server (Error: ${response.statusCode})';
        isLoading = false;
      });
    }
  }

  String errormessage = '';
  void searchUser(String kueri) {
    setState(() {
      filteredUsers = allUsers
          .where((u) => u.name.toLowerCase().contains(kueri.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Pengguna")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: searchUser, 
              decoration: const InputDecoration(
                labelText: "Serach Name",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: isLoading 
              ? const Center(child: CircularProgressIndicator()) 
              : ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) => UserCard(user: filteredUsers[index]),
                ),
          ),
        ],
      ),
    );
  }
}