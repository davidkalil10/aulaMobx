import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 // Controller controller = Controller();
  late Controller controller;
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
/*    autorun((_){
      print(controller.formularioValidado);
    });*/

    controller = Provider.of<Controller>(context);

    reactionDisposer =
        reaction((_) => controller.usuarioLogado, (valorController) {
      if (valorController == true){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=> Principal())
        );
      }
    });
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /* Padding(
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
            ),*/
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setSenha,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(controller.formularioValidado
                      ? "Validados"
                      : "* Campos não validados");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return ElevatedButton(
                    child: controller.carregando
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : Text(
                            "Logar",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                    onPressed: controller.formularioValidado
                        ? () {
                            controller.logar();
                          }
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
