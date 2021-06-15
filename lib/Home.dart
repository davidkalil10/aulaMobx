import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_){
                  return Text(
                    "${controller.contador}",
                    style: TextStyle(
                        color: Colors.black, fontSize: 80
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                child: Text(
                  "Incrementar",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onPressed: (){
                  controller.incrementar();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}