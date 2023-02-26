// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_1/cubit/cubit/cubit_cubit.dart';
// import 'package:flutter_application_1/screens/login.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// TextEditingController _emailController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();

// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CubitCubit, CubitState>(
//       listener: (context, state) {
//         if (state is CubitLoadaed) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LoginPage(),
//               ));
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("Success")));
//         } else {}
//       },
//       child: Scaffold(
//         body: Center(child: BlocBuilder<CubitCubit, CubitState>(
//           builder: (context, state) {
//             if(state is CubitInitial){
//             return Column(
//               children: [
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     hintText: "Emai",
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     hintText: "passeord",
//                   ),
//                 ),
//                 ElevatedButton(onPressed: () {
//                   BlocProvider.of<CubitCubit>(context).registerWithEmaiPAssword(_emailController.text, _passwordController.text);
//                 }, child: Text("Register"))
//               ],
//             );
//           }else if(state is CubitLoading){
//               return CircularProgressIndicator();
//           }else{
//             return Container(
              
//               child:Text("Container"),
//             );
//           }
//   },
//         )),
//       ),
//     );
//   }
// }
