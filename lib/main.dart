import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [



      ],
    );
  }
}


Widget sliverAppBar1(){
  return SliverAppBar(
    title: Text("Sliver App bar"),



  );
}


