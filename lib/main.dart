import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter_project/RG-MA/config.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MyApp());
}

class Wizard extends StatefulWidget {
  final String title;

  Wizard({Key? key, required this.title}) : super(key: key);

  @override
  _Wizard createState() => _Wizard(title: title);
}

class _Wizard extends State<Wizard> {

  String title;

  _Wizard({ required this.title });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child:  Column(
          children: [
            const Image(
              image: AssetImage('images/wizard.png'), // Replace 'image.png' with your image asset path
              width: 296.0, // Set the width of the image
              height: 262.0, // Set the height of the image
              fit: BoxFit.fitHeight, // Adjust how the image is fitted inside the container
            ),
            Text(title, style: TextStyle(fontSize: 24 )),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: const TextSpan(
                    text: 'Com sua ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'carteira de identidade física ',
                        style: TextStyle(color: Color(0xFF386E52)),
                      ),
                      TextSpan(
                        text: 'expedida a partir de ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                          text: 'agosto/2017',
                          style: TextStyle(color: Color(0xFF386E52))
                      ),
                      TextSpan(
                          text: ', você pode ter a versão digital da carteira no seu celular.',
                          style: TextStyle(color: Colors.black)
                      )
                    ]
                ),
              ),
            )
          ],
        )
    ) 
      );
  }
}

class PaginationPage extends StatefulWidget {
  @override
  _PaginationPageState createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  List<String> titles = ['Carteira Digital do TESTE', 'Validação de carteira'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page.toDouble();
                });
              },
              children: [
                Wizard(title: titles[_currentPage.toInt()]),
                Wizard(title: titles[_currentPage.toInt()]),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: 2, // Number of pages
            position: _currentPage, // Current page position
            decorator:  const DotsDecorator(
              color: Colors.grey, // Inactive dot color
              activeColor: Color(0xFF386E52), // Active dot color
              size: Size.square(9.0), // Dot size
              activeSize: Size.square(12.0), // Active dot size
              spacing: EdgeInsets.all(6.0), // Spacing between dots
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => OnboardingHome(),
                            transitionDuration: const Duration(seconds: 0)
                        )
                    );
                  },
                  color: const Color(0xFF386E52),
                  height: 54,
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('PRÓXIMO')
              )
          )
        ],
      ),
    );
  }
}

class OnboardingHome extends StatelessWidget {
  const OnboardingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: 
          Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Column(
                children: [
                  const Image(
                    image: AssetImage('images/logo_cliente.png'), // Replace 'image.png' with your image asset path
                    fit: BoxFit.fitHeight, // Adjust how the image is fitted inside the container
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: const TextSpan(
                        text: 'Com sua ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'carteira de identidade física ',
                            style: TextStyle(color: Color(0xFF386E52)),
                          ),
                          TextSpan(
                            text: 'expedida a partir de ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                              text: 'agosto/2017',
                              style: TextStyle(color: Color(0xFF386E52))
                          ),
                          TextSpan(
                              text: ', você pode ter a versão digital da carteira no seu celular.',
                              style: TextStyle(color: Colors.black)
                          )
                        ]
                    ),
                  ),
                ],
              )),
              Column(
                children: [
                  MaterialButton(
                    color: Color(0xFF386E52),
                     textColor: Colors.white,
                      height: 53,
                      minWidth: double.infinity,
                       child: Text('ADICIONAR'),
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  CameraScreen())
                              )
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 53,
                      width: double.infinity,
                      child: OutlinedButton(
                      
                    child: const Text('VALIDAR', style: TextStyle(color: Color(0xFF386E52), fontSize: 16)),
                    onPressed: () => {},
                    style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                    )
                    )
                  ),
                    )
                ],
              )
            ],
          ),
        )
        ),
        )
      );
  }
}

//Tenha de forma segura e sempreà mão a sua Carteira de Identidade do CFM.Utilize o documento impresso emitidoa partir de agosto/2017.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appConfig.appName,
      theme: ThemeData(
<<<<<<< HEAD
        fontFamily: 'RobotoCondensed',
=======
        primaryColor: appConfig.primaryColor,
>>>>>>> cd6a697 (last implementation)
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: PaginationPage(),
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
  final int _currentIndex = 0;
  String _title = "Início";

  List<Widget> body = [
    const Icon(Icons.home),
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
                                    border: Border(
                                        bottom: BorderSide(width: 3.0, color: Colors.grey)
                                    )
                                ),
                                child: MaterialButton(onPressed: () {  },
                                child: Text('x'))
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
}

class DetailsRoute extends StatelessWidget {
  const DetailsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), color: Colors.black, onPressed: () => Navigator.of(context).pop()),
        title: const Text('Second Route'),
      ),
      body: const Center(
        child: Text("teste"),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the camera
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    // Initialize the camera controller
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();

    // setState() is called to update the state of the widget.
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // If the controller is initialized, display the camera preview.
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Preview'),
      ),
      body: CameraPreview(_controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Ensure that the camera is initialized before taking a picture.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file path
            final path = await _controller.takePicture();

            // Navigate to a new screen to display the picture
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path.toString()),
              ),
            );
          } catch (e) {
            print('Error: $e');
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}