class VideoDetail {
  final String title;

  final String descriotion;

  final String url;

  VideoDetail(this.title, this.descriotion, this.url);

  factory VideoDetail.fromJson(Map<String, dynamic> json, String url) {
    return VideoDetail(
      json['title'] ?? '',
      json['description'] ?? '',
      url,
    );
  }
}
