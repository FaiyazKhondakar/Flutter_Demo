import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: const Icon(Icons.messenger_outline,color: Colors.black,),
        backgroundColor: Colors.amber,
      ),

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        // leading: const Icon(Icons.flutter_dash_sharp, color: Colors.black, size: 32,),
        actions: [IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/login');}, icon: const Icon(Icons.logout) )],
        title: const Text('Home',style: TextStyle(color: Colors.black),),),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Center(child: Icon(Icons.flutter_dash_rounded,size: 100,)),),
            ListTile(leading: const Icon(Icons.home_filled),title: const Text('Home'),onTap: (){Navigator.pushReplacementNamed(context, '/home',arguments: {'msg': 'Welcome Faiyaz'});},),
            ListTile(leading: const Icon(Icons.home_filled),title: const Text('Product'),onTap: (){Navigator.pushReplacementNamed(context, '/products');},),

          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(args['msg'])
          ],
        ),
      ),
    );
  }
}
