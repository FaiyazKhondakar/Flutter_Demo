import 'package:flutter/material.dart';
import 'package:module_6/calculate.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> with SingleTickerProviderStateMixin{

  late final TabController _tabController =  TabController(length: 4, vsync: this);


  //part of bottom navbar
  // int _selectedIndex =0;
  // List <Widget> screen = [
  //   const Text('Home'),
  //   const Text('Profile'),
  //   const Text('Cart'),
  //   const Text('Settings'),
  // ];
  // end part of bottom navbar
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> args = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {},
      //   child: const Icon(Icons.messenger_outline,color: Colors.black,),
      //   backgroundColor: Colors.amber,
      // ),

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        // leading: const Icon(Icons.flutter_dash_sharp, color: Colors.black, size: 32,),
        actions: [IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/login');}, icon: const Icon(Icons.logout) )],
        title: const Text('Home',style: TextStyle(color: Colors.black),),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          // unselectedLabelColor: Colors.grey,
          // indicatorWeight: 5,
          tabs: const [
            Tab(icon: Icon(Icons.feed),text: 'feed',),
            Tab(icon: Icon(Icons.person),text: 'profile'),
            Tab(icon: Icon(Icons.calculate),text: 'Calculate'),
            Tab(icon: Icon(Icons.shopping_cart),text: 'cart'),
          ],),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Feed')),
            Center(child: Text('Profile')),
            Center(child: Calculate(),),
            Center(child: Text('Cart')),
            ]),



// Drawer


      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(child: Center(child: Icon(Icons.flutter_dash_rounded,size: 100,)),),
      //       ListTile(leading: const Icon(Icons.home_filled),title: const Text('Home'),onTap: (){Navigator.pushReplacementNamed(context, '/home',arguments: {'msg': 'Welcome Faiyaz'});},),
      //       ListTile(leading: const Icon(Icons.home_filled),title: const Text('Product'),onTap: (){Navigator.pushReplacementNamed(context, '/products');},),
      //
      //     ],
      //   ),
      // ),


      //bottom nav bar

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   backgroundColor: Colors.amber,
      //   selectedItemColor: Colors.amber.shade800,
      //   unselectedItemColor: Colors.amber.shade400,
      //   showUnselectedLabels: true,
      //   unselectedFontSize: 15,
      //   selectedLabelStyle: const TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 17
      //   ),
      //   onTap: (selectedIndex){
      //     _selectedIndex =selectedIndex;
      //     setState(() {
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      //   ],),



      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(args['msg']),
      //       screen[_selectedIndex]
      //     ],
      //   ),
      // ),
    );
  }
}
