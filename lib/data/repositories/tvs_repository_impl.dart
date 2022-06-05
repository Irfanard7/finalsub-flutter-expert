import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tvs/tvs_local_data_source.dart';
import 'package:ditonton/data/datasources/tvs/tvs_remote_data_source.dart';
import 'package:ditonton/data/models/tvs/tvs_table.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class TvsRepositoryImpl implements TvsRepository {
  final TvsRemoteDataSource remoteDataSource;
  final TvsLocalDataSource localDataSource;

  TvsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Tvs>>> getNowPlayingTvs() async {
    try {
      final result = await remoteDataSource.getNowPlayingTvs();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getPopularTvs() async {
    try {
      final result = await remoteDataSource.getPopularTvs();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getTopRatedTvs() async {
    try {
      final result = await remoteDataSource.getTopRatedTvs();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvsDetail>> getTvsDetail(int id) async {
    try {
      final result = await remoteDataSource.getTvsDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getTvsRecommendations(int id) async {
    try {
      final result = await remoteDataSource.getTvsRecommendations(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getWatchlistTvs() async {
    final result = await localDataSource.getWatchListTvs();
    return Right(result.map((e) => e.toEntity()).toList());
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getTvsById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(TvsDetail tvs) async {
    try {
      final result =
          await localDataSource.removeWatchListTvs(TvsTable.fromEntity(tvs));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(TvsDetail tvs) async {
    try {
      final result =
          await localDataSource.insertWatchListTvs(TvsTable.fromEntity(tvs));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> searchTvs(String query) async {
    try {
      final result = await remoteDataSource.searchTvs(query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
