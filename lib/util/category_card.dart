import 'package:flutter/material.dart';
import 'package:halopet/pages/wiki/wiki_page.dart';

class CategoryCard extends StatelessWidget {

  final iconImagePath;
  final String categoryName;
  final pageCard;

  CategoryCard({
    required this.iconImagePath,
    required this.categoryName,
    required this.pageCard,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
    child: GestureDetector(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>pageCard));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange[300],
        ),
        child: Row(
          children: [
            Image.asset(
              iconImagePath,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(categoryName),
          ],
        ),
      ),
    ),
    );
  }
}