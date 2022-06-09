import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';
import 'package:tvseries/presentation/pages/watchlist_tvs_page.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.dart';

void main() {
  late FakeWatchlistTvsBloc fakeWatchlistTvsBloc;

  setUp(() {
    fakeWatchlistTvsBloc = FakeWatchlistTvsBloc();
    registerFallbackValue(FakeWatchlistTvsE());
    registerFallbackValue(FakeWatchlistTvsS());
  });

  tearDown(() {
    fakeWatchlistTvsBloc.close();
  });
  Widget _createTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvsBloc>(
      create: (_) => fakeWatchlistTvsBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeWatchlistTvsBloc.state).thenReturn(WatchlistTvsLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(const WatchlistTvsPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Should display AppBar, ListView, TvsCardList, and WatchlistTvsPage when data is fetched successfully',
      (WidgetTester tester) async {
    when(() => fakeWatchlistTvsBloc.state)
        .thenReturn(WatchlistTvsHasList(tvsTestList));
    await tester.pumpWidget(_createTestableWidget(const WatchlistTvsPage()));
    await tester.pump();

    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TvsCardList), findsOneWidget);
    expect(find.byKey(const Key('watchlist tvs page')), findsOneWidget);
  });

  testWidgets('Should display text with message when error',
      (WidgetTester tester) async {
    const errorMessage = 'error message';

    when(() => fakeWatchlistTvsBloc.state)
        .thenReturn(const WatchlistTvsError(errorMessage));

    final textMessageKeyFinder = find.byKey(const Key('error_message'));
    await tester.pumpWidget(_createTestableWidget(const WatchlistTvsPage()));
    await tester.pump();

    expect(textMessageKeyFinder, findsOneWidget);
  });
}
