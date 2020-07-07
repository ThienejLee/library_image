import 'package:flutter/material.dart';

void main() => runApp(MyApp());
// Now use stateful Widget = Widget has properties which can be changed
class MainPage extends StatefulWidget{
  final String title;
  // Custom constructor, add poperty : title
  MainPage({this.title}): super();
  @override
  State<StatefulWidget> createState() {
  return new MainPageState();
  }
}
class MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new GridView.extent(
          maxCrossAxisExtent: 100.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: _buildGridTiles(20),
      )
    );
  }
}

List<Widget> _buildGridTiles(numberOfTiles){
  List<Stack> containers = new List<Stack>.generate(numberOfTiles, (int index){
    //index = 0, 1, 2, ...
    final imageName = index < 9 ?
        'images/image${index + 1}.png' : 'images/image${index + 1}.png';
    return new Stack(
      alignment: const Alignment(1.0, 1.0),
      children: <Widget>[
        new Container(
          child: new Image.asset(
            imageName,
            width: 150.0,
            height: 150.0,
            fit: BoxFit.fill,
          ),
        ),
        //How to set background to Text?
        // Let 's move Text inside a Container then set It's decoration\
        new Container(
          padding: const EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            color: new Color.fromARGB(100, 71, 150, 236)
          ),
          child: new Text('${index}', style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
        )

      ],
    );
  });
  return containers;
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: new MainPage(title: "GridView of Images",)
    );
  }
}
