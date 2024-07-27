import 'package:barberking/pages/component/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
            left: -140,top: -140,
            child: Container(
            height: 400 ,
            width: 400 ,
            alignment: const FractionalOffset(0.7,0.6),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.loginComponentColors
            ),
            child: const Text("Login",style: const TextStyle(color: AppColors.loginBackground,fontSize: 50)),
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
                 TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
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
                  SizedBox(
                    height: 50,width: MediaQuery.of(context).size.width,
                    child: FilledButton(
                      style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) {
                        if(states.contains(MaterialState.pressed)){
                          return Colors.lightGreenAccent;
                        }
                        else{return Colors.black;}
                      },),),
                      onPressed: (){},
                      child: const Text("Login"),
                    ),
                  ),
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
