import 'package:flutter/material.dart';


class SearchCard extends StatelessWidget {

  final iconImagePath;
  final String categoryName;
  final String categoryDesc;
  final pageCard;

  SearchCard({
    required this.iconImagePath,
    required this.categoryName,
    required this.categoryDesc,
    required this.pageCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ///animation or picture
              Container(
                height: 100,
                width: 100,
                child: Image.asset(iconImagePath),
              ),
              SizedBox(
                width: 20,
              ),
              ///how do you feel + button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      categoryDesc,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),

                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>pageCard));
                        },
                      child: Center(
                        child: Text(
                          'Search Now',
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,),
                        ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}

