import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial());

  SplashScreenState get initialState=>SplashScreenInitial();

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event)async*{
    if(event is NavigateToHomeScreenEvent){
      yield SplashScreenLoading();

      await Future.delayed(Duration(seconds: 4));
      yield SplashScreenLoaded();
    }
  }
}
