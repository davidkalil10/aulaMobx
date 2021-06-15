import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

//mixin store é usado para geração dos codigos automaticos
abstract class ControllerBase with Store{

  ControllerBase(){

    //executa sempre que um observavel tem seu valor alterado
    autorun((_){
 /*     print(email);
      print(senha);
      print(formularioValidado);*/
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @computed
  String get emailSenha => "$email - $senha";

  @computed
  bool get formularioValidado => email.length >=5 && senha.length >=5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar() async{
    carregando = true;

    //processamento

    await Future.delayed(Duration(seconds: 3));

    carregando = false;
    usuarioLogado = true;
  }


/*@observable
int contador = 0;


@action
incrementar(){
  contador++;
}*/

/*  var _contador = Observable(0);
  Action incrementar;

  Controller(){
    incrementar = Action(_incrementar());
  }

  int get contador => _contador.value;

  set contador(int value) {
    _contador.value = value;
  }

  _incrementar(){
    //_contador.value = _contador.value +1;
    contador++;
  }*/
}