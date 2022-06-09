// ignore_for_file: constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';
import 'package:tvseries/tvseries.dart';
import 'package:about/about.dart';

class HomeTvsPage extends StatefulWidget {
  const HomeTvsPage({Key? key}) : super(key: key);

  @override
  _HomeTvsPageState createState() => _HomeTvsPageState();
  static const ROUTE_NAME = '/tvs';
}

class _HomeTvsPageState extends State<HomeTvsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<NowPlayingTvsBloc>(context, listen: false).add(
        NowPlayingTvs(),
      );
      BlocProvider.of<PopularTvsBloc>(context, listen: false).add(
        PopularTvs(),
      );
      BlocProvider.of<TopRatedTvsBloc>(context, listen: false).add(
        TopRatedTvs(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('TV Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              children: [
                ListTile(
                  leading: const Icon(Icons.movie),
                  title: const Text('Movies'),
                  onTap: () {
                    Navigator.pushNamed(
                        context, WatchlistMoviesPage.ROUTE_NAME);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.tv),
                  title: const Text('TV series'),
                  onTap: () {
                    Navigator.pushNamed(context, WatchlistTvsPage.ROUTE_NAME);
                  },
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TvsSearchPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing TV series',
                style: kHeading6,
              ),
              BlocBuilder<NowPlayingTvsBloc, TvsState>(
                  builder: (context, state) {
                if (state is NowPlayingTvsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NowPlayingTvsHasData) {
                  final result = state.resultNowPlayingTvs;
                  return TvsList(result);
                } else if (state is NowPlayingTvsError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        key: const Key('error'),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Failed'),
                  );
                }
              }),
              _buildSubHeading(
                title: 'Popular TV series',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvsPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularTvsBloc, TvsState>(builder: (context, state) {
                if (state is PopularTvsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PopularTvsHasData) {
                  final result = state.resultPopularTvs;
                  return TvsList(result);
                } else if (state is PopularTvsError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        key: const Key('error'),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Failed'),
                  );
                }
              }),
              _buildSubHeading(
                title: 'Top Rated TV series',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTvsPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedTvsBloc, TvsState>(builder: (context, state) {
                if (state is TopRatedTvsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TopRatedTvsHasData) {
                  final result = state.resultTopRatedTvs;
                  return TvsList(result);
                } else if (state is TopRatedTvsError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        key: const Key('error'),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Failed'),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvsList extends StatelessWidget {
  final List<Tvs> tvSeries;

  const TvsList(this.tvSeries, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvs = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvsDetailPage.ROUTE_NAME,
                  arguments: tvs.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvs.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
