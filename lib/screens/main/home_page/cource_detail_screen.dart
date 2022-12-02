import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:smart_student_academy/providers/caurces.dart';
import 'package:smart_student_academy/utils/app_color.dart';
import 'package:smart_student_academy/utils/widgets/custom_app_bar.dart';
import 'package:smart_student_academy/utils/widgets/custom_text.dart';

class CourceDetailScreen extends StatelessWidget {
  const CourceDetailScreen({
    super.key,
  });

  static const rauteName = '/cource-detail';
  @override
  Widget build(BuildContext context) {
    final String bookId = ModalRoute.of(context)!.settings.arguments as String;
    final cource = Provider.of<Cources>(context).findById(bookId);

    return Scaffold(
      backgroundColor: kBlack,
      appBar: CustomAppBar(
        name: cource.title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  cource.imageUrl,
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'Description',
                color: kWhite,
                fontSize: 20,
                textAlign: TextAlign.justify,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: cource.description,
                color: kWhite,
                fontSize: 16,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'Qualifiation',
                color: kWhite,
                fontSize: 20,
                textAlign: TextAlign.justify,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: cource.qualifiation,
                color: kWhite,
                fontSize: 16,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Cource Fee: ${cource.courceFee.toString()}',
                        color: kWhite,
                        fontSize: 16,
                        textAlign: TextAlign.justify,
                      ),
                      CustomText(
                        text: 'Duration: ${cource.duration}',
                        color: kWhite,
                        fontSize: 16,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ).asGlass(),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: const [
                    Icon(Icons.arrow_circle_down),
                    CustomText(
                      text: 'Join',
                    )
                  ],
                ),
              ).asGlass()
            ],
          ),
        ),
      ),
    );
  }
}
