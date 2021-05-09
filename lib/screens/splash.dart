
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(width: double.infinity,height: double.infinity, child: CustomPaint(
          size: Size(width,height), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),

        ), alignment: Alignment.bottomLeft,),
        Container(
          decoration: BoxDecoration(),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 30,),
             Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(Icons.coronavirus_outlined, color: Colors.red,size: 100,),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Covid Count',
                    style: TextStyle(color: Colors.red, fontSize: 26),
                  ),
               ],
             ),
              SizedBox(
                height: 50,
              ),
              Text('Social Distancing is the best medicine', style: TextStyle(color: Colors.white, fontSize: 20),),
              ElevatedButton(onPressed: ()=>{}, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lets Get Started', style: TextStyle(color: Colors.red, fontSize: 18),),
              ),style:
                ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.white),backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                )
                ,) ,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Effordea.com', style: TextStyle(color: Colors.white, fontSize: 12),),
              )
            ],
          ),
        ),]
      ),
    );
  }
}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 255, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.66);
    path_0.lineTo(0,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width,size.height*0.33);
    path_0.quadraticBezierTo(size.width*0.75,size.height*0.5,size.width*0.5,size.height*0.50);
    path_0.quadraticBezierTo(size.width*0.25,size.height*0.5,0,size.height*0.66);
    path_0.close();
    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
