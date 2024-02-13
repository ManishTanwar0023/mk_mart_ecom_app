import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageLoopController extends GetxController {
  // List of image URLs
  final List<String> imageUrls = [
    'https://media.istockphoto.com/id/164981421/photo/large-group-of-food-shoot-on-white-backdrop.jpg?s=612x612&w=0&k=20&c=S3UjegrKBG-HyZdYQmOeBCk1Cfk7C7XZrUGb0n56Gy8=',
    'https://media.istockphoto.com/id/915312176/vector/canned-goods-in-a-row.jpg?s=612x612&w=0&k=20&c=HgnYqvDLumZj0OwpV38TbNym4mJXs9vF5ESAKfcgDFo=',
    'https://media.istockphoto.com/id/455429547/vector/supermarket-with-cleaning-product-packaging.jpg?s=612x612&w=0&k=20&c=Q7IUcwnmqjgK1AB0QgVVJjxttSbe0yUEQiNuhbGbNFY=',
    'https://media.istockphoto.com/id/484817201/vector/fruit-pile.jpg?s=612x612&w=0&k=20&c=oRhmZt7iij7uu4RCI1-r1gk1LmN3QtzTVXQgvM4wn04=',
    'https://media.istockphoto.com/id/515443264/photo/home-appliance-in-the-store.jpg?s=612x612&w=0&k=20&c=Zi69da3N5D31WXba7U9H2Rw4jWt_5IngnZAeZ3Kzix8=',
    'https://media.istockphoto.com/id/1328836875/vector/realistic-electronic-devices-and-gadgets-in-isometry-vector-isometric-illustration-of.jpg?s=612x612&w=0&k=20&c=4iwItEQ1P3lhjl350QXRl5IrgC8ufDImaoc-7_H5vVA=',
    'https://media.istockphoto.com/id/831656828/photo/luxury-clothing-store-for-men.jpg?s=612x612&w=0&k=20&c=r9vD1Nvv_W0uco8RN7jPKx2HJ7zxj3ISrnbP5XhGszg=',
    // Add more image URLs as needed
  ].obs;

  // Index of the currently displayed image
  var currentIndex = 0.obs;

  // Timer to automatically change images
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    // Start the timer when the controller is initialized
    startTimer();
  }

  void startTimer() {
    // Set up a timer to change the image every 3 seconds
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      // Increment the index, and loop back to the beginning if necessary
      currentIndex.value = (currentIndex.value + 1) % imageUrls.length;
    });
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed
    timer.cancel();
    super.onClose();
  }
}

class ImageLoopScreen extends StatelessWidget {
  final ImageLoopController controller = Get.put(ImageLoopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Loop Example'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width*0.8,// Adjust the height according to your needs
          child: Obx(
                () => Image.network(
              controller.imageUrls[controller.currentIndex.value],
              width: 150, // Adjust the width according to your needs
              height: 150, // Adjust the height according to your needs
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageLoopScreen(),
    ),
  );
}


