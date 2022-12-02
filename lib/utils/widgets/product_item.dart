import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:smart_student_academy/providers/cource.dart';
import 'package:smart_student_academy/providers/joincource.dart';
import 'package:smart_student_academy/screens/main/home_page/cource_detail_screen.dart';
import 'package:smart_student_academy/utils/app_color.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final joincource = Provider.of<JoinCource>(context, listen: false);
    return Consumer<Cource>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              header: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          value.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ).asGlass(),
              ),
              footer: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cource Fee: ${value.courceFee.toString()}',
                      style: const TextStyle(color: kWhite),
                    ),
                    IconButton(
                      onPressed: () {
                        value.toggleFavoriteStatus();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: value.isFavorite ? kRed : kWhite,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        joincource.addItem(
                            value.id, value.title, value.courceFee);
                      },
                      icon: Icon(
                        Icons.add_circle_outline_sharp,
                        color: value.isEnrolled ? kRed : kWhite,
                      ),
                    ),
                  ],
                ),
              ).asGlass(),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CourceDetailScreen.rauteName,
                      arguments: value.id);
                },
                child: Image.network(
                  value.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
