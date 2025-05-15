import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../core/constants/appFonts.dart';
import '../controllers/hadiths_controller.dart';
import '../../domain/entities/hadith.dart';
import '../../domain/entities/section.dart';
import '../widgets/hadith/hadithCard.dart';
import '../widgets/hadith/hadithBottomSheet.dart';

class HadithsScreen extends StatelessWidget {
  final int chapterId;
  final int bookId;

  const HadithsScreen({
    required this.chapterId,
    required this.bookId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HadithsController>();
    controller.fetchHadiths(chapterId, bookId);

    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.hadiths.isNotEmpty
                      ? controller.hadiths[0].bookName
                      : controller.chapter.value?.bookName ?? 'Loading...',
                  style: h2.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  controller.chapter.value?.title ?? 'Loading...',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            )),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.hadiths.isEmpty) {
          return Center(child: Text('No hadiths found', style: h3));
        }

        return ListView.builder(
          itemCount: controller.hadiths.length,
          itemBuilder: (context, index) {
            final hadith = controller.hadiths[index];
            return HadithCard(
              hadith: hadith,
              index: index,
              controller: controller,
            );
          },
        );
      }),
    );
  }
}
