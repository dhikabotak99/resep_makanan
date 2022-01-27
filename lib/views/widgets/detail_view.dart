import 'package:flutter/material.dart';
import 'package:resep_makanan2/views/detail_page.dart';
import 'package:bulleted_list/bulleted_list.dart';

class DetailView extends StatelessWidget {
  final String title;
  final String step;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String thumbnailUrl;
  DetailView({
    @required this.title,  
    @required this.step,  
    @required this.ingredient1,
    @required this.ingredient2,
    @required this.ingredient3,
    @required this.ingredient4,
    @required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    int id = 0;
    return ListView(
      children: [
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: 240,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    offset: Offset(
                      0.0,
                      10.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: -6.0,
                  ),
                ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: NetworkImage(thumbnailUrl),
                  width: 240,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.lightBlue,
            width: 400,
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              " Ingredients :",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600),
              textAlign: TextAlign.justify,
            ),
          ),
          BulletedList(
            listItems: [
              Text(
                ingredient1,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                ingredient2,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                ingredient3,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                ingredient4,
                style: TextStyle(color: Colors.black),
              ),
            ]
          ),
          SizedBox(height: 5,),
          Container(
            color: Colors.lightBlue,
            width: 400,
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              " Step :",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              step,
              style: TextStyle(
                  color: Colors.black,
                  // fontStyle: FontStyle.italic,
                  fontSize: 15,),
                  textAlign: TextAlign.justify,
            )
          ),
          
          // Align(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 5.0),
          //     child: Text(
          //       video,
          //       style: TextStyle(
          //         fontSize: 19,
          //       ),
          //       overflow: TextOverflow.ellipsis,
          //       maxLines: 2,
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          //   alignment: Alignment.center,
          // ),
        ],
      )
      ],
    );
  }
}