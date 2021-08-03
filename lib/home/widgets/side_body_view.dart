import 'package:flutter/material.dart';

import '../../../icon_category.dart';

class SideBodyView extends StatelessWidget {
  final Size size;

  const SideBodyView({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitleDescription(context),
            buildCategoryMenu(),
            buildBodyView()
          ],
        ),
      ),
    );
  }

  LimitedBox buildBodyView() {
    return LimitedBox(
      maxHeight: size.height * 0.6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          width: size.width * 0.6,
          margin: const EdgeInsets.only(
            left: 25,
            top: 30,
            right: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(100),
              // topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Theme.of(context).canvasColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/pancakes.png'),
                Text(
                  'Pancakes',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'with Blueberry',
                  style: Theme.of(context).textTheme.headline5,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '420',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        TextSpan(
                          text: ' kcal',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: 5,
      ),
    );
  }

  Widget buildCategoryMenu() {
    return LimitedBox(
      maxHeight: size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                shape: BoxShape.circle,
              ),
              child: iconCategory[index],
            ),
            Text(iconName[index]),
          ],
        ),
        itemCount: 5,
      ),
    );
  }

  Widget buildTitleDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Simple way to find \n',
              style: Theme.of(context).textTheme.headline2,
            ),
            TextSpan(
              text: 'tasty recipes',
              style: TextStyle(
                fontWeight: Theme.of(context).textTheme.headline2!.fontWeight,
                fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                color: Color(0xfffda58f),
              ),
            )
          ],
        ),
      ),
    );
  }
}
