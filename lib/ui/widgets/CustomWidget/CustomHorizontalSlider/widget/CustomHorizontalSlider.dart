import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/core/utils/FToast.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/ItemSlider.dart';

class CustomHorizontalSlider extends StatelessWidget {
  const CustomHorizontalSlider({
    Key? key,
    required this.type,
    this.isGenre,
    required this.title,
  }) : super(key: key);

  final String type;
  final String title;
  final bool? isGenre;

  @override
  Widget build(BuildContext context) {
    final CustomHorizontalSliderController controller = Get.find(tag: type);

    return Container(
      height: 450,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: title,
                ),
                BaseText(
                  text: 'See All',
                  onPressed: () => controller.navigateToSeeAll(),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? const CupertinoActivityIndicator(
                      color: ColorIndex.primaryText,
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.listMovies.value.length,
                      controller: controller.scrollController,
                      itemBuilder: (_, index) {
                        return ItemSlider(
                            title: controller.listMovies.value[index].title!,
                            backdropPath: controller
                                .listMovies.value[index].backdropPath!,
                            voteAverage: double.parse(controller
                                .listMovies.value[index].voteAverage!),
                            posterPath:
                                controller.listMovies.value[index].posterPath!,
                            id: controller.listMovies.value[index].id!
                                .toString(),
                            releaseDate: controller
                                .listMovies.value[index].releaseDate!);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
