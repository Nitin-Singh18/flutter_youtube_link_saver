import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_link_saver/model/video_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../common/const/const.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, List<VideoDetail>>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends StateNotifier<List<VideoDetail>> {
  HomeViewModel() : super([]);

  Future<void> fetchVideoDetails({required String videoUrl}) async {
    try {
      final snippetResponse = await _fetchVideoUrlDetails(videoUrl);
      final VideoDetail videoDetail =
          VideoDetail.fromJson(snippetResponse, videoUrl);
      state = [...state, videoDetail];
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<Map<String, dynamic>> _fetchVideoUrlDetails(
    String videoUrl,
  ) async {
    // Regular expression to match the video ID in the URL.
    final regExp = RegExp(r'v=([A-Za-z0-9_\-]+)');

    final match = regExp.firstMatch(videoUrl);

    if (match != null) {
      final videoId = match.group(1);

      final queryString = '?part=snippet&id=$videoId&key=$apiKey';

      final response =
          await http.get(Uri.parse('$apiUrl$queryString'), headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        final items = decodedJson['items'] as List;
        if (items.isNotEmpty) {
          final item = items[0];
          final snippet = item['snippet'];
          return snippet;
        }
        throw Exception('Failed to get video details');
      } else {
        throw Exception('Failed to fetch video details');
      }
    } else {
      throw Exception('Invalid YouTube URL');
    }
  }
}
