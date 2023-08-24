part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}


//both new lines
class FetchCharactersEvent extends CharactersEvent {}

class LoadMoreEvent extends CharactersEvent {}
