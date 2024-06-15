import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final GlobalKey<FormState> _forKey = GlobalKey<FormState>();
  final TextEditingController _numOneTEController = TextEditingController();
  final TextEditingController _numTwoTEController = TextEditingController();

  double _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _forKey,
          child: Column(
            children: [
              TextFormField(
                controller: _numOneTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter a number',
                  label: Text('First Number'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid ,color: Colors.amber)
                  ),

                ),
                validator: (String? value){
                  String v = value ?? '';
                  if(v.isEmpty){
                    return 'Enter number properly';
                  }
                  return null;
                },


              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _numTwoTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Number Two'),
                    hintText: 'Enter a number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid ,color: Colors.amber)
                    ),
                  ),
                  validator: (String? value){
                    String v = value ?? '';
                    if(v.isEmpty){
                      return 'Enter number properly';
                    }
                    return null;
                  },


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(onPressed: (){
                        if(_forKey.currentState!.validate()){
                          double numOne = double.tryParse(_numOneTEController.text.trim()) ?? 0;
                          double numTwo = double.tryParse(_numOneTEController.text.trim()) ?? 0;
                          double result = add(numOne, numTwo);
                          _result =result;
                          setState(() {});
                        }
                      },
                          child: const Icon(Icons.add)),
                    )),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(onPressed: (){
                        if(_forKey.currentState!.validate()){
                          double numOne = double.tryParse(_numOneTEController.text.trim()) ?? 0;
                          double numTwo = double.tryParse(_numOneTEController.text.trim()) ?? 0;
                          double result = sub(numOne, numTwo);
                          _result =result;
                          setState(() {});
                        }

                      },
                          child: const Icon(Icons.horizontal_rule)),
                    )),
                    Expanded(child: ElevatedButton(onPressed: ()=>clear(), child: const Text('AC'))),
                  ],
                ),
              ),
              Center(child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Result: $_result' , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),)
            ],
          ),
        ),
      ),
    );
  }

  double add(double numOne , double numTwo){
    double result = numOne +numTwo;
    return result;
  }
  double sub(double numOne , double numTwo){
    double result = numOne - numTwo;
    return result;
  }
  void clear(){
    _numOneTEController.clear();
    _numTwoTEController.clear();
    _result =0 ;
    setState(() {});
  }
}
