import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/video_list/controllers/video_list_controller.dart';

class VideoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoListController>(() => VideoListController());
  }
}
