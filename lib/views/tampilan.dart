import 'package:flutter/material.dart';

class Tampilan extends StatelessWidget {
  final String step;
  final String ingredient;
  final String video;
  Tampilan({
    @required this.step,  
    @required this.ingredient,
    @required this.video,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Korean Sipcy Pork"),),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 200,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Text(step, 
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
      );
      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      //         return null;
      //       }));
      //     }, 
      //     child: Text("Kembali"))
      //     )
      //     );
    
  }
}