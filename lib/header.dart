import 'package:flutter/material.dart';


class Header extends StatefulWidget{
  final double screenHeight;
  final double screenWidth;

  Header({super.key, required this.screenHeight, required this.screenWidth});
  @override
  Page createState() => Page();
}

class Page extends State<Header> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight * 0.1,
      width: widget.screenWidth,
      child: Row(
        children: <Widget>[
          Expanded(flex: 60, child: TextButton(
              onPressed: () {  },
              child: Text("Color Palette Explorer"))),
          Expanded(flex: 20, child: TextButton(child: Text("Generate"), onPressed: () { Navigator.of(context).pushNamed('/generate'); },)),
          /*
          Expanded(flex: 10, child: TextButton(child: Text("Sign in"), onPressed: () {  },)),
          Expanded(flex: 10, child: TextButton(child: Text("Sign up"), onPressed: () {  },)),
          */
        ],
      ),
    );
  }
}
