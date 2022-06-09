// ignore_for_file: constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tvseries/domain/entities/tvs_detail.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';

class TvsDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tvs';

  final int id;
  const TvsDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _TvsDetailPageState createState() => _TvsDetailPageState();
}

class _TvsDetailPageState extends State<TvsDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailTvsBloc>().add(
            DetailTvs(widget.id),
          );
      context.read<WatchlistTvsBloc>().add(
            WatchlistStatusTvs(widget.id),
          );
      context.read<RecommendationTvsBloc>().add(
            RecommendationTvs(widget.id),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAddedTvsWatchlist = context.select<WatchlistTvsBloc, bool>((bloc) {
      if (bloc.state is WatchlistTvsHasStatus) {
        return (bloc.state as WatchlistTvsHasStatus).result;
      }
      return false;
    });

    return Scaffold(
      key: const Key('tvs detail content'),
      body: BlocBuilder<DetailTvsBloc, TvsState>(
        builder: (context, state) {
          if (state is TvsDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvsDetailHasData) {
            final result = state.tvsDetail;
            return SafeArea(
              child: TvsDetailContent(
                result,
                isAddedTvsWatchlist,
              ),
            );
          } else if (state is TvsDetailError) {
            return Expanded(
              child: Center(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed'),
            );
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class TvsDetailContent extends StatefulWidget {
  final TvsDetail tvs;
  late bool isAddedTvsWatchlist;

  TvsDetailContent(this.tvs, this.isAddedTvsWatchlist, {Key? key})
      : super(key: key);

  @override
  State<TvsDetailContent> createState() => _TvsDetailContentState();
}

class _TvsDetailContentState extends State<TvsDetailContent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${widget.tvs.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tvs.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!widget.isAddedTvsWatchlist) {
                                  context
                                      .read<WatchlistTvsBloc>()
                                      .add(AddWatchlistTvs(widget.tvs));
                                } else {
                                  context
                                      .read<WatchlistTvsBloc>()
                                      .add(RemoveWatchlistTvs(widget.tvs));
                                }
                                String message = "";
                                const watchlistAddSuccessMessage =
                                    'Added to Watchlist';
                                const watchlistRemoveSuccessMessage =
                                    'Removed from Watchlist';

                                final state =
                                    BlocProvider.of<WatchlistTvsBloc>(context)
                                        .state;

                                if (state is WatchlistTvsHasStatus) {
                                  final status = state.result;
                                  message = status == false
                                      ? watchlistAddSuccessMessage
                                      : watchlistRemoveSuccessMessage;
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                                setState(() {
                                  widget.isAddedTvsWatchlist =
                                      !widget.isAddedTvsWatchlist;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  widget.isAddedTvsWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(widget.tvs.genres),
                            ),
                            Text(
                              widget.tvs.firstAirDate,
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.tvs.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.tvs.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.tvs.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<RecommendationTvsBloc, TvsState>(
                              builder: (context, state) {
                                if (state is TvsRecomLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is TvsRecomError) {
                                  return Center(
                                    child: Text(state.message),
                                  );
                                } else if (state is TvsRecomHasData) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tvs = state.tvs[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvsDetailPage.ROUTE_NAME,
                                                arguments: tvs.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${tvs.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: state.tvs.length,
                                    ),
                                  );
                                } else if (state is TvsRecomEmpty) {
                                  return const Center(
                                    child: Text('No Data.'),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
