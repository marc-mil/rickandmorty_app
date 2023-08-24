import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/pagination/bloc/characters_bloc.dart';
import 'package:shopping_app/pagination/repo/characters_repo.dart';
import 'package:shopping_app/widgets/app_bar.dart';

import '../../drawer/views/drawer.dart';

class PaginationPage extends StatelessWidget {
  const PaginationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ShoppingDrawer(),
      appBar: const ShoppingAppBar(),
      body: RepositoryProvider<CharacterRepo>(
        create: (context) => CharacterRepo(),
        child: BlocProvider<CharactersBloc>(
          create: (context) => CharactersBloc(context.read<CharacterRepo>())..add(FetchCharactersEvent()),
          child: BlocBuilder<CharactersBloc, CharactersState>(
            builder: (context, state){
              if(state is CharacterLoadingState){
                return const Center(child: CircularProgressIndicator(),);
              } else if (state is CharacterSuccessState) {
                var characters = state.characters;
                return ListView.builder(
                  controller: context.read<CharactersBloc>().scrollController,
                  itemCount: context.read<CharactersBloc>().isLoadingMore
                  ? characters.length + 1 : characters.length,
                  itemBuilder: (context, index) {
                    if (index >= characters.length){
                      return const Center(child: CircularProgressIndicator(),);
                    } else {
                      var character = characters[index];
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: GestureDetector(
                          onTap:  () => Navigator.of(context).pushNamed('/product', arguments: character),
                          child: Card(
                              color: Theme.of(context).primaryColor,
                              child: ListTile(
                                  title: Text(
                                    '${character['name']}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    '${character['species']}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        character['image'].toString()),
                                  ))),
                        ),
                      );
                    }
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}