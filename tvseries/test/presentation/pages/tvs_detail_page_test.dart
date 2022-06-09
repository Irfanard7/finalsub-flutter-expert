import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';
import 'package:tvseries/presentation/pages/tvs_detail_page.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.dart';

void main() {
  late FakeDetailTvsBloc fakeDetailTvsBloc;
  late FakeRecommendationTvsBloc fakeRecommendationTvsBloc;
  late FakeWatchlistTvsBloc fakeWatchlistTvsBloc;

  setUp(() {
    fakeDetailTvsBloc = FakeDetailTvsBloc();
    registerFallbackValue(FakeDetailTvsE());
    registerFallbackValue(FakeDetailTvsS());
    fakeRecommendationTvsBloc = FakeRecommendationTvsBloc();
    registerFallbackValue(FakeRecommendationTvsE());
    registerFallbackValue(FakeRecommendationTvsS());
    fakeWatchlistTvsBloc = FakeWatchlistTvsBloc();
    registerFallbackValue(FakeWatchlistTvsE());
    registerFallbackValue(FakeWatchlistTvsS());
  });

  tearDown(() {
    fakeDetailTvsBloc.close();
    fakeRecommendationTvsBloc.close();
    fakeWatchlistTvsBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailTvsBloc>(
          create: (context) => fakeDetailTvsBloc,
        ),
        BlocProvider<RecommendationTvsBloc>(
          create: (context) => fakeRecommendationTvsBloc,
        ),
        BlocProvider<WatchlistTvsBloc>(
          create: (context) => fakeWatchlistTvsBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const idTest = 1;

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeDetailTvsBloc.state).thenReturn(TvsDetailLoading());
    when(() => fakeRecommendationTvsBloc.state).thenReturn(TvsRecomLoading());
    when(() => fakeWatchlistTvsBloc.state).thenReturn(WatchlistTvsLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(const TvsDetailPage(
      id: idTest,
    )));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets('Should widget display which all required',
      (WidgetTester tester) async {
    when(() => fakeDetailTvsBloc.state)
        .thenReturn(const TvsDetailHasData(tvsDetailTest));
    when(() => fakeRecommendationTvsBloc.state)
        .thenReturn(TvsRecomHasData(tvsTestList));
    when(() => fakeWatchlistTvsBloc.state)
        .thenReturn(WatchlistTvsHasList(tvsTestList));
    await tester
        .pumpWidget(_createTestableWidget(const TvsDetailPage(id: idTest)));
    await tester.pump();

    expect(find.text('Watchlist'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Recommendations'), findsOneWidget);
    expect(find.byKey(const Key('tvs detail content')), findsOneWidget);
  });
}
