part of 'cubit_cubit.dart';

abstract class CubitState extends Equatable {
  const CubitState();

}

class CubitInitial extends CubitState {
  
  @override
  List<Object> get props => [];
}


class CubitLoading extends CubitState {
   @override
  List<Object> get props => [];
}

class CubitLoadaed extends CubitState {
  final UserCredential userCredential;
  const CubitLoadaed(this.userCredential);
   @override
  List<Object> get props => [userCredential];
}

class CubitError extends CubitState {
   @override
  List<Object> get props => [];
}
