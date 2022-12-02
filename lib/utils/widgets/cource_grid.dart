import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_student_academy/providers/caurces.dart';
import 'package:smart_student_academy/utils/widgets/product_item.dart';

class CourceGrid extends StatelessWidget {
  const CourceGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final courcesData = Provider.of<Cources>(context);
    final cources = courcesData.cources;

    return GridView.builder(
      itemCount: cources.length,
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (context) => cources[index],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 1,
      ),
    );
  }
}
