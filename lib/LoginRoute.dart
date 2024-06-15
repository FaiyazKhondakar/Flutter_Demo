import 'package:flutter/material.dart';
import 'package:module_6/HomeRoute.dart';


class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();

    _isObscure = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Icon(Icons.flutter_dash_sharp, color: Colors.black, size: 32,),

        title: const Text('Login',style: TextStyle(color: Colors.black),),),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                margin: const EdgeInsets.fromLTRB(20,0,20,0),
                padding: const EdgeInsets.all(10),
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid ,color: Colors.amber)
                    ),
                    hintText: 'Enter your email',
                  ), ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20,0,20,0),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isObscure =! _isObscure;
                      });
                    },
                      icon: _isObscure?  const Icon(Icons.visibility): const Icon(Icons.visibility_off)  ,),
                    label: const Text('Password'),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid ,color: Colors.amber)
                    ),),),
              ),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, '/home',arguments: {'msg': 'Welcome Faiyaz'});
              },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20,0,20,0),
                    child: Text('Login',style: TextStyle(color: Colors.black),),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}