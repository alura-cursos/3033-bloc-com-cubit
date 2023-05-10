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
              const GenreFilter(),
              BlocBuilder<HomeCubit, HomeStates>(
                bloc: homeCubit,
                builder: (context, state) {
                  if(state == HomeLoading) {
                    return SliverFillRemaining(child: Center(child: CircularProgressIndicator(),));
                  } else if(state == HomeSuccess) {
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 240,
                      ),
                      itemBuilder: (context, index) {
                        return MovieCard(
                            movie: Movie(
                                name: "James Bond",
                                classification: Classification.naoRecomendado12,
                                duration: "1h 22min",
                                sinopse: "James Bond é um agente",
                                genre: "Suspense",
                                imageURI: null,
                                sessions: ["18:00"]));
                      },
                      itemCount: 5,
                    );
                  } else {
                    return SliverFillRemaining(child: Center(child: Text('Deu erro'),));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
