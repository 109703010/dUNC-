import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

const purple = Color(0xffaf57dc);
const blue = Color(0xff7b78e2);
const darkPurple = Color.fromARGB(255, 209, 169, 227);

// const Map<int, Color> colorPurple = {
//   50: Color.fromRGBO(56, 41, 87, .1),
//   100: Color.fromRGBO(56, 41, 87, .2),
//   200: Color.fromRGBO(56, 41, 87, .3),
//   300: Color.fromRGBO(56, 41, 87, .4),
//   400: Color.fromRGBO(56, 41, 87, .5),
//   500: Color.fromRGBO(56, 41, 87, .6),
//   600: Color.fromRGBO(56, 41, 87, .7),
//   700: Color.fromRGBO(56, 41, 87, .8),
//   800: Color.fromRGBO(56, 41, 87, .9),
//   900: Color.fromRGBO(56, 41, 87, 1),
// };

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      title: 'dUNC',
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int selectedIndex = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      const SizedBox(
        // 為了避開螢幕的最上方
        height: 50,
      ),
      Neumorphic(
        style: const NeumorphicStyle(
            depth: -4,
            surfaceIntensity: 0,
            boxShape: NeumorphicBoxShape.stadium()),
        child: SizedBox(
            height: 45,
            width: 250,
            child: NeumorphicToggle(
              movingCurve: Curves.easeInBack,
              duration: const Duration(milliseconds: 600),
              selectedIndex: selectedIndex,
              onChanged: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: [
                ToggleElement(
                  foreground: const Center(
                    child: Text(
                      '找球隊/球員',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  background: const Center(
                    child: Text(
                      '找球隊/球員',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ToggleElement(
                    foreground: const Center(
                      child: Text(
                        '找比賽',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    background: const Center(
                      child: Text(
                        '找比賽',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
              thumb: Container(
                // 已被選擇的項目的樣式
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [blue, purple]),
                ),
              ),
              style: const NeumorphicToggleStyle(
                backgroundColor: Colors.white54, // 沒被選擇的項目背景顏色
                lightSource: LightSource(-0.6, -0.6),
                borderRadius: BorderRadius.all(Radius.circular(20)), // 選中項目
              ),
            )),
      ),
      const SizedBox(
        height: 25,
      ),
      Neumorphic(
        style: const NeumorphicStyle(
            shadowLightColorEmboss: Colors.white,
            depth: -4,
            intensity: 0.75,
            boxShape: NeumorphicBoxShape.stadium()),
        child: const SizedBox(
            height: 50,
            width: 300,
            child: TextField(
                style: TextStyle(fontSize: 20),
                maxLines: 1,
                minLines: null,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "輸入球隊/員",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.grey,
                    )))),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Neumorphic(
            style: const NeumorphicStyle(color: darkPurple),
            child: const SizedBox(
                height: 25,
                width: 70,
                child: Text(
                  "搜尋過",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const SizedBox(width: 30),
          Neumorphic(
            style: const NeumorphicStyle(color: darkPurple),
            child: const SizedBox(
                height: 25,
                width: 110,
                child: Text(
                  "已加入我的最愛",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    ])));
  }
}
