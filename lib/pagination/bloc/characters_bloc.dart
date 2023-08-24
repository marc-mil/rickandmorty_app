import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../repo/characters_repo.dart';

part 'characters_event.dart';
part 'characters_state.dart';

// class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
//   CharactersBloc() : super(CharactersInitial()) {
//     on<CharactersEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  CharacterRepo repo;

  CharactersBloc(this.repo) : super(InitState(null)) {

    scrollController.addListener(() {
      add(LoadMoreEvent());
    });


     on<FetchCharactersEvent>((event, emit) async {
       emit(CharacterLoadingState(null));
       var characters = await repo.fetchPosts(page);
       emit(CharacterSuccessState(characters: characters));
     });

     on<LoadMoreEvent>((event, emit) async {
       if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
         isLoadingMore = true;
         page++;
         var characters = await repo.fetchPosts(page);
         emit(CharacterSuccessState(characters: [...state.characters, ...characters]));
       }
     });
   }
}
