import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text(widget.title),
      ),
      body:  Center(

        child: Column(
  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         FlutterMap(
                                  mapController: MapController(),
                                  options: MapOptions(
                                    initialCenter: LatLng(50.5, 30.51),
                                    initialZoom: 15.0,
                                    minZoom: 1.0,
                                    /* onPositionChanged: (MapPosition position, bool hasGesture) {
                                context.read<HomeBloc>().add(ShowMapVewChange(centerLatLng: position.center));
                              },*/
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate: 'http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}'
                                         // : "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                      //urlTemplate: "http://123.49.35.90:8088/tilesBD/{z}/{x}/{y}.png",
                                     , subdomains: const ['a', 'b', 'c'],
                                    ),
                                    CircleLayer(circles: [
                                      CircleMarker(
                                          point:LatLng(50.5, 30.51),
                                          radius: 10,
                                          borderStrokeWidth: 2,
                                          color: Colors.lightBlue,
                                          borderColor: Colors.blue)
                                    ]),
                                    // PolylineLayer(
                                    //     polylines: mapC.shoutList
                                    //         .map((element) => Polyline(
                                    //               isDotted: true,
                                    //               color: Colors.blue,
                                    //               points: [
                                    //                 LatLng(mapC.shoutList.first.latitude!, mapC.shoutList.first.longitude!),
                                    //                 locationC.currentLatLng!
                                    //               ],
                                    //             ))
                                    //         .toList()),
                                    // MarkerLayer(
                                    //     markers: (mapC.selectedMarker.value != '' ? mapC.selectedShoutList : mapC.shoutList)
                                    //         .map(
                                    //           (e) => Marker(
                                    //               width: 90,
                                    //               height: 90,
                                    //               point: LatLng(e.latitude!, e.longitude!),
                                    //               child: GestureDetector(
                                    //                   onTap: mapC.selectedMarker.value == ''
                                    //                       ? () async {
                                    //                           Get.dialog(AlertDialog(
                                    //                             content: SizedBox(
                                    //                                 height: 120,
                                    //                                 child: Column(
                                    //                                   children: [
                                    //                                     GestureDetector(
                                    //                                       onTap: () {
                                    //                                         Get.back();
                                    //                                         DialogHelper.shoutDetailsDialog(
                                    //                                             title: 'Shout Details',
                                    //                                             shoutDetails: e,
                                    //                                             route: 'myShout');
                                    //                                       },
                                    //                                       child: Container(
                                    //                                         width: 200,
                                    //                                         alignment: Alignment.center,
                                    //                                         height: 50,
                                    //                                         decoration: BoxDecoration(
                                    //                                           color: hexToColor('#78909C')
                                    //                                               .withOpacity(authC.isLoginButtonValid() ? 1 : .6),
                                    //                                           borderRadius: BorderRadius.all(
                                    //                                             Radius.circular(8),
                                    //                                           ),
                                    //                                         ),
                                    //                                         child: KText(
                                    //                                           text: 'Show Details',
                                    //                                           color: Colors.white,
                                    //                                           bold: true,
                                    //                                           fontSize: 21,
                                    //                                         ),
                                    //                                       ),
                                    //                                     ),
                                    //                                     GestureDetector(
                                    //                                       onTap: () {
                                    //                                         mapC.selectedMarker.value = e.id!;
                                    //                                         mapC.selectedShoutList.add(e);

                                    //                                         Get.back();
                                    //                                       },
                                    //                                       child: Container(
                                    //                                         margin: EdgeInsets.only(top: 10),
                                    //                                         width: 200,
                                    //                                         alignment: Alignment.center,
                                    //                                         height: 50,
                                    //                                         decoration: BoxDecoration(
                                    //                                           color: hexToColor('#78909C')
                                    //                                               .withOpacity(authC.isLoginButtonValid() ? 1 : .6),
                                    //                                           borderRadius: BorderRadius.all(
                                    //                                             Radius.circular(8),
                                    //                                           ),
                                    //                                         ),
                                    //                                         child: KText(
                                    //                                           text: 'Show Route',
                                    //                                           color: Colors.white,
                                    //                                           bold: true,
                                    //                                           fontSize: 21,
                                    //                                         ),
                                    //                                       ),
                                    //                                     ),
                                    //                                   ],
                                    //                                 )),
                                    //                           ));

                                    //                           myReportsC.files.clear();
                                    //                           myReportsC.mapMyReportListImageFetched(userInfo: e);
                                    //                         }
                                    //                       : () {
                                    //                           mapC.selectedMarker.value = '';
                                    //                           mapC.selectedShoutList.clear();
                                    //                         },
                                    //                   child: Column(
                                    //                     children: [
                                    //                       Image.asset(
                                    //                         "assets/icons/marker_icon.png",
                                    //                         width: 44,
                                    //                         height: 70,
                                    //                         fit: BoxFit.cover,
                                    //                       ),
                                    //                       SizedBox(height: 20)
                                    //                     ],
                                    //                   ))),
                                    //         )
                                    //         .toList()),
                                
                                  ],
                                ),
                             
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
