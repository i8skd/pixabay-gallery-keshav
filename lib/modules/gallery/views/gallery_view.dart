import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery/modules/gallery/controllers/gallery_controller.dart';
import 'package:pixabay_gallery/utils/common_methods.dart';

class GalleryView extends GetView<GalleryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Pixabay Gallery By Keshav', titleColor: Colors.black, appBarColor: Colors.white),
      body: Obx(
            () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.of(context).size.width / 150).floor(),
            childAspectRatio: 1,
          ),
          itemCount: controller.images.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.images.length) {
              return Center(
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: controller.fetchImages,
                  child: Text('Load More'),
                ),
              );
            }

            final image = controller.images[index];

            return GestureDetector(
              onLongPress: () {
                _showImagePopup(context, image.previewURL); // Show popup on long press
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    // Full cover image
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          image.previewURL,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),

                    // Gradient overlay and text with icons
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${image.likes}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.visibility,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${image.views}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to show popup with zoomable image
  void _showImagePopup(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          insetPadding: EdgeInsets.all(10), // Space around the dialog
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
            height: MediaQuery.of(context).size.height * 0.7, // 70% of screen height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale: 1.0,
                maxScale: 4.0, // Allows up to 4x zoom
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain, // Contain the image inside the popup
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
