import 'package:bilheteria_panucci/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/components/classification.dart';
import 'package:bilheteria_panucci/components/home/genre_filter.dart';
import 'package:bilheteria_panucci/components/movie_card.dart';
import 'package:bilheteria_panucci/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    homeCubit.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(
                  "Filmes",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GenreFilter(homeCubit: homeCubit,),
              BlocBuilder<HomeCubit, HomeStates>(
                bloc: homeCubit,
                builder: (context, state) {
                  if(state is HomeLoading) {
                    return const SliverFillRemaining(child: Center(child: CircularProgressIndicator(),));
                  } else if(state is HomeSuccess) {
                    if(state.movies.isEmpty) {
                      return SliverFillRemaining(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.not_interested, size: 30.0,),
                          SizedBox(height: 16.0,),
                          Text("Não existem filmes com este gênero!"),
                        ],
                      ),);
                    } else {
                      return SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 240,
                        ),
                        itemBuilder: (context, index) {
                          return MovieCard(
                              movie: state.movies[index]);
                        },
                        itemCount: state.movies.length,
                      );
                    }
                  } else if(state is HomeError){
                    return SliverFillRemaining(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.not_interested, size: 30.0,),
                        const SizedBox(height: 16.00,),
                        Text(state.error)
                      ],
                    ));
                  }
                  return SliverToBoxAdapter(child: Container(),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
