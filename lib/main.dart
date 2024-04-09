
import 'package:flutter/services.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'generate.dart';
import 'header.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBcDsC7ZQCA6nrKJMs8_6FhIhEsg0LcoCw",
        projectId: "nfactorial-b0fed",
        messagingSenderId: "425186333795",
        appId: "1:425186333795:web:42c0aa52dcd2d0202f9456"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  CollectionReference collRef = FirebaseFirestore.instance.collection('card');

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



  List _list = [];

  _string_to_hexcolor(List l) {
    List<Color> ans = List.filled(l.length, Colors.red);
    for (int i = 0; i < l.length; i++) {
      ans[i] = Color(int.parse(l[i], radix: 16));
    }
    return ans;
  }

  List<String> getColorValues(String colorString) {
    String colorsSubstring = colorString.substring(10, colorString.length - 1);
    List<String> colorValues = colorsSubstring.split(', ');
    colorValues = colorValues.map((color) => color.replaceAll(RegExp('[^a-zA-Z0-9]'), '')).toList();
    return colorValues;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }




  getData() async {

    try {
      CollectionReference collRef = FirebaseFirestore.instance.collection('card');
      await collRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          print(getColorValues(result.data().toString()));
          _list.add(_string_to_hexcolor(getColorValues(result.data().toString())));
          // print(result.data());
        }
      });

      return _list;
    } catch(e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Header(screenHeight: screenHeight, screenWidth: screenWidth,),
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
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('card').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                if (snapshot.hasData) {
                  return GridView.builder(
                    //shrinkWrap: true,
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

                              child: GestureDetector(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(text: (_list[index][ind]).value.toRadixString(16)));
                                  },
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          Future.delayed(const Duration(seconds: 1), () {
                                            Navigator.of(context).pop(true);
                                          });

                                          return const AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            contentPadding: EdgeInsets.zero,
                                            elevation: 0.0,
                                            content: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text('color copied to the clipboard'),
                                              ],
                                            ),
                                          );
                                        }
                                    );
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text((is_hovered[0] == index && is_hovered[1] == ind) ? (_list[index][ind]).value.toRadixString(16) : "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white, fontSize: 21),)),
                                    color: _list[index][ind],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        ),

                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
