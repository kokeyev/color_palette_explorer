import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Generate extends StatelessWidget {
  const Generate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/generate',
      routes: {
        '/': (context) => MyHomePage(),
        '/generate': (context) => GeneratePage(),
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

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {

  int _index = -1;




  final List<Color> _colors = [
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 255, 128, 0),
    Color.fromARGB(255, 255, 255, 0),
    Color.fromARGB(255, 128, 255, 0),
    Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 0, 255, 128),
    Color.fromARGB(255, 0, 255, 255),
    Color.fromARGB(255, 0, 128, 255),
    Color.fromARGB(255, 0, 0, 255),
    Color.fromARGB(255, 127, 0, 255),
    Color.fromARGB(255, 255, 0, 255),
    Color.fromARGB(255, 255, 0, 127),
    Color.fromARGB(255, 128, 128, 128),
  ];
  double _width = 300;
  final List<double> _colorSliderPosition = [0.0, 0.0, 0.0, 0.0, 0.0];
  List <double>? _shadeSliderPosition;
  List<Color>? _currentColor;
  List<Color>? _shadedColor;

  late TextEditingController _textController;


  @override
  initState() {
    super.initState();
    _currentColor = List<Color>.filled(5, Colors.black);
    _shadeSliderPosition = List<double>.filled(5, 0.0);
    _shadedColor = List<Color>.filled(5, Colors.black);

    _textController = TextEditingController();
    /*
    for (int i = 0; i < 5; i++) {
      _currentColor?[i] = _calculateSelectedColor(_colorSliderPosition[i], i)!;
      _shadeSliderPosition?[i] = _width / 2; //center the shader selector
      _shadedColor?[i] = _calculateShadedColor(_shadeSliderPosition![i], i)!;
    }
     */
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  _colors_to_strings(List<Color> l) {
    List<String> ans = List.filled(5, "");
    for (int i = 0; i < 5; i++) {
      ans[i] = l[i].value.toRadixString(16);
    }
    return ans;
  }
  _colorChangeHandler(double position, ind) {
    //handle out of bounds positions
    if (position > _width) {
      position = _width;
    }
    if (position < 0) {
      position = 0;
    }
    print("New pos: $position");
    setState(() {
      _colorSliderPosition[ind] = position;
      _currentColor?[ind] = _calculateSelectedColor(_colorSliderPosition[ind], ind)!;
      _shadedColor?[ind] = _calculateShadedColor(_shadeSliderPosition![ind], ind)!;
    });
  }
  _shadeChangeHandler(double position, ind) {
    //handle out of bounds gestures
    if (position > _width) position = _width;
    if (position < 0) position = 0;
    setState(() {
      _shadeSliderPosition?[ind] = position;
      _shadedColor?[ind] = _calculateShadedColor(_shadeSliderPosition![ind], ind)!;
      print(
          "r: ${_shadedColor?[ind].red}, g: ${_shadedColor?[ind].green}, b: ${_shadedColor?[ind].blue}");
    });
  }
  Color? _calculateShadedColor(double position, ind) {
    double ratio = position / _width;
    if (ratio > 0.5) {
      //Calculate new color (values converge to 255 to make the color lighter)
      int redVal = _currentColor?[ind].red != 255
          ? (_currentColor![ind].red +
          (255 - _currentColor![ind].red) * (ratio - 0.5) / 0.5)
          .round()
          : 255;
      int greenVal = _currentColor?[ind].green != 255
          ? (_currentColor![ind].green +
          (255 - _currentColor![ind].green) * (ratio - 0.5) / 0.5)
          .round()
          : 255;
      int blueVal = _currentColor?[ind].blue != 255
          ? (_currentColor![ind].blue +
          (255 - _currentColor![ind].blue) * (ratio - 0.5) / 0.5)
          .round()
          : 255;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (ratio < 0.5) {
      //Calculate new color (values converge to 0 to make the color darker)
      int redVal = _currentColor?[ind].red != 0
          ? (_currentColor![ind].red * ratio / 0.5).round()
          : 0;
      int greenVal = _currentColor?[ind].green != 0
          ? (_currentColor![ind].green * ratio / 0.5).round()
          : 0;
      int blueVal = _currentColor?[ind].blue != 0
          ? (_currentColor![ind].blue * ratio / 0.5).round()
          : 0;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      //return the base color
      return _currentColor?[ind];
    }
  }
  Color? _calculateSelectedColor(double position, ind) {
    //determine color
    double positionInColorArray =
    (position / _width * (_colors.length - 1));
    print(positionInColorArray);
    int index = positionInColorArray.truncate();
    print(index);
    double remainder = positionInColorArray - index;
    if (remainder == 0.0) {
      _currentColor?[ind] = _colors[index];
    }
    else {
      //calculate new color
      int redValue = _colors[index].red == _colors[index + 1].red
          ? _colors[index].red
          : (_colors[index].red +
          (_colors[index + 1].red - _colors[index].red) * remainder)
          .round();
      int greenValue = _colors[index].green == _colors[index + 1].green
          ? _colors[index].green
          : (_colors[index].green +
          (_colors[index + 1].green - _colors[index].green) * remainder)
          .round();
      int blueValue = _colors[index].blue == _colors[index + 1].blue
          ? _colors[index].blue
          : (_colors[index].blue +
          (_colors[index + 1].blue - _colors[index].blue) * remainder)
          .round();
      _currentColor?[ind] = Color.fromARGB(255, redValue, greenValue, blueValue);
    }
    return _currentColor?[ind];
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

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
                Expanded(
                    flex: 20,
                    child: TextButton(
                      child: Text("Publish!"),
                      onPressed: () async {
                        final res = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Add a new color palette'),
                                content: TextField(
                                  controller: _textController,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                      hintText: "Enter your name"),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Add'),
                                    onPressed: () {
                                      Navigator.pop(context, _textController.text);
                                    },
                                  ),
                                ],
                              );
                            }
                        );
                        if (res != null) {
                          res as String;
                          print(_colors_to_strings(_shadedColor!));
                          CollectionReference collRef = FirebaseFirestore.instance.collection('card');
                          collRef.add({
                            'colors' : _colors_to_strings(_shadedColor!),
                            'like' : 0,
                            'author': res
                          });
                          Navigator.of(context).pushNamed('/');
                        }

                        // Navigator.pop(context);
                      },
                    )),
                /*
                Expanded(
                    flex: 10,
                    child: TextButton(
                      child: Text("Sign in"),
                      onPressed: () {},
                    )),
                Expanded(
                    flex: 10,
                    child: TextButton(
                      child: Text("Sign up"),
                      onPressed: () {},
                    )),
                 */
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(5, (index) {
                return Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 40,
                        child: MouseRegion(
                          onEnter: (details) => setState(() {
                            _index = index;
                          }),
                          onExit: (details) => setState(() {
                           _index = -1;
                          }),
                          child: SafeArea(
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onHorizontalDragStart: (DragStartDetails details) {
                                      if (index == _index) {
                                        //print("_-------------------------STARTED DRAG");
                                      _colorChangeHandler(details.localPosition.dx, index);
                                      }
                                    },
                                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                                      if (index == _index) {
                                        _colorChangeHandler(details.localPosition.dx, index);
                                      }
                                    },
                                    onTapDown: (TapDownDetails details) {
                                      if (index == _index) {
                                        _colorChangeHandler(details.localPosition.dx, index);
                                      }
                                    },
                                    //This outside padding makes it much easier to grab the   slider because the gesture detector has
                                    // the extra padding to recognize gestures inside of
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        width: _width,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: (Colors.grey[800])!),
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(colors: _colors),
                                        ),
                                        child: CustomPaint(
                                          painter: _SliderIndicatorPainter(_colorSliderPosition[index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onHorizontalDragStart: (DragStartDetails details) {
                                      print("_-------------------------STARTED DRAG");
                                      _shadeChangeHandler(details.localPosition.dx, index);
                                    },
                                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                                      _shadeChangeHandler(details.localPosition.dx, index);
                                    },
                                    onTapDown: (TapDownDetails details) {
                                      _shadeChangeHandler(details.localPosition.dx, index);
                                    },
                                    //This outside padding makes it much easier to grab the slider because the gesture detector has
                                    // the extra padding to recognize gestures inside of
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        width: _width,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: (Colors.grey[800])!),
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              colors: [Colors.black, _currentColor![index], Colors.white]),
                                        ),
                                        child: CustomPaint(
                                          painter: _SliderIndicatorPainter(_shadeSliderPosition![index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Container(color: _shadedColor?[index]),
                      ),
                    ],
                  ),
                );
              }
              ),

            ),
          ),
        ],
      ),
    );
  }
}


class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(position, size.height / 2), 12, Paint()..color = Colors.black);
  }
  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}
