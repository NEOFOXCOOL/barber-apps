import 'package:barberking/pages/component/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final ButtonStyle styleButton =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  late bool isBarber ;
  late bool isClient ;

  @override
  void initState() {
    isBarber = false;
    isClient = false;
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.loginBackground,
      body: Stack(
        children: [
          // party top of login page
          Positioned(
            left: -150,top: -150,
            child: Container(
            height: 400 ,
            width: 400,
            alignment: const FractionalOffset(0.2,2),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.loginComponentColors
            ),
            child: Text("login".toUpperCase(),style: const TextStyle(color: AppColors.loginBackground,fontSize: 40)),
          ),),

          //party bottom of login page
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height/2,
              width:  MediaQuery.of(context).size.width/1.1,
              child:  Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      suffixIcon: Icon(Icons.clear),
                      hintText: 'enter your email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text("Barber"),
                      Checkbox(checkColor: Colors.white,activeColor: Colors.black, value: isBarber, onChanged: (bool? value){setState(() {
                        isClient == false ? isBarber = value! : isBarber = false;
                      });}),
                      const Text("Client"),
                      Checkbox(checkColor: Colors.white,activeColor: Colors.black, value: isClient, onChanged: (bool? value){setState(() {
                        isBarber == false ? isClient = value! : isClient = false;
                      });}),
                    ],
                  ),
                  ElevatedButton(
                      style: styleButton,
                      onPressed: (){
                        setState(() {
                          print("------login !!!! -------");
                        });
                      }, child: Text("login")),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
