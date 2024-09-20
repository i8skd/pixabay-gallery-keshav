import 'package:get/get.dart';
import 'package:pixabay_gallery/data/models/pixabay_image.dart';
import 'package:pixabay_gallery/data/providers/pixabay_provider.dart';

class GalleryController extends GetxController {
  final PixabayProvider pixabayProvider;

  GalleryController({required this.pixabayProvider});

  var images = <PixabayImage>[].obs;
  var isLoading = false.obs;
  var page = 1;
  final perPage = 20;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    if (isLoading.value) return;
    isLoading(true);
    try {
      final newImages = await pixabayProvider.getImages(page, perPage);
      images.addAll(newImages);
      page++;
    } catch (error) {
      Get.snackbar('Error', 'Failed to load images');
    } finally {
      isLoading(false);
    }
  }
}