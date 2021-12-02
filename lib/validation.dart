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

  Future<bool> validaCadastro() async {
    bool result = false;
    if (isFormatoEmail(this.usuario.email) &&
        isCampoSenha(this.usuario.senha) &&
        isNome(this.usuario.nome) &&
        isSobrenome(this.usuario.sobrenome)) {
      await db.insertUsuario(usuario);
      result = true;
    } else {
      mostraDialogo(
          'Preencha corretamente os campos do formulário.', inContext);
    }

    return result;
  }

  bool isFormatoEmail(String? email) {
    if (email == null || email.isEmpty) {
      mostraDialogo('Entre com seu e-mail', inContext);
      return false;
    }

    if (!email.contains('@')) {
      mostraDialogo(
          'O email deve ser por exemplo seu-nome@mail.com', inContext);
      return false;
    }

    if (!email.contains('.com')) {
      mostraDialogo('O email deve conter o ".com"', inContext);
    }

    if (email.length < 3) {
      mostraDialogo('E-mail em formato inadequado', inContext);
      return false;
    }
    return true;
  }

  bool isCampoSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      mostraDialogo('Entre com sua senha', inContext);
      return false;
    }
    if (senha.length < 4) {
      mostraDialogo('A senha deve ter no mínimo 4 dígitos', inContext);
      return false;
    }
    return true;
  }

  bool isNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      mostraDialogo('Insira seu nome', inContext);
      return false;
    }
    return true;
  }

  bool isSobrenome(String? sobrenome) {
    if (sobrenome == null || sobrenome.isEmpty) {
      mostraDialogo('Insira seu sobrenome', inContext);
      return false;
    }
    return true;
  }
}
