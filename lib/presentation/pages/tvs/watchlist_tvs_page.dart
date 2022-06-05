import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/provider/tvs/watchlist_tvs_notifier.dart';
import 'package:ditonton/presentation/widgets/tvs_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistTvsPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist_tvs';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistTvsPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistTvsNotifier>(context, listen: false)
            .fetchWatchlistTvs());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistTvsNotifier>(context, listen: false)
        .fetchWatchlistTvs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist TV series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<WatchlistTvsNotifier>(
          builder: (context, data, child) {
            if (data.watchlistTvsState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.watchlistTvsState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvs = data.watchlistTvs[index];
                  return TvsCardList(tvs);
                },
                itemCount: data.watchlistTvs.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
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
