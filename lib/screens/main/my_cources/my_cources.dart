import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_student_academy/providers/joincource.dart';
import 'package:smart_student_academy/utils/app_color.dart';
import 'package:smart_student_academy/utils/widgets/custom_app_bar.dart';
import 'package:smart_student_academy/utils/widgets/custom_join_cources_item.dart';

class MyCources extends StatelessWidget {
  const MyCources({super.key});

  static const rauteName = '/my-cource';

  @override
  Widget build(BuildContext context) {
    final mycource = Provider.of<JoinCource>(context);
    return Scaffold(
      backgroundColor: kBlack,
      appBar: const CustomAppBar(name: 'My Cources'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mycource.items.length,
              itemBuilder: (context, index) => Card(
                color: kWhite,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: CustomJoinCourcesItem(
                    id: mycource.items.values.toList()[index].id,
                    title: mycource.items.values.toList()[index].title,
                    price: mycource.items.values.toList()[index].price),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
