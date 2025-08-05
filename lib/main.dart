import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              toolbarHeight: 60,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                background: Image(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg",
                  ),
                  fit: BoxFit.fitWidth,
                ),
                title: Text(
                  "Hi! Karanbir Singh",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            SliverAppBar(
              backgroundColor: Colors.purpleAccent,
              expandedHeight: 180,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$ 12345",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    Text(
                      "Current Balance",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                title: Text("Wallet", style: TextStyle(color: Colors.white)),
              ),
            ),

            SliverAppBar(
              backgroundColor: Colors.lightBlueAccent,

              pinned: true,
              expandedHeight: 120,
              toolbarHeight: 120,

              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Quick Actions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        quickActionBuild(
                          actionLabal: 'Top up',
                          actionIcon: Icons.add,
                        ),
                        quickActionBuild(
                          actionLabal: 'Send',
                          actionIcon: Icons.send,
                        ),
                        quickActionBuild(
                          actionLabal: 'Request',
                          actionIcon: Icons.call_received,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverFillRemaining(),
          ],
        ),
      ),
    );
  }

  Widget quickActionBuild({
    required String actionLabal,
    required IconData actionIcon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(actionIcon),

        Text(actionLabal, style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
