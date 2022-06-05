import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/tvs/popular_tvs_page.dart';
import 'package:ditonton/presentation/pages/tvs/top_rated_tvs_page.dart';
import 'package:ditonton/presentation/pages/tvs/tvs_detail_page.dart';
import 'package:ditonton/presentation/pages/tvs/tvs_search_page.dart';
import 'package:ditonton/presentation/pages/tvs/watchlist_tvs_page.dart';
import 'package:ditonton/presentation/provider/tvs/tvs_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTvsPage extends StatefulWidget {
  @override
  _HomeTvsPageState createState() => _HomeTvsPageState();
  static const ROUTE_NAME = '/tvs';
}

class _HomeTvsPageState extends State<HomeTvsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvsListNotifier>(context, listen: false)
      ..fetchNowPlayingTvs()
      ..fetchPopularTvs()
      ..fetchTopRatedTvs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('TV Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              children: [
                ListTile(
                  leading: Icon(Icons.movie),
                  title: Text('Movies'),
                  onTap: () {
                    Navigator.pushNamed(
                        context, WatchlistMoviesPage.ROUTE_NAME);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.tv),
                  title: Text('TV series'),
                  onTap: () {
                    Navigator.pushNamed(context, WatchlistTvsPage.ROUTE_NAME);
                  },
                )
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TvsSearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
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
                'Now Playing TV Series',
                style: kHeading6,
              ),
              Consumer<TvsListNotifier>(builder: (context, data, child) {
                final state = data.nowPlayingTvsState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvsList(data.nowPlayingTvs);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                  title: 'Popular TV Series',
                  onTap: () {
                    Navigator.pushNamed(context, PopularTvsPage.ROUTE_NAME);
                  }),
              Consumer<TvsListNotifier>(builder: (context, data, child) {
                final state = data.popularTvsState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvsList(data.popularTvs);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                  title: 'Top Rated TV Series',
                  onTap: () => {
                        Navigator.pushNamed(
                            context, TopRatedTvsPage.ROUTE_NAME),
                      }),
              Consumer<TvsListNotifier>(builder: (context, data, child) {
                final state = data.topRatedTvsState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvsList(data.topRatedTvs);
                } else {
                  return Text('Failed');
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
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvsList extends StatelessWidget {
  final List<Tvs> tv;

  TvsList(this.tv);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvs = tv[index];
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
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvs.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tv.length,
      ),
    );
  }
}
