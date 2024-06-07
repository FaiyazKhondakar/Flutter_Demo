import 'package:flutter/material.dart';


class ProductsRoute extends StatefulWidget {
  const ProductsRoute({super.key});

  @override
  State<ProductsRoute> createState() => _ProductsRouteState();
}

class _ProductsRouteState extends State<ProductsRoute> {
  var MyItems=[
    {'name':'perfume' , 'image' : 'images/d.jpg' , 'price': '50' , 'stock' : '500'},
    {'name':'sandals' , 'image' : 'images/c.jpg' , 'price': '10', 'stock' : '100'},
    {'name':'watch' , 'image' : 'images/b.jpg' , 'price': '100', 'stock' : '1000'},
    {'name':'t-shirt' , 'image' : 'images/a.jpg' , 'price': '8', 'stock' : '800'},
    {'name':'perfume' , 'image' : 'images/d.jpg' , 'price': '50' , 'stock' : '500'},
    {'name':'sandals' , 'image' : 'images/c.jpg' , 'price': '10', 'stock' : '100'},
    {'name':'watch' , 'image' : 'images/b.jpg' , 'price': '100', 'stock' : '1000'},
    {'name':'t-shirt' , 'image' : 'images/a.jpg' , 'price': '8', 'stock' : '800'},
    {'name':'perfume' , 'image' : 'images/d.jpg' , 'price': '50' , 'stock' : '500'},
    {'name':'sandals' , 'image' : 'images/c.jpg' , 'price': '10', 'stock' : '100'},
    {'name':'watch' , 'image' : 'images/b.jpg' , 'price': '100', 'stock' : '1000'},
    {'name':'t-shirt' , 'image' : 'images/a.jpg' , 'price': '8', 'stock' : '800'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(Icons.messenger_outline,color: Colors.black,),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        // leading: const Icon(Icons.flutter_dash_sharp, color: Colors.black, size: 32,),
        actions: [IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/login');}, icon: Icon(Icons.logout) )],
        title: const Text('Products',style: TextStyle(color: Colors.black),),),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Center(child: Icon(Icons.flutter_dash_rounded,size: 100,)),),
            ListTile(leading: const Icon(Icons.home_filled),title: const Text('Home'),onTap: (){Navigator.pushReplacementNamed(context, '/home',arguments: {'msg': 'Welcome Faiyaz'});},),
            ListTile(leading: const Icon(Icons.home_filled),title: const Text('Product'),onTap: (){Navigator.pushReplacementNamed(context, '/products');},),

          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 4),
        itemCount: MyItems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              print(MyItems[index]['stock']);
            },
            child: Card(
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Image.asset(MyItems[index]['image']! , fit: BoxFit.cover,)),
                    ) ,

                  Padding(padding: const EdgeInsets.all(3.0),child: Text(MyItems[index]['name']!,style: const TextStyle(fontWeight: FontWeight.bold),),),
                  Padding(padding: const EdgeInsets.all(3.0),child: Text('\$${MyItems[index]['price']!}'),)
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}

