// ignore_for_file: constant_identifier_names

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';

class WatchlistTvsPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-tvs';

  const WatchlistTvsPage({Key? key}) : super(key: key);

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistTvsPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<WatchlistTvsBloc>().add(
            WatchlistTvsList(),
          ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<WatchlistTvsBloc>().add(
          WatchlistTvsList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('watchlist tvs page'),
      appBar: AppBar(
        title: const Text('Watchlist TV series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistTvsBloc, WatchlistTvsState>(
          builder: (context, state) {
            if (state is WatchlistTvsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WatchlistTvsError) {
              return Center(
                child: Text(
                  state.message,
                  key: const Key('error_message'),
                ),
              );
            } else if (state is WatchlistTvsHasList) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvs = state.tvs[index];
                  return TvsCardList(tvs);
                },
                itemCount: state.tvs.length,
              );
            } else {
              return const Center(
                child: Text(''),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
