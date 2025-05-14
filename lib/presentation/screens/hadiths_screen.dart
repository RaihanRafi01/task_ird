import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../core/constants/appFonts.dart';
import '../controllers/hadiths_controller.dart';

class HadithsScreen extends StatelessWidget {
  final int chapterId;
  final int bookId;
  final String chapterName;

  const HadithsScreen(
      {required this.chapterId,
        required this.bookId,
        required this.chapterName,
        super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HadithsController>();
    controller.fetchHadiths(chapterId, bookId);

    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor:  AppColors.appColor,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 24,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.hadiths[0].bookName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              chapterName,
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
          return const Center(child: Text('No hadiths found'));
        }

        return ListView.builder(
          itemCount: controller.hadiths.length,
          itemBuilder: (context, index) {
            final hadith = controller.hadiths[index];
            return HadithCard(hadith: hadith, index: index);
          },
        );
      }),
    );
  }
}

class HadithCard extends StatelessWidget {
  final dynamic hadith;
  final int index;

  const HadithCard({required this.hadith, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite, // Background color
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            if (index == 0) _buildChapterHeader(),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(12),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHadithHeader(),
                  Padding(
                    padding:
                    const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        if (hadith.ar != null && hadith.ar!.isNotEmpty)
                          _buildArabicText(),
                        const SizedBox(height: 20),
                        if (hadith.narrator != null && hadith.narrator!.isNotEmpty)
                          _buildNarratorText(),
                        const SizedBox(height: 20),
                        if (hadith.bn != null && hadith.bn!.isNotEmpty)
                          _buildTranslationText(),
                        if (hadith.note != null && hadith.note!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              'Note: ${hadith.note}',
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        _buildReferences(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterHeader() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'hadith.note',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHadithHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/hexagon_icon.svg',
              ),
              Text(
                'B',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hadith No: ",
                        style: h3.copyWith(
                          fontSize: 13,
                          color: AppColors.titleColor,
                        ),
                      ),
                      TextSpan(
                        text: "${hadith.hadithId}",
                        style: h3.copyWith(
                          fontSize: 13,
                          color: AppColors.appColor, // Replace with your desired color
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  hadith.bookName,
                  style: h4.copyWith(
                    fontSize: 12,
                    color: AppColors.subTitleColor
                ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(int.parse(hadith.gradeColor.replaceFirst('#', '0xFF'))),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              hadith.grade ?? 'Sahih',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert_rounded, color: AppColors.btnColorGray),
        ],
      ),
    );
  }

  Widget _buildNarratorText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF009688),
        ),
        children: [
          const TextSpan(
            text: "It is narrated from ",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          TextSpan(
            text: hadith.narrator,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: " (may Allah have mercy on him):",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _buildArabicText() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        hadith.ar ?? '',
        style: const TextStyle(
          fontSize: 20,
          height: 1.8,
          fontFamily: 'AmiriQuran',
        ),
      ),
    );
  }

  Widget _buildTranslationText() {
    return Text(
      hadith.bn ?? '',
      style: const TextStyle(
        fontSize: 15,
        height: 1.5,
      ),
    );
  }

  Widget _buildReferences() {
    return const Text(
      "(See also 51, 2681, 2804, 2941, 2978, 3174, 4553, 5880, 6260, 7196, 7541) (Modern Publication: 6, Islamic Foundation: 8)",
      style: TextStyle(
        fontSize: 12,
        color: Colors.black54,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}