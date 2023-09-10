import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/ItemSlider.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  final String type;
  final String title;

  @override
  Widget build(BuildContext context) {
    CustomHorizontalSliderController controller = Get.find(tag: type);

    return Container(
      color: ColorIndex.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: BaseText(
              text: '$title Movies',
            ),
          ),
          body: Container(
            color: ColorIndex.primary,
            height: Get.height,
            child: Obx(
              () => AlignedGridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                shrinkWrap: true,
                crossAxisSpacing: 2,
                controller: controller.stagScrollController,
                itemCount: controller.listMovies.value.length,
                itemBuilder: (_, index) {
                  return ItemSlider(
                      title: controller.listMovies.value[index].title!,
                      backdropPath:
                          controller.listMovies.value[index].backdropPath!,
                      posterPath:
                          controller.listMovies.value[index].posterPath!,
                      id: controller.listMovies.value[index].id!.toString(),
                      releaseDate:
                          controller.listMovies.value[index].releaseDate!);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
