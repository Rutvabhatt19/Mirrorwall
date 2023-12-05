import 'package:flutter/material.dart';
import 'package:mirror_wall/Screen1.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splashscreenstate();
  }
}
class Splashscreenstate extends State<Splashscreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen1(),));
    },);
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    _animationController.addStatusListener((status) {setState(() {

    });});
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                    turns: _animationController,
                    child: Image.asset('Assates/logo.png',height: 70,width: 110,fit: BoxFit.fill,)),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Mirror Wall',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}