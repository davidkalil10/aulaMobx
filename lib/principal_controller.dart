import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//mixin store é usado para geração dos codigos automaticos
abstract class PrincipalControllerBase with Store{

  @observable
  String novoItem = "";

  @action
  void setNovoItem(String valor)=> novoItem = valor;

  @observable
  ObservableList<String> listaItens = ObservableList();

  @action
  void adicionarItem(){
    listaItens.add(novoItem);
    print(listaItens);
  }

}