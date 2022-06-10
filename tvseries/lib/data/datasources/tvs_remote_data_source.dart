// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:tvseries/tvseries.dart';

abstract class TvsRemoteDataSource {
  Future<List<TvsModel>> getNowPlayingTvs();
  Future<List<TvsModel>> getPopularTvs();
  Future<List<TvsModel>> getTopRatedTvs();
  Future<List<TvsModel>> getTvsRecommendations(int id);
  Future<List<TvsModel>> searchTvs(String query);
  Future<TvsDetailResponse> getTvsDetail(int id);
}

class TvsRemoteDataSourceImpl implements TvsRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvsRemoteDataSourceImpl({required this.client});

  Future<SecurityContext> get globalContext async {
    final sslCert = await rootBundle.load('certificates/certificate.pem');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }

  @override
  Future<List<TvsModel>> getNowPlayingTvs() async {
    HttpClient clientCert = HttpClient(context: await globalContext);
    clientCert.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(clientCert);

    final response =
        await ioClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvsResponse.fromJson(json.decode(response.body)).tvsList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvsModel>> getPopularTvs() async {
    HttpClient clientCert = HttpClient(context: await globalContext);
    clientCert.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(clientCert);

    final response =
        await ioClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvsResponse.fromJson(json.decode(response.body)).tvsList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvsModel>> getTopRatedTvs() async {
    HttpClient clientCert = HttpClient(context: await globalContext);
    clientCert.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(clientCert);

    final response =
        await ioClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvsResponse.fromJson(json.decode(response.body)).tvsList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvsDetailResponse> getTvsDetail(int id) async {
    HttpClient clientCert = HttpClient(context: await globalContext);
    clientCert.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(clientCert);

    final response = await ioClient.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvsDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvsModel>> getTvsRecommendations(int id) async {
    HttpClient clientCert = HttpClient(context: await globalContext);
    clientCert.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(clientCert);

    final response = await ioClient
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvsResponse.fromJson(json.decode(response.body)).tvsList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvsModel>> searchTvs(String query) async {
    HttpClient clientCert = HttpClient(context: await globalContext);
    clientCert.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(clientCert);

    final response = await ioClient
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TvsResponse.fromJson(json.decode(response.body)).tvsList;
    } else {
      throw ServerException();
    }
  }
}
