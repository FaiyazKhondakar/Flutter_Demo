import 'package:flutter/material.dart';
import 'package:module_6/part_water_consume.dart';
import 'package:intl/intl.dart';

class WaterConsume extends StatefulWidget {
  const WaterConsume({super.key});

  @override
  State<WaterConsume> createState() => _WaterConsumeState();
}

class _WaterConsumeState extends State<WaterConsume> {
  List<PartWaterConsume> waterConsumeList= [];
  final TextEditingController _numberOfGlassesTEController = TextEditingController(text: '1');
  final TextEditingController _noteTEController = TextEditingController(text: 'Morning');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: (){
                      // if(_numberOfGlassesTEController.text.trim().isEmpty){
                      //   const noOfGlasses = '1';
                      // }
                      final note = _noteTEController.text.trim();
                      final noOfGlasses = _numberOfGlassesTEController.text.trim();
                      int value = int.tryParse(noOfGlasses)??1;

                      // waterConsumeList.add(PartWaterConsume(value, DateTime.now(),note));
                      waterConsumeList.insert(0,PartWaterConsume(value, DateTime.now(),note));
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(100),
                      )
                    ),
                    child: const Text('Tap here'),
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _numberOfGlassesTEController ,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,

                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                          width: 100,
                          child: TextField(
                            controller: _noteTEController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,

                          )),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  // reverse: true,
                  itemCount: waterConsumeList.length,
                  itemBuilder:  (context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(waterConsumeList[index].noOfGlass.toString(),style: const TextStyle(),),),
                      title: Text(waterConsumeList[index].note),
                      subtitle: Text('Time  ${DateFormat.yMEd().add_jms().format(waterConsumeList[index].time) }'),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.black,),
                          onPressed: () {
                            setState(() {});
                            waterConsumeList.removeAt(index);
                          },
                      ),
                    );
                })
              ],
            ),
          ),
        ),
      )
    );
  }
}
