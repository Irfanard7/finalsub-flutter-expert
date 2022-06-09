// ignore_for_file: constant_identifier_names

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';

class PopularTvsPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tvs';

  const PopularTvsPage({Key? key}) : super(key: key);

  @override
  _PopularTvsPageState createState() => _PopularTvsPageState();
}

class _PopularTvsPageState extends State<PopularTvsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PopularTvsBloc>().add(
            PopularTvs(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Popular TV series page'),
      appBar: AppBar(
        title: const Text('Popular TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvsBloc, TvsState>(
          builder: (context, state) {
            if (state is PopularTvsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvsHasData) {
              final result = state.resultPopularTvs;
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
