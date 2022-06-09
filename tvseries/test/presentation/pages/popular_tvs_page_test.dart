import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tvs_bloc.dart';
import 'package:tvseries/presentation/pages/popular_tvs_page.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.dart';

void main() {
  late FakePopularTvsBloc fakePopularTvsBloc;

  setUp(() {
    fakePopularTvsBloc = FakePopularTvsBloc();
    registerFallbackValue(FakePopularTvsE());
    registerFallbackValue(FakePopularTvsS());
  });

  tearDown(() {
    fakePopularTvsBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return BlocProvider<PopularTvsBloc>(
      create: (_) => fakePopularTvsBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets('Should display circular progress indicator when loading',
      (WidgetTester tester) async {
    when(() => fakePopularTvsBloc.state).thenReturn(PopularTvsLoading());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_createTestableWidget(const PopularTvsPage()));
    await tester.pump();

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'Should display AppBar, ListView, TvsCardList, and PopularTvsPage when data fetched successfully',
      (WidgetTester tester) async {
    when(() => fakePopularTvsBloc.state)
        .thenReturn(PopularTvsHasData(tvsTestList));
    await tester.pumpWidget(_createTestableWidget(const PopularTvsPage()));
    await tester.pump();

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TvsCardList), findsOneWidget);
    expect(find.byKey(const Key('Popular TV series page')), findsOneWidget);
  });
}
