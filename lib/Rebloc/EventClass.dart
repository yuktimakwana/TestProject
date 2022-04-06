import 'package:equatable/equatable.dart';

abstract class Eventclass extends Equatable {}

class SubEventClass extends Eventclass {
  @override
  List<Object> get props => [];
}