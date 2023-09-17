import 'dart:io';

import 'package:bedtime_stories/app/app.locator.dart';
import 'package:bedtime_stories/app/app.logger.dart';
import 'package:bedtime_stories/classes/story_request.dart';
import 'package:bedtime_stories/classes/story_response.dart';
import 'package:bedtime_stories/services/app_preferences_service.dart';
import 'package:dio/dio.dart';

enum _HttpMethod { get, post, put, delete }

class HttpService {
  final AppPreferencesService _preferencesService =
      locator<AppPreferencesService>();
  final log = getLogger('HttpService');

  late final Dio _httpClient;

  HttpService() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: '',
      ),
    );
  }

  Future<StoryResponse?> getStoryResponse({
    required StoryRequest request,
  }) async {
    if (_preferencesService.fetchSavedStory() != null) {
      return _preferencesService.fetchSavedStory();
    }

    final response = await _makeHttpRequest(
      method: _HttpMethod.post,
      path: 'https://api.openai.com/v1/chat/completions',
      body: request.toJson(),
    );

    if (response.statusCode != 200) return null;

    StoryResponse? storyResponse = StoryResponse.fromJson(response.data);
    _preferencesService.saveStory(story: storyResponse);
    // return List<Course>.from(response.data.map((c) => Course.fromJson(c)));
    return storyResponse;
  }

  Future<Response> _makeHttpRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool verbose = false,
    bool verboseResponse = false,
  }) async {
    try {
      final response = await _sendRequest(
        method: method,
        path: path,
        queryParameters: queryParameters,
        body: body,
      );

      final statusText = 'Status Code: ${response.statusCode}';
      final responseText = 'Response Data: ${response.data}';

      if (verbose) {
        log.v('$statusText${verboseResponse ? responseText : ''}');
      }

      return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown && e.error is SocketException) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        rethrow;
      }

      if (e.type == DioErrorType.connectionTimeout) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        rethrow;
      }

      log.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
      rethrow;
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');
      rethrow;
    }
  }

  Future<Response> _sendRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) async {
    Response response;

    Map<String, dynamic> headers = {
      'Authorization':
          'Bearer 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'
    };

    switch (method) {
      case _HttpMethod.post:
        response = await _httpClient.post(path,
            queryParameters: queryParameters,
            data: body,
            options: Options(
              headers: headers,
            ));
        break;
      case _HttpMethod.put:
        response = await _httpClient.put(
          path,
          queryParameters: queryParameters,
          data: body,
        );
        break;
      case _HttpMethod.delete:
        response = await _httpClient.delete(
          path,
          queryParameters: queryParameters,
        );
        break;
      case _HttpMethod.get:
      default:
        response = await _httpClient.get(
          path,
          queryParameters: queryParameters,
        );
    }

    return response;
  }
}
