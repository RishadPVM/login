import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/cubit/cubit/repo.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());
  final AuthRepo repo=AuthRepo();
  loginWithEmaiPassword(String email,String password)async{
    emit(CubitLoading());
    try {
      UserCredential userCredential=repo.loginWithEmailPassword(email, password);
      if(userCredential==null){
        emit(CubitError());
      }else{
        emit(CubitLoadaed(userCredential));
      }
    } catch (ex) {
      
    }
  }
  // registerWithEmaiPAssword(String email , String password)async{
  //   emit(CubitLoading());
  // try {
  //    UserCredential userCredential=repo.registerWithEmaiPAssword(email, password);
  //   if(userCredential !=null){
  //     emit(CubitLoadaed(userCredential));
  //   }else{
  //     emit(CubitError());
  //     await Future.delayed(Duration(seconds: 2));
  //     emit(CubitInitial());
  //   }
  // } catch (ex) {
  //   throw Exception(ex);
  // }
    
  // }
}



