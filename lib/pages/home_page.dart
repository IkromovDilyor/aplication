import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  String data;
  static final  String id="home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin{
AnimationController _controller;
Animation _animation;
@override
void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(
        vsync:this,
    duration: Duration(milliseconds: 1000));

    _animation=Tween(
      begin: 200.0,
      end: 120.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn)
    )..addStatusListener((AnimationStatus status) {
      if(status==AnimationStatus.completed){
    _controller.repeat(reverse: true);
      }

    });

  }


  @override
  void dispose(){
  super.dispose();
  _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("PDP"),

      ),
body: Center(
  child: AnimatedBuilder(animation: _animation,
  builder: (ctx,ch)=>Container(
  width: 200,
    height: 200,
    margin: EdgeInsets.only(top: _animation.value,),
    child: Image.asset("assets/images/top.jpg"),
  ),),

),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
    _controller.forward();
        }

      ),



    );
  }
}