import 'package:covid19/core/data/models/user_model.dart';
import 'package:covid19/core/di/di_locator.dart';
import 'package:covid19/core/presentation/constansts/desing_constant.dart';
import 'package:covid19/core/presentation/constansts/route_constant.dart';
import 'package:covid19/core/presentation/pages/login/login_view_model.dart';
import 'package:covid19/core/presentation/utils/custom_dialog.dart';
import 'package:covid19/core/presentation/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget{
  final LoginViewModel _loginViewModel;

   LoginView({super.key, required LoginViewModel? loginViewModel})
      : _loginViewModel = loginViewModel ?? locator<LoginViewModel>();

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _typeDocument = "";
  String _numberDocument = "";
  String _password = "";
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: _hideKeyboard,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).cardColor,
             body: GestureDetector(
               onTap: _hideKeyboard,
               child: SingleChildScrollView(
                 child: Column(
                   children: <Widget>[
                     _createLoginContent(),
                   ],
                 ),
               ),
             ),
    ),
        ),
      )
    );

  }
  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _authUser() async {
    _hideKeyboard();
    if (_loginFormKey.currentState!.validate()) {
      final UserModel? loggedIn =
      await widget._loginViewModel.loginUser(_typeDocument.toUpperCase(),_numberDocument, _password);
      if (loggedIn != null) {
      //  _handleSuccessLogIn();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Iniciando sesión...')),
        );
        Navigator.of(context).pushReplacementNamed(homeRoute);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos u contraseña incorrecta...'),backgroundColor: Colors.red,),
        );
      }
    }
    }


  Widget _createLoginContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _createLogoImage(),
        const SizedBox(height: 20),
        _createEmailAndPasswordForm(),
        const SizedBox(height: 10),
        _buildButtons(),
        const SizedBox(height: 10),
        _socialFeed(),
        // ...otros widgets...
      ],
    );
  }

  List<Widget> _createTitleAndSubtitle() {
    return [
      const Padding(
        padding: EdgeInsets.only(left: 4.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child:Text(
              'Bienvenido a:',
        ),),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child:Text(
              'Evertec',style: TextStyle(fontSize: 2.9.h,fontWeight: FontWeight.bold)
          ),),
      ),

    ];
  }

  Widget _createLogoImage() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Image.asset(kLoginLogo, fit: BoxFit.cover, height: 40.h, width: 100.w),
        Padding(
          padding:  EdgeInsets.only(top: 32.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _createTitleAndSubtitle(),
          ),
        ),
      ],
    );
  }

  Widget _createEmailAndPasswordForm() {
    return Consumer<LoginViewModel>(
      builder: (_, viewModel, __) => Form(
          key: _loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                CustomTextField(
              onChange:_typeDocumentListener ,
              label: 'Tipo Documento',   validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu Tipo Documento';
                  }
                  return null;
                },),
                const SizedBox(height: 20),
                CustomTextField(
                  onChange: _numberDocumentListener,
                  label:'Numero Documento',  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu Numero Documento';
                  }
                  return null;
                },),
                const SizedBox(height: 20),
                CustomTextField(onChange:_passwordListener,label: 'Contraseña',isPassword: true,  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu Contraseña';
                  }
                  return null;
                },),
              ],
            ),
          )),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 90.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).canvasColor, // Usa el color definido en main.dart
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Hace el botón redondo
                ),
              ),
              onPressed: () {
                _authUser();
              },
              child: const Text('Login',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          const SizedBox(height: 10),
           GestureDetector(
             onTap:  (){
               showDialog(
                 context: context,
                 builder: (BuildContext context) => const CustomDialog(platform: 'Registrar Usuario'));},
             child: const Text('Registrar Usuario',style: TextStyle(
               decoration: TextDecoration.underline,
             ),),
           ),
        ],
      ),
    );
  }

  Widget _socialFeed(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        createButton(kGoogle, 'Google', context),
        createButton(kFacebook, 'Facebook', context),
        createButton(kInstagram, 'Instragram', context)
      ],
    );
  }

  Widget createButton(String assetName, String platform, BuildContext context) {
    return FloatingActionButton(
      key: Key(platform),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
           return CustomDialog(platform: platform);
          },
        );
      },
      backgroundColor: Colors.grey[400],
      child: Image.asset(assetName),
    );
  }

  void _passwordListener(String password) {
    _password = password;
  }

  void _typeDocumentListener(String typeDocument) {
    _typeDocument = typeDocument;
  }
  void _numberDocumentListener(String numberDocument) {
    _numberDocument = numberDocument;
  }
}