import 'package:flutter/material.dart';
import 'package:trabalhomobile/usuario.dart';
import 'package:trabalhomobile/usuarioBD.dart';

import 'mostra_dialogo.dart';

class Validation {
  final Usuario usuario;
  final BuildContext inContext;
  final UsuarioBD db;

  Validation(this.usuario, this.inContext, this.db);

  Future<bool> valida() async {
    bool result = false;
    if (isFormatoEmail(this.usuario.email) &&
        isCampoSenha(this.usuario.senha)) {
      Usuario? futureUsuario = await db.getUsuario(usuario);

      // bool result = this.usuario.email == 'teste@teste.com' &&
      //     this.usuario.senha == '1234';

      if (futureUsuario != null) {
        if (futureUsuario.senha == this.usuario.senha) {
          result = true;
        } else {
          result = false;
          mostraDialogo('Email ou Senha Invalidos', inContext);
        }
      }
    }

    return result;
  }

  bool isFormatoEmail(String? email) {
    if (email == null) {
      mostraDialogo('Entre com seu e-mail', inContext);
      return false;
    }

    if (email.isEmpty) {
      mostraDialogo('Entre com seu e-mail', inContext);
      return false;
    }
    if (!email.contains('@')) {
      mostraDialogo(
          'O email deve ser por exemplo seu-nome@mail.com', inContext);
      return false;
    }
    if (email.length < 3) {
      mostraDialogo('E-mail em formato inadequado', inContext);
      return false;
    }
    return true;
  }

  bool isCampoSenha(String? senha) {
    if (senha == null) {
      mostraDialogo('Entre com sua senha', inContext);
      return false;
    }

    if (senha.isEmpty) {
      mostraDialogo('Entre com sua senha', inContext);
      return false;
    }
    if (senha.length < 4) {
      mostraDialogo('A senha deve ter no mínimo 4 dígitos', inContext);
      return false;
    }
    return true;
  }
}
