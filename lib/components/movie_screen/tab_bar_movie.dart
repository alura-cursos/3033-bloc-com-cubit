import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/screens/checkout.dart';

import '../../models/movie.dart';

class TabBarMovie extends StatelessWidget {
  const TabBarMovie({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Ink(
              height: 45,
              child: const TabBar(
                  tabs: [Tab(text: 'Sessões'), Tab(text: 'Detalhes')]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      _MovieSession(movie: movie),
                    ],
                  ),
                  ListView(
                    children: [
                      _MovieDetail(sinopse: movie.sinopse),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetail extends StatelessWidget {
  const _MovieDetail({required this.sinopse});
  final String? sinopse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sinopse:',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            sinopse ?? 'Sinopse Indispobível.',
          ),
        ),
      ],
    );
  }
}

class _MovieSession extends StatelessWidget {
  const _MovieSession({required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return movie.sessions != null
        ? Wrap(
            spacing: 2.0,
            children: movie.sessions!
                .map(
                  (session) => Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Checkout(movie: movie, session: session),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 60,
                        height: 40,
                        child: Center(child: Text(session)),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        : Column(
            children: const [
              Icon(Icons.error, size: 30),
              Text('Não há sessões disponíveis'),
            ],
          );
  }
}
