import 'package:trabalhomobile/usuario.dart';
import 'package:trabalhomobile/routes.dart';
import 'package:trabalhomobile/usuarioBD.dart';
import 'package:trabalhomobile/validation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 198, 237, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/torneira.png',
                  width: 180,
                  height: 180,
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(28, 150, 158, 1), width: 2)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    senha = value;
                  },
                  onSubmitted: (value) {
                    _onSubmit(context);
                  },
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(28, 150, 158, 1),
                              width: 2))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, bottom: 20),
                alignment: AlignmentDirectional.bottomStart,
                child: GestureDetector(
                  child: Text(
                    'Esqueceu a senha?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Routes.CADASTRO);
                  }, // Vai para a tela de esqueceu a senha
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 255, 255, 1.0),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 105, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                        color: Color.fromRGBO(28, 150, 158, 1), width: 2),
                  ),
                ),
                onPressed: () {
                  _onSubmit(context);
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit(BuildContext inContext) async {
    UsuarioBD db = UsuarioBD();
    Usuario usuario = Usuario(email: email, senha: senha);
    Validation validator = Validation(usuario, inContext, db);

    if (await validator.valida()) {
      Navigator.of(inContext).pushReplacementNamed(Routes.HOME);
    }
  }
}
