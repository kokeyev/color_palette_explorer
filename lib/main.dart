import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'N factorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int hovered_index = -1;

  List<Color> _colors = [
    Colors.pinkAccent,
    Colors.yellow,
    Colors.red,
    Colors.cyan,
    Colors.brown
  ];

  final ScrollController _controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _controller,
        thumbVisibility: true,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Expanded(flex: 60, child: Text("Color Palette Explorer")),
                  Expanded(flex: 20, child: TextButton(child: Text("Generate"), onPressed: () {  },)),
                  Expanded(flex: 10, child: TextButton(child: Text("Sign in"), onPressed: () {  },)),
                  Expanded(flex: 10, child: TextButton(child: Text("Sign up"), onPressed: () {  },)),
                ],
              ),
            ),
            Expanded(
              flex: 35,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(flex: 1, child: Center(child: Text("Colors", textAlign: TextAlign.center,))),
                          Expanded(flex: 3, child: Container(color: Colors.red,)),
                        ],
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(flex: 1, child: Center(child: Text("Styles", textAlign: TextAlign.center,))),
                          Expanded(flex: 3, child: Container(color: Colors.green,)),
                        ],
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(flex: 1, child: Center(child: Text("Amount", textAlign: TextAlign.center,))),
                          Expanded(flex: 3, child: Container(color: Colors.blue,)),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 55,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {

                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {

                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),



                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {

                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {

                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),



                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {

                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(5, (index) {

                              return Container(
                                height: 125,
                                width: hovered_index == -1 ? 68 : hovered_index == index ? 68 * 2 : 51,
                                child: MouseRegion(
                                  onEnter: (details) => setState(() => hovered_index = index),
                                  onExit: (details) => setState(() {
                                    hovered_index = -1;
                                  }),
                                  child: Container(
                                    color: _colors[index],
                                  ),
                                ),
                              );
                            }
                            ),

                          ),
                        ),



                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
