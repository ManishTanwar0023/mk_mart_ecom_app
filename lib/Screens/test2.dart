import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/imagesController.dart';


class Test2 extends StatelessWidget {
  final ImageController c = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Images from Api'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: c.data.length,
          itemBuilder: (context, index) {
           // final item = c.data[index];
            return ListTile(
              title: Image.network("https://manishtanwar.online/"+c.data[index].image0,scale: 1.0,),
              subtitle: Image.network("https://manishtanwar.online/"+c.data[index].image1,scale: 1.0,),
            );
          },
        ),
      ),
    );
  }
}
