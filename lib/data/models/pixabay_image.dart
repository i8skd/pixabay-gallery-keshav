class PixabayImage {
  final int id;
  final String pageURL;
  final String previewURL;
  final int views;
  final int likes;

  PixabayImage({
    required this.id,
    required this.pageURL,
    required this.previewURL,
    required this.views,
    required this.likes,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) {
    return PixabayImage(
      id: json['id'],
      pageURL: json['pageURL'],
      previewURL: json['previewURL'],
      views: json['views'],
      likes: json['likes'],
    );
  }
}