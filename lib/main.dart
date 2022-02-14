// LISTA DE COMPRAS

//Nesta versão da LISTA DE COMPRAS eu fiz o codigo bem simples...
//Para q o valor final da LISTA DE COMPRAS suba a medida q for colocando coisas na
//lista
//
//

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//funcao main ta iniciando o MaterialApp e diz q a HOME/INICIO do APP é a funcao HOME
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

//criando a classe Home...
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//ACHO Q aqui fica as VARIAVEIS e COISAS q MUDAM DE ESTADO....
class _HomeState extends State<Home> {
  //
  // Declarando as variaveis e dizendo q elas vao receber texto editavel
  TextEditingController valorListaController = TextEditingController();

  // ACHO Q aqui é relacionado aos BOTOES, PAO, MORTADELA, CAFE... Ao apertar nesses botoes
  //aciona a funcao a baixo
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //variavel _resultado vai receber os dados da operacao feita com os
  //valores das variaveis valorLista e variaveis pao, mortadela, cafe...
  String _resultadoCalculadora = "Resultado: ";

//ao apertar no X q tem no TOPBAR é reiniciado os valores da Lista...
//zerando o valor do capo "informe o valor levado para as compras"
  void _limpaCampos() {
    setState(() {
      valorListaController.text = "";
      //a variavel resultadoCalculadora recebe o texto RESULTADO
      _resultadoCalculadora = "Resultado: ";
    });
  }

//funcao calcular recebe o valor de UMA OPERACAO no formato INT
//OPERACAO essa q é um dos BOTOES abertados pelo usuario... tipo
//PAO = 1, MORTADELA = 2, CAFE = 3...
  void calcular(int operacao) {
    setState(() {
      //pegando o valor q ta nos campos EX double.parse(numUmController.text); e movendo para as variaveis DOUBLE numUm... etc..
      double valorLista = double.parse(valorListaController.text);

      //as variaveis estao dentro deste SET STATE... Pois as VARIAVEIS TAO RECEBENDO VALORES

//variavel PAO comeca com o valor de 4.50 (pq esse e o preco do PAO)
      double pao = 4.50;
//variavel MORTADELA comeca com o valor de 8.00(pq esse e o preco da MORTADELA)
      double mortadela = 8.00;
//variavel CAFE comeca com o valor de 8.00(pq esse e o preco da MORTADELA)
      double cafe = 12.00;

//quando o uusario apertar no botao PAO, MORTADELA ou CAFE..
//sera feito a soma dos gastos
      switch (operacao) {
        case 1:
          valorLista = valorLista + pao;
          _resultadoCalculadora = "'valor das compras e',$valorLista";
          break;
        case 2:
          valorLista = valorLista + mortadela;
          _resultadoCalculadora = "'valor das compras e',$valorLista";
          break;
        case 3:
          valorLista = valorLista + cafe;
          _resultadoCalculadora = "'valor das compras e',$valorLista";
          break;
      }
    });
  }

//carregando mais a parte de design do app
  @override
  //criando um widget de construcao
  Widget build(BuildContext context) {
    //
    //
    //criando o esqueleto, com um appBar escrito valor lista de compras...
    //TopBar cor Verde e um botao de RESET em cima
    return Scaffold(
        appBar: AppBar(
          title: Text("Valor lista de compras"),
          backgroundColor: Colors.green,
          //
          //
          // criando o botao no topbar chamado LIMPA CAMPOS
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              //ao ser precionado o botao chamaa funcao _LIMPA CAMPOS
              onPressed: _limpaCampos,
            )
          ],
        ),
        //
        //
        //ACHO Q daqui a baixo cria o design do corpo do APP
        body: SingleChildScrollView(
          //ACHO Q aqui ta dizendo q vamos criar um formulario (campos, colunas, etc..)
          child: Form(
            //eu acho q tem haver com o botao ANALISAR SALARIO
            key: _formKey,
            child: Column(
              //
              //
              //LOGO / IMAGEM q fica em cima no APP
              children: <Widget>[
                Icon(Icons.calculate, size: 120.0, color: Colors.green),
                //
                //
                //criando um FIELD(CAMPO) para add um numero e SALVAR na variavel valorLISTA
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "informe o valor levado para as compras",
                  ),
                  //alinhando o numero digitado no campo no centro do campo
                  textAlign: TextAlign.center,
                  //armazenando o valor digitado no campo, na variavel SALARIO
                  controller: valorListaController,
                ),
                //
                //
                //Criando o botao
                Row(
                  //criando um widget (q sera um botao)
                  children: <Widget>[
                    RaisedButton(
                      //se o botao for precionadoo... e passado o valor 1 para funcao calcular
                      //valor 1 irá fazer a funcao calcular o valor de valorLISTA + o valor do PAO
                      //
                      onPressed: () {
                        //passando valor 1 parafuncao calcular
                        calcular(1);
                      },
                      //texto q vai aparecer no botao... no caso o PAO
                      child: Text(
                        "pao",
                      ),
                      //cor do botao verde
                      color: Colors.green,
                    ),
                    //criando botao
                    RaisedButton(
                      onPressed: () {
                        //ao ser precionado ele passa o numero 2 para funcao calcular...
                        //numero 2 significa MORTADELA
                        calcular(2);
                      },
                      //texto q aparece no botao
                      child: Text(
                        "mortadela",
                      ),
                      //cor do botao
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () {
                        //ao ser precionado ele passa o numero 3 para funcao calcular...
                        //numero 3 CAFE
                        calcular(3);
                      },
                      //texto q aparece no botao
                      child: Text(
                        "cafe",
                      ),
                      //cor do botao
                      color: Colors.green,
                    ),
                  ],
                ),
                //
                //
                //campo text para exibir o resultado
                Text(
                  _resultadoCalculadora,
                  //centralizando o resultado
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
