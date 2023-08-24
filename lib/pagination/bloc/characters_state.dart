part of 'characters_bloc.dart';


abstract class CharactersState{
  final characters;
  CharactersState(this.characters);
}

class InitState extends CharactersState{
  InitState(super.characters);
}

class CharacterLoadingState extends CharactersState {
  CharacterLoadingState(super.characters);
}

class CharacterSuccessState extends CharactersState{
  CharacterSuccessState({required characters}) : super(characters);
}

// abstract class CharactersState {}
//
// class CharactersInitial extends CharactersState {}
