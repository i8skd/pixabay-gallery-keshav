import 'package:get/get.dart';
import 'package:pixabay_gallery/data/models/pixabay_image.dart';
import 'package:pixabay_gallery/utils/constants.dart';

class PixabayProvider extends GetConnect {
  Future<List<PixabayImage>> getImages(int page, int perPage) async {
    final response = await get(
      '${Constants.pixabayBaseUrl}?key=${Constants.pixabayApiKey}&page=$page&per_page=$perPage',
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return (response.body['hits'] as List)
          .map((image) => PixabayImage.fromJson(image))
          .toList();
    }
  }
}