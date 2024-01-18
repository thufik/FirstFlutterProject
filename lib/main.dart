import 'dart:math';
import 'package:flutter/cupertino.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Minha Carteira'),
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

  int _numeroAleatorio = 0;
  int _currentIndex = 0;
  String _title = "Início";

  List<Widget> body = [
    Icon(Icons.home),
    Center(
      child: Builder(builder: (BuildContext context) =>
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsRoute()),
              );
            },
            child: const Text('Go back!'),
          ),
      )
    ),
  ];

  final List _frases = [
    'Frase 1',
    'Frase 2',
    'Frase 3',
    'Frase 4'
  ];

  void _incrementCounter() {
    setState(() {
      _numeroAleatorio = Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (index) {
            var title = "";

            if (index == 0) {
              title = "Início";
            } else if (index == 1) {
              title = "Novo";
            } else if (index == 2) {
              title = "Serviços";
            } else {
              title = "Opçoes";
            }

            setState(() {
              _title = title;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/icon_wallet.png"),
                color: Colors.red,
                size: 24,
              ),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/icon_add.png"),
                color: Colors.red,
                size: 24,
              ),
              label: 'Novo',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/icon_services.png"),
                color: Colors.red,
                size: 24,
              ),
              label: 'Serviços',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/icon_options.png"),
                color: Colors.red,
                size: 24,
              ),
              label: 'Opções',
              backgroundColor: Colors.red,
            ),
          ],
        ),
        tabBuilder: (BuildContext cx, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: [
                    TableRow(
                        children: [
                          TableRowInkWell(
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.cyan,
                                    border: Border(
                                        bottom: BorderSide(width: 1.0, color: Colors.grey)
                                    )
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Text(
                                      'Validar'
                                  ),
                                )
                            ),
                            onTap: () {
                              Navigator.push(
                                  cx,
                                  MaterialPageRoute(builder: (context) => const DetailsRoute())
                              );
                            },
                          )
                        ]
                    )
                  ],
                ),
              );
            },
          );
        },
      )
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: body[_currentIndex]
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedFontSize: 12.0,
  //       unselectedFontSize: 12.0,
  //       type: BottomNavigationBarType.fixed,
  //       currentIndex: _currentIndex,
  //       onTap: (int newIndex) {
  //         setState(() {
  //           _currentIndex = newIndex;
  //         });
  //       },
  //       items: const [
  //         BottomNavigationBarItem(label: 'teste', icon: Icon(Icons.home)),
  //         BottomNavigationBarItem(label: 'teste', icon: Icon(Icons.add))
  //       ],
  //     )// This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }
}

class DetailsRoute extends StatelessWidget {
  const DetailsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Text("teste"),
      ),
    );
  }
}
