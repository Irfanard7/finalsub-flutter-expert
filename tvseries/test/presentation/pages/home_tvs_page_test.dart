import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/tvseries.dart';

import '../../dummy/dummy_tvs_objects.dart';
import '../../helpers/test_helper.dart';

void main() {
  late FakeNowPlayingTvsBloc fakeNowPlayingTvsBloc;
  late FakePopularTvsBloc fakePopularTvsBloc;
  late FakeTopRatedTvsBloc fakeTopRatedTvsBloc;

  setUp(() {
    fakeNowPlayingTvsBloc = FakeNowPlayingTvsBloc();
    registerFallbackValue(FakeNowPlayingTvsE());
    registerFallbackValue(FakeNowPlayingTvsS());
    fakePopularTvsBloc = FakePopularTvsBloc();
    registerFallbackValue(FakePopularTvsE());
    registerFallbackValue(FakePopularTvsS());
    fakeTopRatedTvsBloc = FakeTopRatedTvsBloc();
    registerFallbackValue(FakeTopRatedTvsE());
    registerFallbackValue(FakeTopRatedTvsS());
  });

  tearDown(() {
    fakeNowPlayingTvsBloc.close();
    fakePopularTvsBloc.close();
    fakeTopRatedTvsBloc.close();
  });

  Widget _createTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingTvsBloc>(
          create: (context) => fakeNowPlayingTvsBloc,
        ),
        BlocProvider<PopularTvsBloc>(
          create: (context) => fakePopularTvsBloc,
        ),
        BlocProvider<TopRatedTvsBloc>(
          create: (context) => fakeTopRatedTvsBloc,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets(
      'page should display listview of [Now Playing Movie, Popular Movie, Top Rated Movie] when HasData state is happen',
      (WidgetTester tester) async {
    when(() => fakeNowPlayingTvsBloc.state)
        .thenReturn(NowPlayingTvsHasData(tvsTestList));
    when(() => fakePopularTvsBloc.state)
        .thenReturn(PopularTvsHasData(tvsTestList));
    when(() => fakeTopRatedTvsBloc.state)
        .thenReturn(TopRatedTvsHasData(tvsTestList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_createTestableWidget(const HomeTvsPage()));

    expect(listViewFinder, findsWidgets);
  });
}
