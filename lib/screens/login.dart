import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter_application_1/cubit/cubit/auth_cubit.dart';
import 'package:flutter_application_1/cubit/cubit/cubit_cubit.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


final _emailController=TextEditingController();
final _passwordController=TextEditingController();
bool _isDataMatched=true;
final _FormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitCubit, CubitState>(
      listener: (context, state) {
        
        if(state is CubitLoadaed){
          final UserCredential result=state.userCredential;
         Navigator.push(context,MaterialPageRoute(builder: (context) => Home_page(userCredential:result),));
        }else if(state is CubitError){
          return ;
        }
      },
      child:  Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 222, 3),
      body: Form(
        key:_FormKey ,
        child: BlocBuilder<CubitCubit, CubitState>(
          builder: (context, state){
            if(state is CubitInitial){

            return Column(

                  
                  children: [
                   Padding(
                 padding: const EdgeInsets.only(top: 15,left: 10),
                 child: const   Text("welcome",style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      
                    ),),
                   ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 33,left: 15),
                   child: Text('SIGN IN',style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400
                   ),),
                 ),
              
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right:30,),
                      child:
                       emailFlold(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: password(),
                    ),
                         
                    Text("forgor password?"),
              
                    GestureDetector(
                      onTap: () {
                        print("butten bushed");
                        _FormKey.currentState!.validate();
                        BlocProvider.of<CubitCubit>(context).loginWithEmaiPassword(_emailController.text, _passwordController.text);
                       // checkLogin(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            
                          ),
                          child: Container(
                            color: Color.fromARGB(255, 247, 222, 3),
                            height: 50,
                            width: double.infinity,
                            child: Center(child: Text("Login",style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),)),
                          ),
                        ),
                      ),
                    ),
              
              
                    Text("OR"),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 20,
                         backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVdEYmZwKOhjG1Ghkh0zjjNKt1KvDnMQuDoC7Gl8-uLaxsFtTpeIGqOezEkkRg0z5UvpI&usqp=CAU'),
                        ),
                        CircleAvatar(
                          radius: 20,
                         backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVdEYmZwKOhjG1Ghkh0zjjNKt1KvDnMQuDoC7Gl8-uLaxsFtTpeIGqOezEkkRg0z5UvpI&usqp=CAU'),
                        ),
                        CircleAvatar(
                          radius: 20,
                         backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVdEYmZwKOhjG1Ghkh0zjjNKt1KvDnMQuDoC7Gl8-uLaxsFtTpeIGqOezEkkRg0z5UvpI&usqp=CAU'),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New Accont?"),
                          TextButton(onPressed:() {
                            
                          }, child:Text("register"))
                        ],
                      )
                ]);
          }else if(state  is CubitLoading){
            return CircularProgressIndicator();
          }else {
            return Container();
          }
          },
        ),
      ),
    )
    );
  }


Widget emailFlold(){
  return  Neumorphic(
    style: NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 8,
      color: Color.fromARGB(255, 247, 222, 3),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: _emailController,
             decoration: InputDecoration(
             // border: OutlineInputBorder(),
              icon: Icon(Icons.email),
              hintText: "Email",
              labelText: "Email",
             ),
             validator: (value) {
               if(value==null||value.isEmpty){
                return 'value is Empty';
               }else{
                return null;
               }
             },
             ),
    ),
  );
    
  
}

Widget password(){
  return Neumorphic(
    style: NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 8,
      color: Color.fromARGB(255, 247, 222, 3),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: _emailController,
             decoration: InputDecoration(
              //border: OutlineInputBorder(),
              icon: Icon(Icons.key),
              hintText: "password",
              labelText: "password",
             ),
             validator: (value) {
               if(value==null||value.isEmpty){
                return 'value is Empty';
               }else{
                return null;
               }
             },
             ),
    ),
  );
}

void checkLogin(BuildContext ctx){
  final _email = _emailController.value;
  final _pasword = _passwordController.value;

  if(_email==_pasword){
    print('login');
  }else{
    print('error');
  }
}

}