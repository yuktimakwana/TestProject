import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Rebloc/EventClass.dart';
import 'package:flutter_app/Rebloc/ModelClass.dart';
import 'package:flutter_app/Rebloc/NewRepository.dart';
import 'package:flutter_app/Rebloc/StateClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocClass extends Bloc<Eventclass, StateClass> {
  NewRepository repository;

  BlocClass({required this.repository}) : super(null);

  StateClass get initialState => initialState;
  @override
  Stream<StateClass> mapEventToState(Eventclass event) async* {
    if (event is SubEventClass) {
      yield LoadingState();

      try {
        List<Records> records = await repository.getData();
        yield LoadedState(records: records);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}