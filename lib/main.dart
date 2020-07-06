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
        children: _buildGridTiles(29),
      )
    );
  }
}

List<Widget> _buildGridTiles(numberOfTiles){
  List<Container> containers = new List<Container>.generate(numberOfTiles, (int index){
    //index = 0, 1, 2, ...
    final imageName = index < 9 ?
        'images/image${index + 1}.png' : 'images/image${index + 1}.png';
    return new Container(
      child: new Image.asset(
          imageName,
        fit: BoxFit.cover,
      ),
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
