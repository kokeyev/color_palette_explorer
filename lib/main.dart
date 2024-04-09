import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'generate.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/generate': (context) => Generate(),
      },
      debugShowCheckedModeBanner: false,
      title: 'N factorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  int hovered_index = -1;
  List<int> is_hovered = [-1, -1];

  final List<String> _colorss = [
    "Red", "Orange", "Brown", "Yellow", "Green", "Blue", "Purple", "Pink", "Gray", "Black", "White"
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.brown,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.white12,
    Colors.black,
    Colors.white
  ];

  final List<String> _styles = [
    "Warm", "Cold", "Bright", "Dark", "Pastel", "Vintage", "Monochromatic", "Gradient", "Rainbow",
  ];

  List<Color> _list1 = [
    HexColor("#CDB4DB"),
    HexColor("#ffc8dd"),
    HexColor("#ffafcc"),
    HexColor("#cdb4db"),
    HexColor("#a2d2ff"),
  ];

  List<Color> _list2 = [
    HexColor("#cdb4db"),
    HexColor("#a2d2ff"),
    HexColor("#CDB4DB"),
    HexColor("#ffc8dd"),
    HexColor("#ffafcc"),
  ];

  List<List> _list = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    _list = [_list1, _list2,];
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                Expanded(flex: 60, child: Text("Color Palette Explorer")),
                Expanded(flex: 20, child: TextButton(child: Text("Generate"), onPressed: () { Navigator.of(context).pushNamed('/generate'); },)),
                Expanded(flex: 10, child: TextButton(child: Text("Sign in"), onPressed: () {  },)),
                Expanded(flex: 10, child: TextButton(child: Text("Sign up"), onPressed: () {  },)),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.35,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Expanded(flex: 1, child: Center(child: Text("Colors", textAlign: TextAlign.center,))),
                        Expanded(
                            flex: 3,
                            child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 2 / 1,
                                ),
                                itemCount: _colors.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(width: 1, color: Colors.black)),
                                        child: Icon(
                                          Icons.circle,
                                          color: _colors[index],
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(left: 10), child: Text(_colorss[index]),),
                                    ],
                                  );
                                },
                            ),
                        ),
                      ],
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Expanded(flex: 1, child: Center(child: Text("Styles", textAlign: TextAlign.center,))),
                        Expanded(
                          flex: 3,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: 2 / 1,
                            ),
                            itemCount: _styles.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(_styles[index]);
                            },
                          ),
                        ),
                      ],
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Expanded(flex: 1, child: Center(child: Text("Amount", textAlign: TextAlign.center,))),
                        Expanded(
                            flex: 3,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio: 2 / 1,
                              ),
                              itemCount: 9,
                              itemBuilder: (BuildContext context, int index) {
                                return Text((index+1).toString());
                              },
                            ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
          Expanded(child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2 / 1,
            ),
            padding: EdgeInsets.zero,
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(_list[index].length, (ind) {
                  return Container(
                    height: 125,
                    width: is_hovered[0] == -1 ? 68 : is_hovered[0] != index ? 68 : is_hovered[1] == ind ? 68 * 2 : 51,
                    child: MouseRegion(
                      onEnter: (details) => setState(() { is_hovered[0] = index; is_hovered[1] = ind;}),
                      onExit: (details) => setState(() {
                        is_hovered[0] = -1;
                        is_hovered[1] = -1;
                      }),
                      child: Container(
                        child: Center(
                            child: Text((is_hovered[0] == index && is_hovered[1] == ind) ? ColorToHex(_list[index][ind]).toString() : "", textAlign: TextAlign.center,)),
                        color: _list[index][ind],
                      ),
                    ),
                  );
                }
                ),

              );
            },
          ),
          ),
        ],
      ),
    );
  }
}
