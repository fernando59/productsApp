import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formularios/providers/login_form_provider.dart';
import 'package:formularios/ui/input_decoration.dart';
import 'package:formularios/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 180,
          ),
          CardContainer(
            child: Column(
              children: [
                SizedBox( height: 10,),
                Text( 'Login', style: Theme.of(context).textTheme.headline4,),
                SizedBox( height: 30,),
                ChangeNotifierProvider( create: (_) => LoginFormProvider(), child: _LoginForm(),),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text('Crear una nueva cuenta')
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hinText: 'example@gmail.com', labelText: 'Email'),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El formato es incorrecto';
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecorations.authInputDecoration( hinText: '*********', labelText: 'Password'),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'La contraseña debe ser mayor a 6 caracteres';
              },
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.deepPurple,
                disabledColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Container(
                  child: Text(
                    loginForm.isLoading ? 'Cargando ...' : 'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        //Quitar el teclado cuando se envia
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;
                        loginForm.isLoading = true;
                        await Future.delayed(Duration(seconds: 2));

                        loginForm.isLoading = false;
                        Navigator.pushReplacementNamed(context, 'home');
                      })
          ],
        ),
      ),
    );
  }
}
