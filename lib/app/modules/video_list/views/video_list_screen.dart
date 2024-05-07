import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/video_list/controllers/video_list_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoListController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.lessonsMenu.tr,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey),
                itemCount: controller.videos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      controller.videos[index].title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.VIDEO_PLAYER,
                          arguments: controller.videos[index].id.value);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
