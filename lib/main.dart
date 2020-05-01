import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'package:online_course/constants.dart';
import 'package:online_course/details_screen.dart';
import 'package:online_course/model/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset('assets/icons/menu.svg'),
                Image.asset('assets/images/user.png')
              ],
            ),
            SizedBox(height: 30),
            Text('Hi, @rsmnarts', style: kHeadingTextStyle),
            Text('Find a course to your learn', style: kSubheadingTextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/search.svg'),
                  SizedBox(width: 16),
                  Text(
                    'Search for anything...',
                    style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Category', style: kTitleTextStyle),
                Text('See All', style: kSubtitleTextStyle),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (ctx, i) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    height: i.isEven ? 200 : 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(categories[i].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(categories[i].name, style: kTitleTextStyle),
                        Text(
                          '${categories[i].numOfCourses} Course',
                          style: TextStyle(color: kTextColor.withOpacity(.5)),
                        ),
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (i) => StaggeredTile.fit(1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
