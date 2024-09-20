import 'package:get/get.dart';
import 'package:pixabay_gallery/data/providers/pixabay_provider.dart';
import 'package:pixabay_gallery/modules/gallery/controllers/gallery_controller.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PixabayProvider());
    Get.lazyPut(() => GalleryController(pixabayProvider: Get.find()));
  }
}