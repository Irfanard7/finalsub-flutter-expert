// ignore_for_file: constant_identifier_names

import 'package:core/presentation/widgets/tvs_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';

class TopRatedTvsPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tvs';

  const TopRatedTvsPage({Key? key}) : super(key: key);

  @override
  _TopRatedTvsPageState createState() => _TopRatedTvsPageState();
}

class _TopRatedTvsPageState extends State<TopRatedTvsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TopRatedTvsBloc>().add(
            TopRatedTvs(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Top rated TV series page'),
      appBar: AppBar(
        title: const Text('Top Rated TV series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvsBloc, TvsState>(
          builder: (context, state) {
            if (state is TopRatedTvsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvsHasData) {
              final result = state.resultTopRatedTvs;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvs = result[index];
                  return TvsCardList(tvs);
                },
                itemCount: result.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}
