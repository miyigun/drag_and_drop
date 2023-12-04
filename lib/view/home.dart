import 'package:drag_and_drop/controller/const.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context,index) {
            return Draggable(
              feedback: Container(  //Taşınabilir Container
                color: Colors.orange,
                width: 80,
                height: 80,
              ),
              childWhenDragging: Container( //Tabandaki Container
                color: Colors.red,
                width: 80,
                height: 80,
                child: Center(child: Text(
                  data[index].translateWord,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                )),
              ),
              child: Container( //İki kontainer bir aradayken
                  color: Colors.green,
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Text(
                      data[index].englishWord,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
            );

          },
        )
      ),
    );
  }
}
