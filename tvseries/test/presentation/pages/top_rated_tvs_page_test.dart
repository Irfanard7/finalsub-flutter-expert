import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';
import 'package:tvseries/presentation/pages/top_rated_tvs_page.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.dart';

void main() {
  late FakeTopRatedTvsBloc fakeTopRatedTvsBloc;

  setUp(() {
    fakeTopRatedTvsBloc = FakeTopRatedTvsBloc();
    registerFallbackValue(FakeTopRatedTvsE());
    registerFallbackValue(FakeTopRatedTvsS());
  });

  tearDown(() {
    fakeTopRatedTvsBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvsBloc>(
      create: (_) => fakeTopRatedTvsBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakeTopRatedTvsBloc.state).thenReturn(TopRatedTvsLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(const TopRatedTvsPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Should display AppBar, ListView, TvsCardList, and TopRatedTvsPage when data fetched successfully',
      (WidgetTester tester) async {
    when(() => fakeTopRatedTvsBloc.state)
        .thenReturn(TopRatedTvsHasData(tvsTestList));
    await tester.pumpWidget(_createTestableWidget(const TopRatedTvsPage()));
    await tester.pump();

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TvsCardList), findsOneWidget);
    expect(find.byKey(const Key('Top rated TV series page')), findsOneWidget);
  });
}
