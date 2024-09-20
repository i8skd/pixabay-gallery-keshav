import 'package:get/get.dart';
import 'package:pixabay_gallery/modules/gallery/bindings/gallery_binding.dart';
import 'package:pixabay_gallery/modules/gallery/views/gallery_view.dart';

//part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.GALLERY;

  static final routes = [
    GetPage(
      name: Routes.GALLERY,
      page: () => GalleryView(),
      binding: GalleryBinding(),
    ),
  ];
}

//part 'app_routes.dart';

abstract class Routes {
  static const GALLERY = '/gallery';
}