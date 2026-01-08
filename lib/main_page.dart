import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ويكيبيديا", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                username,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            
            )
  
            ,
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("الإشارات المرجعية"),
            ),
            ListTile(leading: Icon(Icons.history), title: Text("التاريخ")),
            ListTile(leading: Icon(Icons.settings), title: Text("الإعدادات")),
          ],
        ),
      ),
      body: const Center(
        child: Text("مرحباً بك في ويكيبيديا", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
