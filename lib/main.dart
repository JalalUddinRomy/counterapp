import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Counterstateful(),
   );
  }

}
class Counterstateful extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Counterstate();

  }

}
class Counterstate extends State<Counterstateful>{
  int count=0;
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Button pressed $count times"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count :",style: TextStyle(fontSize: 20),),
            Text(count.toString(),style: Theme.of(context).textTheme.displayLarge,) ,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 130,right: 10),
                  child: ElevatedButton(onPressed: (){
                    count=count+1;
                    setState(() {
                      if (count >= 5) {
                        _showDialog();
                      }

                    });
                  }, child: Icon(Icons.add)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 130),
                  child: ElevatedButton(onPressed: (){
                    if(count>0){
                      count=count-1;
                    }
                    setState(() {
                    });
                  }, child: Icon(Icons.remove)),
                ),


              ],
            )
          ],
        ),
        ),
    );
  }

}

