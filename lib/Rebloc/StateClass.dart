import 'package:equatable/equatable.dart';
import 'package:flutter_app/Rebloc/ModelClass.dart';

abstract class StateClass extends Equatable {

}

class InitialState extends StateClass {
  @override
  List<Object> get props => [];
}

class LoadingState extends StateClass {
  @override
  List<Object> get props => [];
}

class LoadedState extends StateClass {
  List<Records> records;

  LoadedState({required this.records});

  @override
  List<Object> get props => [];
}

class ErrorState extends StateClass {
  String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [];
}
